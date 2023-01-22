;; xdg-shell-client.scm - from ../../proto/xdg-shell.xml

(define-public xdg-shell-iface-list
  '(xdg_wm_base
     xdg_positioner
     xdg_surface
     xdg_toplevel
     xdg_popup))

(define-public xdg-shell-opcode-dict-list
  '(((destroy . 0) (create_positioner . 1) (get_xdg_surface . 2) (pong . 3) (ping . 0))
    ((destroy . 0) (set_size . 1) (set_anchor_rect . 2) (set_anchor . 3) (set_gravity . 4) (set_constraint_adjustment . 5) (set_offset . 6) (set_reactive . 7) (set_parent_size . 8) (set_parent_configure . 9))
    ((destroy . 0) (get_toplevel . 1) (get_popup . 2) (set_window_geometry . 3) (ack_configure . 4) (configure . 0))
    ((destroy . 0) (set_parent . 1) (set_title . 2) (set_app_id . 3) (show_window_menu . 4) (move . 5) (resize . 6) (set_max_size . 7) (set_min_size . 8) (set_maximized . 9) (unset_maximized . 10) (set_fullscreen . 11) (unset_fullscreen . 12) (set_minimized . 13) (configure . 0) (close . 1) (configure_bounds . 2))
    ((destroy . 0) (grab . 1) (configure . 0) (popup_done . 1) (reposition . 2) (repositioned . 2))))

(define xdg-shell-decoder-vec-list
  (list (vector
          (lambda (obj-id bv ix cm)
            "event decoder for ping"
            (let*-values
              (((serial ix) (dec-u32 bv ix)))
              (values obj-id serial))))
        (vector)
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for configure"
            (let*-values
              (((serial ix) (dec-u32 bv ix)))
              (values obj-id serial))))
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for configure"
            (let*-values
              (((width ix) (dec-s32 bv ix))
               ((height ix) (dec-s32 bv ix))
               ((states ix) (dec-array bv ix)))
              (values obj-id width height states)))
          (lambda (obj-id bv ix cm)
            "event decoder for close"
            (let*-values () (values obj-id)))
          (lambda (obj-id bv ix cm)
            "event decoder for configure_bounds"
            (let*-values
              (((width ix) (dec-s32 bv ix))
               ((height ix) (dec-s32 bv ix)))
              (values obj-id width height))))
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for configure"
            (let*-values
              (((x ix) (dec-s32 bv ix))
               ((y ix) (dec-s32 bv ix))
               ((width ix) (dec-s32 bv ix))
               ((height ix) (dec-s32 bv ix)))
              (values obj-id x y width height)))
          (lambda (obj-id bv ix cm)
            "event decoder for popup_done"
            (let*-values () (values obj-id)))
          (lambda (obj-id bv ix cm)
            "event decoder for repositioned"
            (let*-values
              (((token ix) (dec-u32 bv ix)))
              (values obj-id token))))))

(define xdg-shell-handler-vec-list
  (list (make-vector 1)
        (make-vector 0)
        (make-vector 1)
        (make-vector 3)
        (make-vector 3)))

(add-iface-list xdg-shell-iface-list)
(add-opcode-dict-list xdg-shell-opcode-dict-list)
(add-decoder-vec-list xdg-shell-decoder-vec-list)
(add-handler-vec-list xdg-shell-handler-vec-list)

(define-public encode-xdg_wm_base:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-xdg_wm_base:create_positioner
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-xdg_wm_base:get_xdg_surface
  (lambda (obj-id bv ix id surface)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-u32-native-set! bv (+ ix 12) surface)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-xdg_wm_base:pong
  (lambda (obj-id bv ix serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-xdg_positioner:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_size
  (lambda (obj-id bv ix width height)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) width)
      (bytevector-s32-native-set! bv (+ ix 12) height)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_anchor_rect
  (lambda (obj-id bv ix x y width height)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) x)
      (bytevector-s32-native-set! bv (+ ix 12) y)
      (bytevector-s32-native-set! bv (+ ix 16) width)
      (bytevector-s32-native-set! bv (+ ix 20) height)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_anchor
  (lambda (obj-id bv ix anchor)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) anchor)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_gravity
  (lambda (obj-id bv ix gravity)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) gravity)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_constraint_adjustment
  (lambda (obj-id bv ix constraint_adjustment)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        constraint_adjustment)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 5)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_offset
  (lambda (obj-id bv ix x y)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) x)
      (bytevector-s32-native-set! bv (+ ix 12) y)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 6)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_reactive
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 7)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_parent_size
  (lambda (obj-id bv ix parent_width parent_height)
    (define (encode-body)
      (bytevector-s32-native-set!
        bv
        (+ ix 8)
        parent_width)
      (bytevector-s32-native-set!
        bv
        (+ ix 12)
        parent_height)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 8)
        (values msg-size control)))))

(define-public encode-xdg_positioner:set_parent_configure
  (lambda (obj-id bv ix serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 9)
        (values msg-size control)))))

(define-public encode-xdg_surface:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-xdg_surface:get_toplevel
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-xdg_surface:get_popup
  (lambda (obj-id bv ix id parent positioner)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-u32-native-set! bv (+ ix 12) parent)
      (bytevector-u32-native-set!
        bv
        (+ ix 16)
        positioner)
      (values (+ ix 20) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-xdg_surface:set_window_geometry
  (lambda (obj-id bv ix x y width height)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) x)
      (bytevector-s32-native-set! bv (+ ix 12) y)
      (bytevector-s32-native-set! bv (+ ix 16) width)
      (bytevector-s32-native-set! bv (+ ix 20) height)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-xdg_surface:ack_configure
  (lambda (obj-id bv ix serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_parent
  (lambda (obj-id bv ix parent)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) parent)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_title
  (lambda (obj-id bv ix title)
    (define (encode-body)
      (let ((ix (enc-string bv (+ ix 8) title)))
        (values (+ ix 0) #f)))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_app_id
  (lambda (obj-id bv ix app_id)
    (define (encode-body)
      (let ((ix (enc-string bv (+ ix 8) app_id)))
        (values (+ ix 0) #f)))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:show_window_menu
  (lambda (obj-id bv ix seat serial x y)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) seat)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (bytevector-s32-native-set! bv (+ ix 16) x)
      (bytevector-s32-native-set! bv (+ ix 20) y)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:move
  (lambda (obj-id bv ix seat serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) seat)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 5)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:resize
  (lambda (obj-id bv ix seat serial edges)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) seat)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (bytevector-u32-native-set! bv (+ ix 16) edges)
      (values (+ ix 20) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 6)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_max_size
  (lambda (obj-id bv ix width height)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) width)
      (bytevector-s32-native-set! bv (+ ix 12) height)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 7)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_min_size
  (lambda (obj-id bv ix width height)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) width)
      (bytevector-s32-native-set! bv (+ ix 12) height)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 8)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_maximized
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 9)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:unset_maximized
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 10)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_fullscreen
  (lambda (obj-id bv ix output)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) output)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 11)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:unset_fullscreen
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 12)
        (values msg-size control)))))

(define-public encode-xdg_toplevel:set_minimized
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 13)
        (values msg-size control)))))

(define-public encode-xdg_popup:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-xdg_popup:grab
  (lambda (obj-id bv ix seat serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) seat)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-xdg_popup:reposition
  (lambda (obj-id bv ix positioner token)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        positioner)
      (bytevector-u32-native-set! bv (+ ix 12) token)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

;; --- last line ---
