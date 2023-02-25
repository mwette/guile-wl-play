;; kbd-parse.scm

;; Copyright (C) 2023 Matthew Wette
;;
;; This library is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 3 of the License, or (at your option) any later version.
;;
;; This library is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public License
;; along with this library; if not, see <http://www.gnu.org/licenses/>.

;; approach is to encode keyboard-state + keypress into event-vectors
;;   a => [#\a];  shift+a => [#\A];  control+a => [control #\a]
;;   RGHT => 'right ...
;;   unknown => wl-keycode
;; xkb starts codes at 9, wayland uses xkb-8, so starts at 1

;; keysym.txt format:a
;;   keycodes: scan code to keysym
;;      <FOO> = 24 ;
;;   type : what modifier do
;;      type "foo" { ??? }
;;   key symbols : keysyms to symbols
;;      <ESC> => Escape

;; https://wiki.archlinux.org/title/X_keyboard_extension
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Keyboard-Events.html
;;   meta control shift hyper super alt

(define-module (kbd-parse)
  #:export (kbd-read parse-kbd))

(define sf-port
  (case 1 ((1) #t) ((2) (open-output-file "foo")) (else #f)))
(define (sf fmt . args) (apply simple-format sf-port fmt args))
(define (sferr fmt . args)
  (apply simple-format (current-error-port) fmt args))
(use-modules (ice-9 pretty-print))
(define pp pretty-print)
(define (pperr exp)
  (pretty-print exp (current-error-port) #:per-line-prefix "  "))

(include-from-path "kbd-parse/kbd-tab.scm")

(define rls reverse-list->string)
(define rlv (lambda (ls) (list->vector (reverse ls))))
(define fxd->num string->number)

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
  (assoc-ref mtab str))

(define kbd-read
  (let (($word (tok-str->val '$word))
        ($keysym (tok-str->val '$keysym))
        ($fixed (tok-str->val '$fixed))
        ($string (tok-str->val '$string))
        ($end (tok-str->val '$end))
        (eof (with-input-from-string "" read-char)))

    (define (return key val)
      (cond
       ((eq? key $word)
        (cond
         ((assoc-ref mtab val) =>
          (lambda (key) (cons key val)))
         (else (cons $word val))))
       ((eq? key 'punct)
        (let ((sval (string val)))
          (cons (assoc-ref mtab sval) sval)))
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

(define xkbkey->guile
  `(
    ("Escape" . #\esc) ("exclaim" . #\!) ("at" . #\@) ("numbersign" . #\#)
    ("dollar" . #\$) ("percent" . #\%) ("asciicircum" . #\^) ("asterisk" . #\*)
    ("parenleft" . #\)) ("parenright" . #\)) ("minus" . #\-)
    ("underscore" . #\_) ("equal" . #\=) ("plus" . #\+) ("Backspace" . #\bs)
    ("Tab" . #\tab) ("ISO_Left_Tab" . #\tab) ("bracketleft" . #\[)
    ("bracketright" . #\]) ("braceleft" . #\{) ("braceright" . #\})
    ("Return" . #\cr) ("semicolon" . #\;) ("colon" . #\:) ("apostrophe" . #\')
    ("quotedbl" . #\") ("grave" . #\`) ("asciitilde" . #\~) ("backslash" . #\\)
    ("bar" . #\|) ("comma" . #\,) ("less" . #\<) ("period" . #\.)
    ("greater" . #\>) ("slash" . #\/) ("question" . #\?) ("space" . #\sp)
    ;; meta control shift hyper super alt
    ("Meta_L" . M-) ("Meta_R" . M-)
    ("Control_L" . C-) ("Control_R" . C-)
    ("Shift_L" . S-) ("Shift_R" . S-)
    ("Hyper_L" . H-) ("Hyper_R" . H-)
    ("Super_L" . Z-) ("Super_R" . Z-)
    ("Alt_L" . A-) ("Alt_R" . A-)
    ;;
    ("Caps_Lock" . LCTL)
    ;;
    ("Right" . right) ("Left" . left) ("Up" . up) ("Down" . down)
    ))

;;(define keycode-vec #f)
(define basekey-v #f)
(define shftkey-v #f)
(define kbd-coded (make-hash-table 997))
(define kbd-groupd (make-hash-table 7))
(export keycode-vec)

(include-from-path "kbd-parse/kbd-act.scm")

;; =============================================================================

(define (dmsg s t a ntab)
  (let ((t (or (assq-ref ntab t) t)))
    (cond
     ((not a) (sferr "state ~S, token ~S\t=> parse error\n" s t))
     ((positive? a) (sferr "state ~S, token ~S  => shift, goto ~S\n" s t a))
     ((negative? a) (sferr "state ~S, token ~S  => reduce ~S\n" s t (- a)))
     ((zero? a) (sferr "state ~S, token ~S  => accept\n" s t))
     (else (error "coding error in parser")))))

(define (parse-error state laval)
  (let* ((fn (or (port-filename (current-input-port)) "(unknown)"))
	 (ln (1+ (port-line (current-input-port)))))
    (throw 'kbd-error "~A:~A: parse failed at state ~A, on input ~S"
	   fn ln (car state) (cdr laval))))

(define $default 1)

(define* (parse-kbd #:key debug)
  (let loop ((state (list 0))	; state stack
	     (value (list '$@))	; value stack
	     (nval #f)		; from reduce
	     (lval #f))		; from lex'er
    (cond
     ((not (or nval lval))
      (if (eqv? $default (caar (vector-ref pat-v (car state))))
	  (loop state value (cons $default #f) lval)
	  (loop state value nval (kbd-read))))
     (else
      (let* ((laval (or nval lval))
	     (tval (car laval))
	     (sval (cdr laval))
	     (stxl (vector-ref pat-v (car state)))
	     (stx (or (assq-ref stxl tval) (assq-ref stxl $default) #f)))
	(if debug (dmsg (car state) (if nval tval sval) stx ntab))
	(cond
	 ((eq? #f stx)                  ; error
	  (parse-error state laval))
	 ((negative? stx)		; reduce
	  (let* ((gx (abs stx))
		 (gl (vector-ref len-v gx))
		 ($$ (apply (vector-ref act-v gx) value))
		 (tval (cons (vector-ref rto-v gx) $$)))
	    (loop (list-tail state gl) (list-tail value gl) tval lval)))
	 ((positive? stx)		; shift
	  (loop (cons stx state) (cons sval value) #f (if nval lval #f)))
	 (else                          ; accept
	  (car value))))))))

(define-public (get-keymaps km-str)
  (with-input-from-string km-str parse-kbd)
  (cons basekey-v shftkey-v))

;; =============================================================================

(define-public (test-reader-lo filename)
  (with-input-from-file filename
    (lambda ()
      (let loop ((tok (kbd-read)))
        (unless (eof-object? (cdr tok))
          (pp tok)
          (loop (kbd-read)))))))
  
(define-public (test-reader-hi filename)
  (pp (with-input-from-file filename parse-kbd)))

(define-public (test-reader-kv filename)
  (with-input-from-file filename parse-kbd)
  (let loop ((nd 40) (ix 30))
    (when (< ix nd)
      (sf "~S ~S\n" (vector-ref basekey-v ix) (vector-ref shftkey-v ix))
      (loop nd (1+ ix)))
  ))
  
;;; --- last line ---
