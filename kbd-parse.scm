#!/bin/bash
# -*- scheme -*-

exec guile $0 "$@"
!#

;; keycodes: scan code to keysym
;;    <FOO> = 24 ;
;; type : what modifier do
;;    type "foo" { ??? }
;; key symbols : keysyms to symbols
;;    <ESC> => Escape

(define-module (kbd-parse)
  #:export (kbd-read parse-kbd)
  )
(define sf-port
  (case 1 ((1) #t) ((2) (open-output-file "foo")) (else #f)))
(define (sf fmt . args) (apply simple-format sf-port fmt args))
(use-modules (ice-9 pretty-print))
(define pp pretty-print)

(use-modules (ice-9 pretty-print))
(define (pperr exp)
  (pretty-print exp (current-error-port) #:per-line-prefix "  "))
(define (sferr fmt . args)
  (apply simple-format (current-error-port) fmt args))


(include-from-path "kbd-parse/kbd-tab.scm")
(include-from-path "kbd-parse/kbd-act.scm")

(define digit "0123456789")

(define char-word?
  (let ((ucase "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        (lcase "abcdefghijklmnopqrstuvwxyz")
        (cs (char-set #\_)))
    (string->char-set digit cs)
    (string->char-set! lcase cs)
    (string->char-set! ucase cs)
    (lambda (ch) (char-set-contains? cs ch))))

(define char-digit?
  (let ((cs (string->char-set digit)))
    (lambda (ch) (char-set-contains? cs ch))))

(define char-hex?
  (let ((cs (string->char-set "0123456789abcdefABCDEF")))
    (lambda (ch) (char-set-contains? cs ch))))

(define char-punct?
  (let ((cs (string->char-set ",;.!()[]{}=+-")))
    (lambda (ch) (char-set-contains? cs ch))))

(define (tok-str->val str)
  (assoc-ref kbd-mtab str))

(define kbd-read
  (let (($word (tok-str->val '$word))
        ($keysym (tok-str->val '$keysym))
        ($fixed (tok-str->val '$fixed))
        ($string (tok-str->val '$string))
        ($end (tok-str->val '$end))
        (eof (with-input-from-string "" read-char)))

    (define rls reverse-list->string)

    (define (return key val)
      (cond
       ((eq? key $word)
        (cond
         ((assoc-ref kbd-mtab val) =>
          (lambda (key) (cons key val)))
         (else (cons $word val))))
       ((eq? key 'punct)
        (let ((sval (string val)))
          (cons (assoc-ref kbd-mtab sval) sval)))
       (else
        (cons key val))))

    (lambda ()      
      (let loop ((cl '()) (st 0) (ch (read-char)))
        (case st
          ((0)
           (cond ;; [init]
            ((eof-object? ch) (return $end eof))
            ((char-whitespace? ch) (loop cl st (read-char)))
            ((char-word? ch) (loop cl 1 ch))
            ((char=? ch #\0) (loop (cons ch cl) 21 (read-char)))
            ((char-digit? ch) (loop cl 2 ch))
            ((char=? #\" ch) (loop cl 3 (read-char)))
            ((char=? #\< ch) (loop cl 4 (read-char)))
            ((char-punct? ch) (return 'punct ch))
            (else (error "st 0"))))
          ((1) ;; word
           (cond
            ((eof-object? ch) (return $word (rls cl)))
            ((char-word? ch) (loop (cons ch cl) st (read-char)))
            ((char-digit? ch) (loop (cons ch cl) st (read-char)))
            (else (unread-char ch) (return $word (rls cl)))))
          ((2) ;; decimal number
           (cond
            ((eof-object? ch) (return $fixed (rls cl)))
            ((char-numeric? ch) (loop (cons ch cl) st (read-char)))
            (else (unread-char ch) (return $fixed (rls cl)))))
          ((21) ;; other number
           (cond
            ((eof-object? ch) (return $fixed (rls cl)))
            ((char=? ch #\x) (loop (cons ch cl) 22 (read-char)))
            ((char-numeric? ch) (loop (cons ch cl) st (read-char)))
            (else (unread-char ch) (return $fixed (rls cl)))))
          ((22) ;; hex
           (cond
            ((eof-object? ch) (return $fixed (rls cl)))
            ((char-hex? ch) (loop (cons ch cl) st (read-char)))
            (else (unread-char ch) (return $fixed (rls cl)))))
          ((3) ;; string
           (cond
            ((eof-object? ch) (throw 'kbd-error "open string"))
            ((char=? #\\ ch) (loop (cons* (read-char) #\\ cl) st (read-char)))
            ((char=? #\" ch) (return $string (rls cl)))
            (else (loop (cons ch cl) st (read-char)))))
          ((4) ;; ksym
           (cond
            ((eof-object? ch) (return $keysym (rls cl)))
            ((char=? #\> ch) (return $keysym (rls cl)))
            (else (loop (cons ch cl) st (read-char)))))
          (else
           (throw 'kbd-error "reader error")))))))

;; =============================================================================

(define $default 1)
(define $error 2)

(define (vector-map proc vec)		; see (srfi srfi-43)
  (let* ((ln (vector-length vec)) (res (make-vector ln)))
    (let loop ((ix 0))
      (unless (= ix ln)
	(vector-set! res ix (proc ix (vector-ref vec ix)))
	(loop (1+ ix))))
    res))

(define (wrap-action actn)		; see util.scm
  (define (mkarg i) (string->symbol (string-append "$" (number->string i))))
  (define (make-arg-list n) (let loop ((r '(. $rest)) (i 1))
			      (if (> i n) r (loop (cons (mkarg i) r) (1+ i)))))
  (cons* 'lambda (make-arg-list (car actn)) (cdr actn)))

(define (make-xct av env)
  (if (procedure? (vector-ref av 0))
      av
      (vector-map (lambda (ix f)
		    (eval f (or env (current-module))))
		  (vector-map (lambda (ix actn) (wrap-action actn)) av))))

(define (dmsg/n s t a ntab)
  (let ((t (or (assq-ref ntab t) t)))
    (cond
     ((not a) (sferr "state ~S, token ~S\t=> parse error\n" s t))
     ((positive? a) (sferr "state ~S, token ~S  => shift, goto ~S\n" s t a))
     ((negative? a) (sferr "state ~S, token ~S  => reduce ~S\n" s t (- a)))
     ((zero? a) (sferr "state ~S, token ~S  => accept\n" s t))
     (else (error "coding error in (nyacc parse)")))))

(define (parse-error state laval)
  (let* ((sp (source-properties laval))
         (fn (or (assq-ref sp 'filename)
                 (port-filename (current-input-port))
                 "(unknown)"))
	 (ln (1+ (or (assq-ref sp 'line) (port-line (current-input-port))))))
    (throw 'nyacc-error
	   "~A:~A: parse failed at state ~A, on input ~S"
	   fn ln (car state) (cdr laval))))

(define* (make-lalr-parser/num mach #:key (skip-if-unexp '()) interactive env)
  (let* ((len-v (assq-ref mach 'len-v))
	 (rto-v (assq-ref mach 'rto-v))
	 (pat-v (assq-ref mach 'pat-v))
	 (xct-v (make-xct (assq-ref mach 'act-v) env))
	 (ntab (assq-ref mach 'ntab))
	 (start (assq-ref (assq-ref mach 'mtab) '$start)))
    (lambda* (lexr #:key debug)
      (let loop ((state (list 0))	; state stack
		 (stack (list '$@))	; semantic value stack
		 (nval #f)		; non-terminal from prev reduction
		 (lval #f))		; lexical value (from lex'r)
	(cond
	 ((and interactive nval
	       (eqv? (car nval) start)
	       (zero? (car state)))     ; done
	  (cdr nval))
	 ((not (or nval lval))
	  (if (eqv? $default (caar (vector-ref pat-v (car state))))
	      (loop state stack (cons-source stack $default #f) lval)
	      (loop state stack nval (lexr))))		 ; reload
	 (else
	  (let* ((laval (or nval lval))
		 (tval (car laval))
		 (sval (cdr laval))
		 (stxl (vector-ref pat-v (car state)))
		 (stx (or (assq-ref stxl tval)
			  (and (not (memq tval skip-if-unexp))
			       (assq-ref stxl $default))
			  #f)))		; error
	    (if debug (dmsg/n (car state) (if nval tval sval) stx ntab))
	    (cond
	     ((eq? #f stx)		; error
	      (if (memq tval skip-if-unexp)
		  (loop state stack #f #f)
		  (parse-error state laval)))
	     ((negative? stx)		; reduce
	      (let* ((gx (abs stx))
		     (gl (vector-ref len-v gx))
		     ($$ (apply (vector-ref xct-v gx) stack))
		     (pobj (if (zero? gl) laval (list-tail stack (1- gl))))
		     (pval (source-properties pobj))
		     (tval (cons-source pobj (vector-ref rto-v gx) $$)))
		(if (supports-source-properties? $$)
		    (set-source-properties! $$ pval))
		(loop (list-tail state gl) (list-tail stack gl) tval lval)))
	     ((positive? stx)		; shift
	      (loop (cons stx state) (cons-source laval sval stack) 
		    #f (if nval lval #f)))
	     (else			; accept
	      (car stack))))))))))

;; =============================================================================

(define raw-parser (make-lalr-parser/num (acons 'act-v kbd-act-v kbd-tables)))

(define* (parse-kbd)
  (raw-parser kbd-read))

(define-public (test-reader-lo filename)
  (with-input-from-file filename
    (lambda ()
      (let loop ((tok (kbd-read)))
        (unless (eof-object? (cdr tok))
          (pp tok)
          (loop (kbd-read)))))))
  
(define-public (test-reader-hi filename)
  (pp (with-input-from-file filename parse-kbd)))
  
;;; --- last line ---
