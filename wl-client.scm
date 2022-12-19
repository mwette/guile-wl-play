
(define-module (wl-client)
  #:export (
            enc-u32 dec-u32 enc-s32 dec-s32
                    enc-string dec-string enc-array dec-array enc-fd dec-fd
                    bytevector-sint-native-ref bytevector-sint-native-set!
                    msg-size-offset opcode-offset
                    )
  #:declarative? #f
  #:use-module (sockmsg)
  )
(use-modules (srfi srfi-11))
(use-modules (rnrs bytevectors))
(use-modules (system foreign))

(define (sf fmt . args) (apply simple-format #t fmt args))
(define (sferr fmt . args) (apply simple-format (current-error-port) fmt args))
(use-modules (ice-9 pretty-print))
(define pp pretty-print)

(use-modules (ice-9 format))

(define* (fmtbv/x bv st ct #:optional (sc 1))
  (let ((p (open-output-string)))
    (let loop ((ix st) (ct ct))
      (cond
       ((zero? ct) (get-output-string p))
       ((zero? (remainder ix 4))
        (if (zero? (remainder ix sc))
            (format p " ~2,'0x" (bytevector-u8-ref bv ix))
            (format p "~2,'0x" (bytevector-u8-ref bv ix)))
        (loop (1+ ix) (1- ct)))
       (else
        (if (zero? (remainder ix sc))
            (format p " ~2,'0x" (bytevector-u8-ref bv ix))
            (format p "~2,'0x" (bytevector-u8-ref bv ix)))
        (loop (1+ ix) (1- ct)))))))
(export fmtbv/x)

(define endness (native-endianness))
(define sizeof-int (sizeof int))

(define msg-size-offset
  (cond
   ((equal? endness (endianness big)) 4)
   ((equal? endness (endianness little)) 6)))
(define opcode-offset
  (cond
   ((equal? endness (endianness big)) 6)
   ((equal? endness (endianness little)) 4)))
    

(define (bytevector-sint-native-ref bv ix)
  (bytevector-sint-ref bv ix endness sizeof-int))

(define (bytevector-sint-native-set! bv ix value)
  (bytevector-sint-set! bv ix value endness sizeof-int))

(define bytevector-size_t-ref
  (case (sizeof size_t)
    ((4) bytevector-s32-native-ref)
    ((8) bytevector-s64-native-ref)))

(define bytevector-size_t-set!
  (case (sizeof size_t)
    ((4) bytevector-s32-native-set!)
    ((8) bytevector-s64-native-set!)))

(define-syntax-rule (enc-u32 bv ix val)
  (values (bytevector-u32-native-set! bv ix) (+ ix 4)))

(define-syntax-rule (dec-u32 bv ix)
  (values (bytevector-u32-native-ref bv ix) (+ ix 4)))

(define-syntax-rule (enc-s32 bv ix val)
  (values (bytevector-s32-native-set! bv ix) (+ ix 4)))

(define-syntax-rule (dec-s32 bv ix)
  (values (bytevector-s32-native-ref bv ix) (+ ix 4)))

(define-syntax-rule (dec-fixed bv ix)
  (values (bytevector-s32-native-ref bv ix) (+ ix 4)))

(define (enc-string bv ix str) ;; => ix
  (let* ((ln (1+ (string-length str)))
         (ln-1 (1- ln)))
    (bytevector-u32-native-set! bv ix ln)
    (bytevector-copy! (string->utf8 str) 0 bv (+ ix 4) ln-1)
    (bytevector-u8-set! bv (+ ix 4 ln) 0)
    (* (quotient (+ ix 4 ln 3) 4) 4)))

(define (dec-string bv ix) ;; => values str ix
  (let* ((ln (bytevector-u32-native-ref bv ix))
         (ln-1 (1- ln))
         (bs (make-bytevector ln-1)))
    (bytevector-copy! bv (+ ix 4) bs 0 ln-1)
    (values
     (utf8->string bs)
     (* (quotient (+ ix 4 ln 3) 4) 4))))

(define (enc-array bv ix array) ;; => ix
  (let* ((ln (bytevector-length array)))
    (bytevector-u32-native-set! bv ix ln)
    (bytevector-copy! array 0 bv (+ ix 4) ln)
    (* (quotient (+ ix 4 ln 3) 4) 4)))

(define (dec-array bv ix) ;; => values abv ix
  (let* ((ln (bytevector-u32-native-ref bv ix))
         (array (make-bytevector ln)))
    (bytevector-copy! bv (+ ix 4) array 0 ln)
    (values array (* (quotient (+ ix 4 ln 3) 4) 4))))

(define cmsghdr-size (+ (sizeof size_t) (* 2 (sizeof int))))

(define fd-level-oset (sizeof size_t))
(define fd-type-oset (+ fd-level-oset (sizeof int)))
(define fd-cmsg-size (+ cmsghdr-size (sizeof int)))

(define (enc-fd fd)
  (let* ((bv (make-bytevector fd-cmsg-size #f)))
    (bytevector-size_t-set! bv 0 fd-cmsg-size)
    (bytevector-sint-native-set! bv fd-level-oset SOL_SOCKET)
    (bytevector-sint-native-set! bv fd-type-oset SCM_RIGHTS)
    (bytevector-sint-native-set! bv cmsghdr-size fd)
    bv))

(define (dec-fd cm)
  (bytevector-sint-native-ref cm cmsghdr-size))

(include-from-path "wl-client-code.scm")

;; --- last line ---


  
