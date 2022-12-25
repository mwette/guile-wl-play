#!/opt/local/bin/guile -s
# -*- scheme -*-
!#

#|
int, uint: 32-bit signed or unsigned integer.

fixed: 24.8 bit signed fixed-point numbers.

object: 32-bit object ID.

new_id: 32-bit object ID which allocates that object when received.
    OR string, uint, uint (interface, version, new id)

In addition to these primitives, the following other types are used:

string: A string, prefixed with a 32-bit integer specifying its length
    (in bytes, including null terminator), followed by the string contents
    and a NUL terminator, padded to 32 bits with undefined data. The 
    encoding is not specified, but in practice UTF-8 is used. 

array: A blob of arbitrary data, prefixed with a 32-bit integer specifying
    its length (in bytes), then the verbatim contents of the array, padded
    to 32 bits with undefined data.

fd: 0-bit value on the primary transport, but transfers a file descriptor
     to the other end using the ancillary data in the Unix domain socket
     message (msg_control).

enum: A single value (or bitmap) from an enumeration of known constants,
    encoded into a 32-bit integer.


=============

every message starts with header

object-id : 32 bit
msg-size : 16 bit (including header)
opcode : 16 bit


object-id 0 is the null object
object-id 1 is reserved as wayland display singleton

client ids are in range: 1-0xFeFFFFFF; server: 0xFF000000-0xFFFFFFFF

|#

