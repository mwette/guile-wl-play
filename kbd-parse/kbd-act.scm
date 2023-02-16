;; kbd-mach-act.scm

(define act-v
  (vector
   ;; $start => file
   (lambda ($1 . $rest) $1)
   ;; file => "xkb_keymap" "{" sections "}" ";"
   (lambda ($5 $4 $3 $2 $1 . $rest) #t)
   ;; sections => 
   (lambda $rest (list))
   ;; sections => sections "xkb_keycodes" '$string "{" keycode-stmts "}" ";"
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; sections => sections "xkb_types" '$string "{" type-stmts "}" ";"
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; sections => sections "xkb_compabilitye" '$string "{" compat-stmts "}"...
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; sections => sections "xkb_symbols" '$string "{" symbol-stmts "}" ";"
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; keycode-stmts => 
   (lambda $rest (list))
   ;; keycode-stmts => keycode-stmts keycode-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; keycode-stmt => "minimum" "=" '$nnum
   (lambda ($3 $2 $1 . $rest) $1)
   ;; keycode-stmt => "maximum" "=" '$nnum
   (lambda ($3 $2 $1 . $rest) $1)
   ;; keycode-stmt => '$keysym "=" '$nnum
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-stmts => 
   (lambda $rest (list))
   ;; type-stmts => type-stmts type-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-stmt => "virtual_modifiers" name-list
   (lambda ($2 $1 . $rest) $1)
   ;; type-stmt => "type" '$string "{" type-qual-stmts "}"
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; type-qual-stmts => 
   (lambda $rest (list))
   ;; type-qual-stmts => type-qual-stmts type-qual-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "modifiers" "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "map" "[" '$word "]" "=" '$nnum
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "level_name" "[" '$word "]" "=" '$string
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; word-sum => '$word
   (lambda ($1 . $rest) $1)
   ;; word-sum => word-sum "+" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; name-list => '$word
   (lambda ($1 . $rest) $1)
   ;; name-list => name-list "," '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; compat-stmts => 
   (lambda $rest (list))
   ;; compat-stmts => compat-stmts compat-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; compat-stmt => "virtual_modifiers" name-list
   (lambda ($2 $1 . $rest) $1)
   ;; compat-stmt => interpret "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; interpret => "interpret"
   (lambda ($1 . $rest) $1)
   ;; interpret => interpret "." '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; symbol-stmts => 
   (lambda $rest (list))
   ;; symbol-stmts => symbol-stmts symbol-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; symbol-stmt => "name" "[" '$word "]" "=" '$string
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; symbol-stmt => "key" '$keysym "{" "[" '$word "]" "}"
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ))

;;; end tables
