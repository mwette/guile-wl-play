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

(define (kbd-read)
  (let loop ((rz '()) (cl '()) (st 0) (ch (read-char)))
    ;;(if sf-port (sf "ch = ~S\n" ch))
    (case st
      ((0)
       (cond ;; [init]
        ((eof-object? ch) ch)
        ((char-whitespace? ch) (loop rz cl st (read-char)))
        ((char-word? ch) (loop rz cl 1 ch))
        ((char-numeric? ch) (loop rz cl 2 ch))
        ((char=? #\" ch) (loop rz cl 3 (read-char)))
        ((char=? #\< ch) (loop rz cl 4 (read-char)))
        ((char-punct? ch) (cons 'punct ch))
        (else (error "st 0"))))
      ((1) ;; word
       (cond
        ((eof-object? ch) (cons 'word (rls cl)))
        ((char-word? ch) (loop rz (cons ch cl) st (read-char)))
        (else (unread-char ch) (cons 'word (rls cl)))))
      ((2) ;; number
       (cond
        ((eof-object? ch) (cons 'num (rls cl)))
        ((char-numeric? ch) (loop rz (cons ch cl) st (read-char)))
        (else (unread-char ch) (cons 'num (rls cl)))))
      ((3) ;; string
       (cond
        ((eof-object? ch) (error "bad string"))
        ((char=? #\\ ch) (loop rz (cons* (read-char) #\\ cl) st (read-char)))
        ((char=? #\" ch) (cons 'string (rls cl)))
        (else (loop rz (cons ch cl) st (read-char)))))
      ((4) ;; ksym
       (cond
        ((eof-object? ch) (error "bad string"))
        ((char=? #\> ch) (cons 'keysym (rls cl)))
        (else (loop rz (cons ch cl) st (read-char)))))
      (else
       (error "else")))))

(define (parse-keycodes str)
  (with-input-from-string str
    (lambda ()
      (letrec
          ((fatal
            (lambda (msg) (throw 'kbd-parse msg)))

           (p-top
            (lambda (lxm)
              (unless (equal? lxm '(word . "xkb_keymap")) (fatal "11"))
              (unless (equal? (kbd-read) '(punct . "{")) (fatal "12"))
              (let loop ((tok (kbd-read)))
                (cond
                 ((equal? tok '(punct . "}")) 'done)
                 ((equal? tok '(word . "xkb_keycodes")) (p-codes tok))
                 ((equal? tok '(word . "xkb_types")) (p-types tok))
                 ((equal? tok '(word . "xkb_compatibility")) (p-compat tok))
                 ((equal? tok '(word . "xkb_symbols")) (p-symbols tok))
                 (else (fatal "13"))))))

           (p-codes                    ; keycodes
            (lambda (lxm)
              (unless (equal? lxm '(word . "xkb_keycodes")) (fatal "21"))
              (unless (equal? (kbd-read) '(punct . "{")) (fatal "22"))
               (let loop ((tok (kbd-read)))
                 (cond
                  ((equal? tok '(punct . "}")) 'done)
                  ((equal? tok '(word . "minimum")) #t)
                  ((equal? tok '(word . "maximum")) #t)
                  ((equal? (car tok) 'ksym)
                   (unless (equal? (kdb-read) '(punct . "=")) (fatal "24"))
                   (let ((tok (kdb-read)))
                     (unless (equal? (car tok) 'num) (fatal "25"))
                     ;; number 
                     ))))))

           (p-1code
             (lambda (lxm)
               (let* ((ksym (cdr lxm))  ; keysym
                      (lxm (xkb-read))  ; =
                      (lxm (xkb-read))
                      (code (string->number (cdr lxm)))) ; scan code
                 (cons ksym code))))
           
           (p-types
            (lambda (tok)
              #f))

           (p-compat
            (lambda (tok)
              #f))

           (p-symbols
            (lambda (tok)
              #f))
           
           )
        (p-top (kbd-read))))))


;;; --- last line ---

