;; kbd-act.scm

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
   ;; sections => sections "xkb_compatibility" '$string "{" compat-stmts "}...
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; sections => sections "xkb_symbols" '$string "{" symbol-stmts "}" ";"
   (lambda ($7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; keycode-stmts => 
   (lambda $rest (list))
   ;; keycode-stmts => keycode-stmts keycode-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; keycode-stmt => "minimum" "=" '$fixed
   (lambda ($3 $2 $1 . $rest) '())
   ;; keycode-stmt => "maximum" "=" '$fixed
   (lambda ($3 $2 $1 . $rest)
     (set! basekey-v
       (make-vector (#{1+}# (fxd->num $3))))
     (set! shftkey-v
       (make-vector (#{1+}# (fxd->num $3)))))
   ;; keycode-stmt => '$keysym "=" '$fixed
   (lambda ($3 $2 $1 . $rest)
     (hash-set! kbd-coded $1 (fxd->num $3))
     #f)
   ;; keycode-stmt => "indicator" '$fixed "=" '$string
   (lambda ($4 $3 $2 $1 . $rest) $1)
   ;; keycode-stmt => "alias" '$keysym "=" '$keysym
   (lambda ($4 $3 $2 $1 . $rest)
     (let ((kcode (hash-ref kbd-coded $4)))
       (hash-set! kbd-coded $2 kcode)))
   ;; type-stmts => 
   (lambda $rest (list))
   ;; type-stmts => type-stmts type-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-stmt => "virtual_modifiers" symbol-list
   (lambda ($2 $1 . $rest) $1)
   ;; type-stmt => "type" '$string "{" type-qual-stmts "}"
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; type-qual-stmts => 
   (lambda $rest (list))
   ;; type-qual-stmts => type-qual-stmts type-qual-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "modifiers" "=" word-sum
   (lambda ($3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "map" "[" word-sum "]" "=" '$fixed
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "preserve" "[" word-sum "]" "=" '$word
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; type-qual-stmt => "level_name" "[" '$fixed "]" "=" '$string
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; compat-stmts => 
   (lambda $rest (list))
   ;; compat-stmts => compat-stmts compat-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; compat-stmt => "virtual_modifiers" symbol-list
   (lambda ($2 $1 . $rest) $1)
   ;; compat-stmt => "interpret" "." '$word "=" '$word
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; compat-stmt => "interpret" word-sum "(" word-sum ")" "{" detail-stmts...
   (lambda ($8 $7 $6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; compat-stmt => "indicator" '$string "{" detail-stmts "}"
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; detail-stmts => 
   (lambda $rest (list))
   ;; detail-stmts => detail-stmts detail-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; detail-stmt => '$word "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; detail-stmt => '$word "=" '$fixed
   (lambda ($3 $2 $1 . $rest) $1)
   ;; detail-stmt => "action" "=" '$word "(" ")"
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; detail-stmt => "action" "=" '$word "(" arg-list ")"
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; detail-stmt => "modifiers" "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; arg-list => arg
   (lambda ($1 . $rest) $1)
   ;; arg-list => arg-list "," arg
   (lambda ($3 $2 $1 . $rest) $1)
   ;; arg => '$word
   (lambda ($1 . $rest) $1)
   ;; arg => '$word "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; arg => '$word "=" '$word "(" arg-list ")"
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; arg => '$word "=" loc-sign '$fixed
   (lambda ($4 $3 $2 $1 . $rest) $1)
   ;; arg => '$word "[" '$fixed "]" "=" '$fixed
   (lambda ($6 $5 $4 $3 $2 $1 . $rest) $1)
   ;; arg => "!" '$word
   (lambda ($2 $1 . $rest) $1)
   ;; arg => "modifiers" "=" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; arg => "type" "=" '$fixed
   (lambda ($3 $2 $1 . $rest) $1)
   ;; loc-sign => 
   (lambda $rest (list))
   ;; loc-sign => "+"
   (lambda ($1 . $rest) $1)
   ;; loc-sign => "-"
   (lambda ($1 . $rest) $1)
   ;; symbol-stmts => 
   (lambda $rest (list))
   ;; symbol-stmts => symbol-stmts symbol-stmt ";"
   (lambda ($3 $2 $1 . $rest) $1)
   ;; symbol-stmt => "name" "[" '$word "]" "=" '$string
   (lambda ($6 $5 $4 $3 $2 $1 . $rest)
     (hash-set! kbd-groupd $3 $6)
     #f)
   ;; symbol-stmt => "key" '$keysym "{" keysym-detail "}"
   (lambda ($5 $4 $3 $2 $1 . $rest)
     (let* ((kcode (hash-ref kbd-coded $2))
            (nelt (vector-length $4))
            (elt1 (vector-ref $4 0))
            (elt2 (and (> nelt 1) (vector-ref $4 1)))
            (val1 (cond ((= (string-length elt1) 1) (string-ref elt1 0))
                        ((assoc-ref xkbkey->guile elt1))
                        (else #f)))
            (val2 (cond ((not elt2) #f)
                        ((= (string-length elt2) 1) (string-ref elt2 0))
                        ((assoc-ref xkbkey->guile elt2))
                        (else #f))))
       (and val1
            (vector-set! basekey-v (- kcode 8) val1))
       (and val2
            (vector-set! shftkey-v (- kcode 8) val2))))
   ;; symbol-stmt => "modifier_map" '$word "{" ksym-list "}"
   (lambda ($5 $4 $3 $2 $1 . $rest) $1)
   ;; keysym-detail => "[" symbol-list "]"
   (lambda ($3 $2 $1 . $rest) (rlv $2))
   ;; keysym-detail => keysym-symbols
   (lambda ($1 . $rest) $1)
   ;; keysym-symbols => keysym-symbol
   (lambda ($1 . $rest) $1)
   ;; keysym-symbols => keysym-symbols "," keysym-symbol
   (lambda ($3 $2 $1 . $rest) (if $1 $1 $3))
   ;; keysym-symbol => "type" "=" '$string
   (lambda ($3 $2 $1 . $rest) #f)
   ;; keysym-symbol => "symbols" "[" '$word "]" "=" "[" symbol-list "]"
   (lambda ($8 $7 $6 $5 $4 $3 $2 $1 . $rest)
     (and (string=? $3 "Group1") (rlv $7)))
   ;; ksym-list => '$keysym
   (lambda ($1 . $rest) $1)
   ;; ksym-list => ksym-list "," '$keysym
   (lambda ($3 $2 $1 . $rest) $1)
   ;; word-sum => '$word
   (lambda ($1 . $rest) $1)
   ;; word-sum => word-sum "+" '$word
   (lambda ($3 $2 $1 . $rest) $1)
   ;; symbol-list => symbol
   (lambda ($1 . $rest) (list $1))
   ;; symbol-list => symbol-list "," symbol
   (lambda ($3 $2 $1 . $rest) (cons $3 $1))
   ;; symbol => '$fixed
   (lambda ($1 . $rest) $1)
   ;; symbol => '$word
   (lambda ($1 . $rest) $1)
   ))

;;; end tables
