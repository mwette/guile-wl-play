
(define-module (kbd-parse mach)
  #:export (kbd-spec kbd-mach gen-files)
  #:use-module (nyacc lalr)
  ;;#:use-module (nyacc parse)
  )

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
     (sections "xkb_compabilitye" $string "{" compat-stmts "}" ";")
     (sections "xkb_symbols" $string "{" symbol-stmts "}" ";"))

    (keycode-stmts
     ($empty)
     (keycode-stmts keycode-stmt ";"))
    (keycode-stmt
     ("minimum" "=" $nnum)
     ("maximum" "=" $nnum)
     ($keysym "=" $nnum))

    (type-stmts
     ($empty)
     (type-stmts type-stmt ";"))
    (type-stmt
     ("virtual_modifiers" name-list)
     ("type" $string "{" type-qual-stmts "}")
     )
    (type-qual-stmts
     ($empty)
     (type-qual-stmts type-qual-stmt ";"))
    (type-qual-stmt
     ("modifiers" "=" $word)
     ("map" "[" $word "]" "=" $nnum)
     ("level_name" "[" $word "]" "=" $string)
     )
    (word-sum
     ($word)
     (word-sum "+" $word))

    (name-list
     ($word)
     (name-list "," $word))

    (compat-stmts
     ($empty)
     (compat-stmts compat-stmt ";"))
    (compat-stmt
     ("virtual_modifiers" name-list)
     (interpret "=" $word))
    (interpret
     ("interpret")
     (interpret "." $word))

    (symbol-stmts
     ($empty)
     (symbol-stmts symbol-stmt ";"))
    (symbol-stmt
     ("name" "[" $word "]" "=" $string)
     ("key" $keysym "{" "[" $word "]" "}"))


    )))

;; https://github.com/xkbcommon/
;;     libxkbcommon/blob/master/doc/keymap-format-text-v1.md

(define kbd-mach
  (compact-machine
   (hashify-machine
    (make-lalr-machine kbd-spec))))

(define (gen-files)
  (write-lalr-actions kbd-mach "kbd-mach-act.scm")
  (write-lalr-tables kbd-mach "kbd-mach-tab.scm"))

;; --- last line ---

    