#|
debug w/ socat
  guile xxx (create /tmp/mysocketdn
$ socat UNIX-CONNECT:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY UNIX-LISTEN:wlsock
run program to wlsock
|#

;;(use-modules (nyacc lang sx-util))
(use-modules (sxml simple))
(use-modules (sxml fold))
(use-modules ((sxml xpath) #:select (sxpath)))
(use-modules (sxml match))
(use-modules (rnrs bytevectors))
(use-modules (system foreign))
(use-modules (ice-9 match))
(use-modules (ice-9 pretty-print))
(use-modules ((srfi srfi-1) #:select (fold fold-right pair-for-each)))
(define pp pretty-print)
(define (sf fmt . args) (apply simple-format #t fmt args))
(define (ss fmt . args) (apply simple-format #f fmt args))
(define (sferr fmt . args) (apply simple-format (current-error-port) fmt args))

;; TODO
;; 1) deal with fixed type

;;(define (get-if tree name) ;; name = "wl_display"
;;  (protocol . interface (@ name "wl_display"))

(define endness (native-endianness))
(define msg-size-offset
  (cond
   ((equal? endness (endianness big)) 4)
   ((equal? endness (endianness little)) 6)))
(define opcode-offset
  (cond
   ((equal? endness (endianness big)) 6)
   ((equal? endness (endianness little)) 4)))
    
;; ============================================================================

(define (make-encoder opcode names types)
  `(lambda (obj-id bv ix ,@names)

     (define (encode-body)
       ,@(let loop ((rz '()) (fd #f) (ix 8) (name #f) (type #f)
                    (nl names) (tl types))
           (cond
            (name
             (case type
               ((int enum)
                (loop
                 (cons `(bytevector-s32-native-set! bv (+ ix ,ix) ,name) rz)
                 fd (+ ix 4) #f #f nl tl))
               ((uint new_id object)
                (loop
                 (cons `(bytevector-u32-native-set! bv (+ ix ,ix) ,name) rz)
                 fd (+ ix 4) #f #f nl tl))
               ((fixed)
                (loop
                 (cons `(bytevector-s32-native-set! bv (+ ix ,ix) ,name) rz)
                 fd (+ ix 4) #f #f nl tl))
               ((string)
                (reverse
                 (cons
                  (if (null? nl)
                      `(enc-string bv (+ ix ,ix) ,name)
                      `(let ((ix (enc-string bv (+ ix ,ix) ,name)))
                         ,@(loop '() fd 0 #f #f nl tl)))
                  rz)))
               ((array)
                (reverse
                 (cons
                  (if (null? nl)
                      `(enc-array bv (+ ix ,ix) ,name)
                      `(let ((ix (enc-array bv (+ ix ,ix) ,name)))
                         ,@(loop '() fd 0 #f #f nl tl)))
                  rz)))
               ((fd)
                (loop rz `(enc-fd fd) ix #f #f nl tl))
               (else
                (error "coding error"))))
            ((pair? nl)
             (loop rz fd ix (car nl) (car tl) (cdr nl) (cdr tl)))
            (else
             (reverse (cons `(values (+ ix ,ix) ,fd) rz))))))

     (call-with-values encode-body
       (lambda (msg-size control)
         (bytevector-u32-native-set! bv ix obj-id)
         (bytevector-u16-native-set! bv (+ ix ,msg-size-offset) msg-size)
         (bytevector-u16-native-set! bv (+ ix ,opcode-offset) ,opcode)
         (values msg-size control)))))

(define (make-decoder opcode names types)
  `(lambda (obj-id bv ix cm)
     (let*-values
         ,(map
           (lambda (n t)
             (case t
               ((int enum) `((,n ix) (dec-s32 bv ix)))
               ((uint new_id object) `((,n ix) (dec-u32 bv ix)))
               ((fixed) `((,n ix) (dec-fixed bv ix)))
               ((string) `((,n ix) (dec-string bv ix)))
               ((array) `((,n ix) (dec-array bv ix)))
               ((fd) `((,n ix) (dec-fd cm)))
               (else (sf "type=~S\n" t) (error "bad type"))))
           names types)
       (values obj-id ,@names))))

(define (process-iface/c sx ix ifl)

  (define (fix-args strings) (reverse (map string->symbol strings)))

  (define (doc-it form type name desc)
    (let ((docstr (string-append type " for " name)))
      (match form
        (`(lambda ,args . ,rest)
         `(lambda ,args ,docstr . ,rest))
        (`(lambda* ,args . ,rest)
         `(lambda* ,args ,docstr . ,rest)))))

  (define (process-ent sx rx ex seed)
    (sxml-match sx
      ((description . ,_)
       (values rx ex seed))

      ((request (@ (name ,name)) (description . ,desc) . ,args)
       (let loop ((names '()) (types '()) (args args))
         (if (null? args)
             (let* ((proc (make-encoder rx (fix-args names) (fix-args types)))
                    ;;(proc (doc-it proc "request encoder" name desc))
                    (entry `((name . ,name) (type . request)
                             (indx . ,rx) (proc . ,proc))))
               (values (1+ rx) ex (cons entry seed)))
             (sxml-match (car args)
               ((arg (@ (name ,name) (type "new_id") (interface ,_)))
                (loop (cons name names) (cons "new_id" types) (cdr args)))
               ((arg (@ (name ,name) (type "new_id")))
                (loop (cons* name "version" "interface" names)
                      (cons* "new_id" "uint" "string" types) (cdr args)))
               ((arg (@ (name ,name) (type ,type)))
                (loop (cons name names) (cons type types) (cdr args)))))))
      
      ((event (@ (name ,name)) (description . ,desc) . ,args)
       (let loop ((names '()) (types '()) (args args))
         (if (null? args)
             (let* ((proc (make-decoder ex (fix-args names) (fix-args types)))
                    (proc (doc-it proc "event decoder" name desc))
                    (entry `((name . ,name) (type . event)
                             (indx . ,ex) (proc . ,proc))))
               (values rx (1+ ex) (cons entry seed)))
             (sxml-match (car args)
               ((arg (@ (name ,name) (type ,type)))
                (loop (cons name names) (cons type types) (cdr args)))))))

      ((enum . ,ents)
       (values rx ex seed))

      ((enum (@ (name ,name)) (description . ,_) . ,ents)
       (sferr "catch 1\n")
       (values rx ex seed))

      ((enum (@ (name ,name)) . ,ents)
       (sferr "catch 2\n")
       (values rx ex seed))

      (,_ (sf "process-ent MISSED:\n") (pp sx) (quit))))

  (sxml-match sx
    ((interface (@ (name ,name) (version ,version)) . ,elts)
     (call-with-values
         (lambda () (fold-values process-ent elts 0 0 '()))
       (lambda (mr me ents)
         (values (1+ ix) (cons (cons* name ix (reverse ents)) ifl)))))))

(define get-these
  '(
    ("wl_display" . "get_registry")
    ("wl_registry" . "bind")
    ("wl_registry" . "global")
    ("wl_keyboard" . "enter")
    ("wl_shm" . "create_pool")
    ))

(define (lkup dict if el)
  (assoc-ref (assoc-ref dict if) el))

(define (for-each-pair proc ls)
  (pair-for-each
   (lambda (pair) (proc (car pair) (cdr pair)))
   ls))
   
(define (for-each-method proc ifl)
  (for-each-pair
   (lambda (meth next)
     (let* ((name (assq-ref meth 'name))
            (type (assq-ref meth 'type))
            (indx (assq-ref meth 'indx))
            (code (assq-ref meth 'proc)))
       (proc name type indx code next)))
   ifl))

(define (map-each-pair proc ls)
  (let loop ((ls ls))
    (if (null? ls) '()
        (cons (proc (car ls) (cdr ls)) (loop (cdr ls))))))
   
(define (map-each-method proc ifl)
  (map-each-pair
   (lambda (meth next)
     (let* ((name (assq-ref meth 'name))
            (type (assq-ref meth 'type))
            (indx (assq-ref meth 'indx))
            (code (assq-ref meth 'proc)))
       (proc name type indx code next)))
   ifl))

(define (fold-each-method proc seed ifl)
  (let loop ((ifl ifl))
    (if (null? ifl) seed
        (let* ((meth (car ifl))
               (name (assq-ref meth 'name))
               (type (assq-ref meth 'type))
               (indx (assq-ref meth 'indx))
               (code (assq-ref meth 'proc))
               (tail (cdr ifl)))
          (proc name type indx code tail (loop tail))))))

;;;

(use-modules (srfi srfi-37))

;;(define (1arg name) (lambda (args

(define options
  '())

(define (parse-args args)
  (args-fold (cdr args) options
             (lambda (opt name args dict) (error "bad option: ~A" name))
             (lambda (file dict) (cons file dict))
             '()))

(define (main)
  (let* ((args (parse-args (program-arguments)))
         (spec (car args))
         (base (basename spec ".xml"))
         (sxml (call-with-input-file spec
                 (lambda (port) (xml->sxml port #:trim-whitespace? #t))))
         (ifl ((sxpath '(protocol interface)) sxml))
         (cil (call-with-values
                  (lambda () (fold-values process-iface/c ifl 0 '()))
                (lambda (ix cil) (reverse cil))))
         (code (string-append base "-client.scm"))
         (port (open-output-file code))
         (sf (lambda (fmt . args) (apply simple-format port fmt args)))
         (pp (lambda (exp) (pretty-print exp port)))
         )
    ;;
    (sf ";; ~A - from ~A\n\n" code spec)
    (sf "(define-public wayland-index-dict\n  '(")
    (for-each-pair
     (lambda (iface next)
       (sf "(~A . ~A)" (car iface) (cadr iface))
       (if (pair? next) (sf "\n    ")))
     cil)
    (sf "))\n\n")
    ;; opcode dict
    (sf "(define-public wayland-opcode-dict-vec\n")
    (sf "  #(")
    (for-each-pair
     (lambda (iface next)
       (sf "(")
       (for-each-method
        (lambda (name type indx code next)
          (sf "(~A . ~A)" name indx)
          (if (pair? next) (sf " ") (sf ")")))
        (cddr iface))
       (if (pair? next) (sf "\n    ")  (sf "))\n")))
     cil)
    (sf "\n")
    ;; encoders
    (for-each
     (lambda (iface)
       (let ((if-name (car iface)))
         (for-each-method
          (lambda (name type indx code next)
            (if (eq? type 'request)
                (let ((fn (string->symbol (ss "encode-~A:~A" if-name name))))
                  (pp `(define-public ,fn ,code)) (newline port))))
          (cddr iface))))
     cil)
    ;; decoders
    (pp
     `(define-public wl-decoder-vec-vec
        (vector
         ,@(map-each-pair
            (lambda (iface next)
              `(vector
                ,@(fold-each-method
                   (lambda (name type indx code next seed)
                     (if (eq? type 'event) (cons code seed) seed))
                   '() (cddr iface))))
            cil))))
    (newline port)
    ;;
    (pp
     `(define-public (make-wl-handler-vec-vec)
        (vector
         ,@(map-each-pair
            (lambda (iface next)
              `(make-vector
                ,(length
                  (filter
                   (lambda (x) (eq? 'event (assq-ref x 'type)))
                   (cddr iface)))))
            cil))))
    (newline port)
    ;;
    (sf ";; --- last line ---\n")
    (if port (close-port port))
    0))


(main)

;; --- last line ---
