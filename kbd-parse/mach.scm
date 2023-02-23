;; kbd-parse/mach.scm

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

;; This file can be used with nyacc's lalr parser generator to build the
;; state machine.   See kbd-parse(parse-kbd) for usage.

;; https://github.com/xkbcommon/libxkbcommon/blob/master/
;;      doc/keymap-format-text-v1.md

(define-module (kbd-parse mach)
  #:export (kbd-spec kbd-mach gen-files)
  #:use-module (nyacc lalr))

(define kbd-spec
  (lalr-spec
   (start file)
   (grammar

    (file
     ("xkb_keymap" "{" sections "}" ";"
      ($$ #t)))

    (sections
     ($empty)
     (sections "xkb_keycodes" $string "{" keycode-stmts "}" ";")
     (sections "xkb_types" $string "{" type-stmts "}" ";")
     (sections "xkb_compatibility" $string "{" compat-stmts "}" ";")
     (sections "xkb_symbols" $string "{" symbol-stmts "}" ";"))

    (keycode-stmts
     ($empty)
     (keycode-stmts keycode-stmt ";"))
    (keycode-stmt
     ("minimum" "=" $fixed ($$ '()))
     ("maximum" "=" $fixed
      ($$ (set! basekey-v (make-vector (1+ (fxd->num $3)) #f))
          (set! shftkey-v (make-vector (1+ (fxd->num $3)) #f))))
     ($keysym "=" $fixed
      ($$ (hash-set! kbd-coded $1 (fxd->num $3)) #f))
     ("indicator" $fixed "=" $string)
     ("alias" $keysym "=" $keysym
      ($$ (let ((kcode (hash-ref kbd-coded $4)))
            (hash-set! kbd-coded $2 kcode)))))

    (type-stmts
     ($empty)
     (type-stmts type-stmt ";"))
    (type-stmt
     ("virtual_modifiers" symbol-list)
     ("type" $string "{" type-qual-stmts "}"))
    (type-qual-stmts
     ($empty)
     (type-qual-stmts type-qual-stmt ";"))
    (type-qual-stmt
     ("modifiers" "=" word-sum)
     ("map" "[" word-sum "]" "=" $fixed)
     ("preserve" "[" word-sum "]" "=" $word)
     ("level_name" "[" $fixed "]" "=" $string))

    (compat-stmts
     ($empty)
     (compat-stmts compat-stmt ";"))
    (compat-stmt
     ("virtual_modifiers" symbol-list)
     ("interpret" "." $word "=" $word)
     ("interpret" word-sum "(" word-sum ")" "{" detail-stmts "}")
     ("indicator" $string "{" detail-stmts "}"))
    (detail-stmts
     ($empty)
     (detail-stmts detail-stmt ";"))
    (detail-stmt
     ($word "=" $word)
     ($word "=" $fixed)
     ("action" "=" $word "(" ")")
     ("action" "=" $word "(" arg-list ")")
     ("modifiers" "=" $word))
    (arg-list
     (arg)
     (arg-list "," arg))
    (arg
     ($word)
     ($word "=" $word)
     ($word "=" $word "(" arg-list ")")
     ($word "=" loc-sign $fixed)
     ($word "[" $fixed "]" "=" $fixed)
     ("!" $word)
     ("modifiers" "=" $word)
     ("type" "=" $fixed))
    (loc-sign ($empty) ("+") ("-"))
    
    (symbol-stmts
     ($empty)
     (symbol-stmts symbol-stmt ";"))
    (symbol-stmt
     ("name" "[" $word "]" "=" $string
      ($$ (hash-set! kbd-groupd $3 $6) #f))
     ("key" $keysym "{" keysym-detail "}"
      ($$ (let* ((kcode (hash-ref kbd-coded $2))
                 (nelt (vector-length $4))
                 (elt1 (vector-ref $4 0))
                 (elt2 (and (> nelt 1) (vector-ref $4 1)))
                 (val1 (cond
                        ((= (string-length elt1) 1) (string-ref elt1 0))
                        ((assoc-ref xkbkey->guile elt1))
                        (else #f)))
                 (val2 (cond
                        ((not elt2) #f)
                        ((= (string-length elt2) 1) (string-ref elt2 0))
                        ((assoc-ref xkbkey->guile elt2))
                        (else #f))))
            ;; X11 keeps first 8 blank, so wayland subtracts off 8
            (and val1 (vector-set! basekey-v (- kcode 8) val1))
            (and val2 (vector-set! shftkey-v (- kcode 8) val2)))))
     ("modifier_map" $word "{" ksym-list "}"))
    (keysym-detail
     ("[" symbol-list "]" ($$ (rlv $2)))
     (keysym-symbols))
    (keysym-symbols
     (keysym-symbol)
     (keysym-symbols "," keysym-symbol ($$ (if $1 $1 $3))))
    (keysym-symbol
     ("type" "=" $string ($$ #f))
     ("symbols" "[" $word "]" "=" "[" symbol-list "]"
      ($$ (and (string=? $3 "Group1") (rlv $7)))))

    (ksym-list
     ($keysym)
     (ksym-list "," $keysym))
    (word-sum
     ($word)
     (word-sum "+" $word))
    (symbol-list
     (symbol ($$ (list $1)))
     (symbol-list "," symbol ($$ (cons $3 $1))))
    (symbol ($fixed) ($word)) ;; convert numeric to symbol here
    )))
  
;; https://github.com/xkbcommon/
;;     libxkbcommon/blob/master/doc/keymap-format-text-v1.md

(define kbd-mach
  (compact-machine
   (hashify-machine
    (make-lalr-machine kbd-spec))))

(define (gen-files)
  (write-lalr-actions kbd-mach "kbd-act.scm")
  (write-lalr-tables kbd-mach "kbd-tab.scm"))

;; --- last line ---
