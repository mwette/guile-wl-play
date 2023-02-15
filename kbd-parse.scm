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
  #:export (kbd-read)
  )
(define sf-port
  (case 3 ((1) #t) ((2) (open-output-file "foo")) (else #f)))
(define (sf fmt . args) (apply simple-format sf-port fmt args))
(use-modules (ice-9 pretty-print))
(define pp pretty-print)


(define char-word?
  (let ((digit "0123456789")
        (ucase "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        (lcase "abcdefghijklmnopqrstuvwxyz")
        (cs (char-set #\_)))
    (string->char-set digit cs)
    (string->char-set! lcase cs)
    (string->char-set! ucase cs)
    (lambda (ch) (char-set-contains? cs ch))))

(define char-punct?
  (let ((cs (string->char-set ",;.!()[]{}=+-")))
    (lambda (ch) (char-set-contains? cs ch))))

(define rls reverse-list->string)

(define (kbd-read str)
  (with-input-from-string str
    (lambda ()
      (let loop ((rz '()) (cl '()) (st 0) (ch (read-char)))
        ;;(if sf-port (sf "ch = ~S\n" ch))
        (case st
          ((0)
           (cond ;; [init]
            ((eof-object? ch) (reverse rz))
            ((char-whitespace? ch) (loop rz cl st (read-char)))
            ((char-word? ch) (loop rz cl 1 ch))
            ((char-numeric? ch) (loop rz cl 2 ch))
            ((char=? #\" ch) (loop rz cl 3 (read-char)))
            ((char=? #\< ch) (loop rz cl 4 (read-char)))
            ((char-punct? ch) (loop (acons 'punct ch rz) '() 0 (read-char)))
            (else (error "st 0"))))
          ((1) ;; word
           (cond
            ((eof-object? ch) (loop (acons 'word (rls cl) rz) '() 0 ch))
            ((char-word? ch) (loop rz (cons ch cl) st (read-char)))
            (else (loop (acons 'word (rls cl) rz) '() 0 ch))))
          ((2) ;; number
           (cond
            ((eof-object? ch) (loop (acons 'num (rls cl) rz) '() 0 ch))
            ((char-numeric? ch) (loop rz (cons ch cl) st (read-char)))
            (else (loop (acons 'num (rls cl) rz) '()  0 ch))))
          ((3) ;; string
           (cond
            ((eof-object? ch) (error "bad string"))
            ((char=? #\\ ch)
             (loop rz (cons* (read-char) #\\ cl) st (read-char)))
            ((char=? #\" ch)
             (loop (acons 'string (rls cl) rz) '() 0 (read-char)))
            (else (loop rz (cons ch cl) st (read-char)))))
          ((4) ;; ksym
           (cond
            ((eof-object? ch) (error "bad string"))
            ((char=? #\> ch)
             (loop (acons 'keysym (rls cl) rz) '() 0 (read-char)))
            (else (loop rz (cons ch cl) st (read-char)))))
          ((9)
           (reverse rz))
          (else
           (error "else")))))))

;; charcodes for punct: "{};=[]+"


;;(pp (kbd-read "hello \"he xka \" 123"))

;;; --- last line ---

