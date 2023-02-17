
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
     (sections "xkb_compatibility" $string "{" compat-stmts "}" ";")
     (sections "xkb_symbols" $string "{" symbol-stmts "}" ";"))

    (keycode-stmts
     ($empty)
     (keycode-stmts keycode-stmt ";"))
    (keycode-stmt
     ("minimum" "=" $fixed)
     ("maximum" "=" $fixed)
     ($keysym "=" $fixed)
     ("indicator" $fixed "=" $string)
     ("alias" $keysym "=" $keysym)
     )

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
     ("modifiers" "=" word-sum)
     ("map" "[" word-sum "]" "=" $fixed)
     ("preserve" "[" word-sum "]" "=" $word)
     ("level_name" "[" $fixed "]" "=" $string)
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
     ("interpret" "." $word "=" $word)
     ("interpret" word-sum "(" word-sum ")" "{" detail-stmts "}")
     ("indicator" $string "{" detail-stmts "}")
     )
    (detail-stmts
     ($empty)
     (detail-stmts detail-stmt ";"))
    (detail-stmt
     ($word "=" $word)
     ($word "=" $fixed)
     ("action" "=" $word "(" ")")
     ("action" "=" $word "(" arg-list ")")
     ("modifiers" "=" $word)
     )
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
     ("type" "=" $fixed)
     )
    (loc-sign ($empty) ("+") ("-"))
    
    #|
    xkb_symbols "(unnamed)" {
        name[Group1]="English (US)";
        name[Group2]="English (US)";

        key <ESC>                {      [          Escape ] };
        key <AE01>               {
                symbols[Group1]= [               1,          exclam ],
                symbols[Group2]= [               1,          exclam ]
        };
    |#
    (symbol-stmts
     ($empty)
     (symbol-stmts symbol-stmt ";"))
    (symbol-stmt
     ("name" "[" $word "]" "=" $string)
     ("key" $keysym "{" key-details "}")
     ("modifier_map" $word "{" keysym-list "}")
     )
    (key-details
     (key-detail)
     (key-details "," key-detail))
    (key-detail
     ("type" "=" $string)
     ("[" kd-list "]")
     ("symbols" "[" $word "]" "=" "[" kd-list "]")
     )
    (kd-list
     (kd)
     (kd-list "," kd))
    (kd
     ($fixed)
     ($word))
    (keysym-list
     ($keysym)
     (keysym-list "," $keysym))

    )))

;; https://github.com/xkbcommon/
;;     libxkbcommon/blob/master/doc/keymap-format-text-v1.md

(define kbd-mach
  (compact-machine
   (hashify-machine
    (make-lalr-machine kbd-spec))))

(define (gen-files)
  (write-lalr-actions kbd-mach "kbd-act.scm" #:prefix "kbd-")
  (write-lalr-tables kbd-mach "kbd-tab.scm" #:prefix "kbd-"))

;; --- last line ---

    
