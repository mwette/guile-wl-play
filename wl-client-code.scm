;; wl-client-code.scm - from wayland.xml

(define-public wayland-index-dict
  '((wl_display . 0)
    (wl_registry . 1)
    (wl_callback . 2)
    (wl_compositor . 3)
    (wl_shm_pool . 4)
    (wl_shm . 5)
    (wl_buffer . 6)
    (wl_data_offer . 7)
    (wl_data_source . 8)
    (wl_data_device . 9)
    (wl_data_device_manager . 10)
    (wl_shell . 11)
    (wl_shell_surface . 12)
    (wl_surface . 13)
    (wl_seat . 14)
    (wl_pointer . 15)
    (wl_keyboard . 16)
    (wl_touch . 17)
    (wl_output . 18)
    (wl_region . 19)
    (wl_subcompositor . 20)
    (wl_subsurface . 21)))

(define-public wayland-opcode-dict-vec
  #(((sync . 0) (get_registry . 1) (error . 0) (delete_id . 1))
    ((bind . 0) (global . 0) (global_remove . 1))
    ((done . 0))
    ((create_surface . 0) (create_region . 1))
    ((create_buffer . 0) (destroy . 1) (resize . 2))
    ((create_pool . 0) (format . 0))
    ((destroy . 0) (release . 0))
    ((accept . 0) (receive . 1) (destroy . 2) (offer . 0) (finish . 3) (set_actions . 4) (source_actions . 1) (action . 2))
    ((offer . 0) (destroy . 1) (target . 0) (send . 1) (cancelled . 2) (set_actions . 2) (dnd_drop_performed . 3) (dnd_finished . 4) (action . 5))
    ((start_drag . 0) (set_selection . 1) (data_offer . 0) (enter . 1) (leave . 2) (motion . 3) (drop . 4) (selection . 5) (release . 2))
    ((create_data_source . 0) (get_data_device . 1))
    ((get_shell_surface . 0))
    ((pong . 0) (move . 1) (resize . 2) (set_toplevel . 3) (set_transient . 4) (set_fullscreen . 5) (set_popup . 6) (set_maximized . 7) (set_title . 8) (set_class . 9) (ping . 0) (configure . 1) (popup_done . 2))
    ((destroy . 0) (attach . 1) (damage . 2) (frame . 3) (set_opaque_region . 4) (set_input_region . 5) (commit . 6) (enter . 0) (leave . 1) (set_buffer_transform . 7) (set_buffer_scale . 8) (damage_buffer . 9) (offset . 10))
    ((capabilities . 0) (get_pointer . 0) (get_keyboard . 1) (get_touch . 2) (name . 1) (release . 3))
    ((set_cursor . 0) (enter . 0) (leave . 1) (motion . 2) (button . 3) (axis . 4) (release . 1) (frame . 5) (axis_source . 6) (axis_stop . 7) (axis_discrete . 8))
    ((keymap . 0) (enter . 1) (leave . 2) (key . 3) (modifiers . 4) (release . 0) (repeat_info . 5))
    ((down . 0) (up . 1) (motion . 2) (frame . 3) (cancel . 4) (release . 0) (shape . 5) (orientation . 6))
    ((geometry . 0) (mode . 1) (done . 2) (scale . 3) (release . 0) (name . 4) (description . 5))
    ((destroy . 0) (add . 1) (subtract . 2))
    ((destroy . 0) (get_subsurface . 1))
    ((destroy . 0) (set_position . 1) (place_above . 2) (place_below . 3) (set_sync . 4) (set_desync . 5))))

(define-public encode-wl_display:sync
  (lambda (obj-id bv ix callback)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) callback)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_display:get_registry
  (lambda (obj-id bv ix registry)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) registry)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_registry:bind
  (lambda (obj-id bv ix name interface version id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) name)
      (let ((ix (enc-string bv (+ ix 12) interface)))
        (bytevector-u32-native-set! bv (+ ix 0) version)
        (bytevector-u32-native-set! bv (+ ix 4) id)
        (values (+ ix 8) #f)))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_compositor:create_surface
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_compositor:create_region
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

(define-public encode-wl_shm_pool:create_buffer
  (lambda (obj-id
           bv
           ix
           id
           offset
           width
           height
           stride
           format)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-s32-native-set! bv (+ ix 12) offset)
      (bytevector-s32-native-set! bv (+ ix 16) width)
      (bytevector-s32-native-set! bv (+ ix 20) height)
      (bytevector-s32-native-set! bv (+ ix 24) stride)
      (bytevector-u32-native-set! bv (+ ix 28) format)
      (values (+ ix 32) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_shm_pool:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_shm_pool:resize
  (lambda (obj-id bv ix size)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) size)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_shm:create_pool
  (lambda (obj-id bv ix id fd size)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-s32-native-set! bv (+ ix 12) size)
      (values (+ ix 16) (enc-fd fd)))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_buffer:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_data_offer:accept
  (lambda (obj-id bv ix serial mime_type)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (enc-string bv (+ ix 12) mime_type))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_data_offer:receive
  (lambda (obj-id bv ix mime_type fd)
    (define (encode-body)
      (let ((ix (enc-string bv (+ ix 8) mime_type)))
        (values (+ ix 0) (enc-fd fd))))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_data_offer:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_data_offer:finish
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-wl_data_offer:set_actions
  (lambda (obj-id bv ix dnd_actions preferred_action)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        dnd_actions)
      (bytevector-u32-native-set!
        bv
        (+ ix 12)
        preferred_action)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-wl_data_source:offer
  (lambda (obj-id bv ix mime_type)
    (define (encode-body)
      (enc-string bv (+ ix 8) mime_type))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_data_source:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_data_source:set_actions
  (lambda (obj-id bv ix dnd_actions)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        dnd_actions)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_data_device:start_drag
  (lambda (obj-id bv ix source origin icon serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) source)
      (bytevector-u32-native-set! bv (+ ix 12) origin)
      (bytevector-u32-native-set! bv (+ ix 16) icon)
      (bytevector-u32-native-set! bv (+ ix 20) serial)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_data_device:set_selection
  (lambda (obj-id bv ix source serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) source)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_data_device:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_data_device_manager:create_data_source
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_data_device_manager:get_data_device
  (lambda (obj-id bv ix id seat)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-u32-native-set! bv (+ ix 12) seat)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_shell:get_shell_surface
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
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:pong
  (lambda (obj-id bv ix serial)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:move
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

(define-public encode-wl_shell_surface:resize
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
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_toplevel
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_transient
  (lambda (obj-id bv ix parent x y flags)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) parent)
      (bytevector-s32-native-set! bv (+ ix 12) x)
      (bytevector-s32-native-set! bv (+ ix 16) y)
      (bytevector-u32-native-set! bv (+ ix 20) flags)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_fullscreen
  (lambda (obj-id bv ix method framerate output)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) method)
      (bytevector-u32-native-set!
        bv
        (+ ix 12)
        framerate)
      (bytevector-u32-native-set! bv (+ ix 16) output)
      (values (+ ix 20) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 5)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_popup
  (lambda (obj-id bv ix seat serial parent x y flags)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) seat)
      (bytevector-u32-native-set! bv (+ ix 12) serial)
      (bytevector-u32-native-set! bv (+ ix 16) parent)
      (bytevector-s32-native-set! bv (+ ix 20) x)
      (bytevector-s32-native-set! bv (+ ix 24) y)
      (bytevector-u32-native-set! bv (+ ix 28) flags)
      (values (+ ix 32) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 6)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_maximized
  (lambda (obj-id bv ix output)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) output)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 7)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_title
  (lambda (obj-id bv ix title)
    (define (encode-body)
      (enc-string bv (+ ix 8) title))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 8)
        (values msg-size control)))))

(define-public encode-wl_shell_surface:set_class
  (lambda (obj-id bv ix class_)
    (define (encode-body)
      (enc-string bv (+ ix 8) class_))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 9)
        (values msg-size control)))))

(define-public encode-wl_surface:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_surface:attach
  (lambda (obj-id bv ix buffer x y)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) buffer)
      (bytevector-s32-native-set! bv (+ ix 12) x)
      (bytevector-s32-native-set! bv (+ ix 16) y)
      (values (+ ix 20) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_surface:damage
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

(define-public encode-wl_surface:frame
  (lambda (obj-id bv ix callback)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) callback)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-wl_surface:set_opaque_region
  (lambda (obj-id bv ix region)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) region)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-wl_surface:set_input_region
  (lambda (obj-id bv ix region)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) region)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 5)
        (values msg-size control)))))

(define-public encode-wl_surface:commit
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 6)
        (values msg-size control)))))

(define-public encode-wl_surface:set_buffer_transform
  (lambda (obj-id bv ix transform)
    (define (encode-body)
      (bytevector-s32-native-set!
        bv
        (+ ix 8)
        transform)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 7)
        (values msg-size control)))))

(define-public encode-wl_surface:set_buffer_scale
  (lambda (obj-id bv ix scale)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) scale)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 8)
        (values msg-size control)))))

(define-public encode-wl_surface:damage_buffer
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
        (bytevector-u16-native-set! bv (+ ix 4) 9)
        (values msg-size control)))))

(define-public encode-wl_surface:offset
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
        (bytevector-u16-native-set! bv (+ ix 4) 10)
        (values msg-size control)))))

(define-public encode-wl_seat:get_pointer
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_seat:get_keyboard
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

(define-public encode-wl_seat:get_touch
  (lambda (obj-id bv ix id)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_seat:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-wl_pointer:set_cursor
  (lambda (obj-id bv ix serial surface hotspot_x hotspot_y)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) serial)
      (bytevector-u32-native-set! bv (+ ix 12) surface)
      (bytevector-s32-native-set!
        bv
        (+ ix 16)
        hotspot_x)
      (bytevector-s32-native-set!
        bv
        (+ ix 20)
        hotspot_y)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_pointer:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_keyboard:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_touch:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_output:release
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_region:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_region:add
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
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_region:subtract
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

(define-public encode-wl_subcompositor:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_subcompositor:get_subsurface
  (lambda (obj-id bv ix id surface parent)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-u32-native-set! bv (+ ix 12) surface)
      (bytevector-u32-native-set! bv (+ ix 16) parent)
      (values (+ ix 20) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_subsurface:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-wl_subsurface:set_position
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
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-wl_subsurface:place_above
  (lambda (obj-id bv ix sibling)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) sibling)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-wl_subsurface:place_below
  (lambda (obj-id bv ix sibling)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) sibling)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-wl_subsurface:set_sync
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 4)
        (values msg-size control)))))

(define-public encode-wl_subsurface:set_desync
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 5)
        (values msg-size control)))))

(define-public wl-decoder-vec-vec
  (vector
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for error"
        (let*-values
          (((object_id ix) (dec-u32 bv ix))
           ((code ix) (dec-u32 bv ix))
           ((message ix) (dec-string bv ix)))
          (values obj-id object_id code message)))
      (lambda (obj-id bv ix cm)
        "event decoder for delete_id"
        (let*-values
          (((id ix) (dec-u32 bv ix)))
          (values obj-id id))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for global"
        (let*-values
          (((name ix) (dec-u32 bv ix))
           ((interface ix) (dec-string bv ix))
           ((version ix) (dec-u32 bv ix)))
          (values obj-id name interface version)))
      (lambda (obj-id bv ix cm)
        "event decoder for global_remove"
        (let*-values
          (((name ix) (dec-u32 bv ix)))
          (values obj-id name))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for done"
        (let*-values
          (((callback_data ix) (dec-u32 bv ix)))
          (values obj-id callback_data))))
    (vector)
    (vector)
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for format"
        (let*-values
          (((format ix) (dec-u32 bv ix)))
          (values obj-id format))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for release"
        (let*-values () (values obj-id))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for offer"
        (let*-values
          (((mime_type ix) (dec-string bv ix)))
          (values obj-id mime_type)))
      (lambda (obj-id bv ix cm)
        "event decoder for source_actions"
        (let*-values
          (((source_actions ix) (dec-u32 bv ix)))
          (values obj-id source_actions)))
      (lambda (obj-id bv ix cm)
        "event decoder for action"
        (let*-values
          (((dnd_action ix) (dec-u32 bv ix)))
          (values obj-id dnd_action))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for target"
        (let*-values
          (((mime_type ix) (dec-string bv ix)))
          (values obj-id mime_type)))
      (lambda (obj-id bv ix cm)
        "event decoder for send"
        (let*-values
          (((mime_type ix) (dec-string bv ix))
           ((fd ix) (dec-fd cm)))
          (values obj-id mime_type fd)))
      (lambda (obj-id bv ix cm)
        "event decoder for cancelled"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for dnd_drop_performed"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for dnd_finished"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for action"
        (let*-values
          (((dnd_action ix) (dec-u32 bv ix)))
          (values obj-id dnd_action))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for data_offer"
        (let*-values
          (((id ix) (dec-u32 bv ix)))
          (values obj-id id)))
      (lambda (obj-id bv ix cm)
        "event decoder for enter"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix))
           ((x ix) (dec-fixed bv ix))
           ((y ix) (dec-fixed bv ix))
           ((id ix) (dec-u32 bv ix)))
          (values obj-id serial surface x y id)))
      (lambda (obj-id bv ix cm)
        "event decoder for leave"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for motion"
        (let*-values
          (((time ix) (dec-u32 bv ix))
           ((x ix) (dec-fixed bv ix))
           ((y ix) (dec-fixed bv ix)))
          (values obj-id time x y)))
      (lambda (obj-id bv ix cm)
        "event decoder for drop"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for selection"
        (let*-values
          (((id ix) (dec-u32 bv ix)))
          (values obj-id id))))
    (vector)
    (vector)
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for ping"
        (let*-values
          (((serial ix) (dec-u32 bv ix)))
          (values obj-id serial)))
      (lambda (obj-id bv ix cm)
        "event decoder for configure"
        (let*-values
          (((edges ix) (dec-u32 bv ix))
           ((width ix) (dec-s32 bv ix))
           ((height ix) (dec-s32 bv ix)))
          (values obj-id edges width height)))
      (lambda (obj-id bv ix cm)
        "event decoder for popup_done"
        (let*-values () (values obj-id))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for enter"
        (let*-values
          (((output ix) (dec-u32 bv ix)))
          (values obj-id output)))
      (lambda (obj-id bv ix cm)
        "event decoder for leave"
        (let*-values
          (((output ix) (dec-u32 bv ix)))
          (values obj-id output))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for capabilities"
        (let*-values
          (((capabilities ix) (dec-u32 bv ix)))
          (values obj-id capabilities)))
      (lambda (obj-id bv ix cm)
        "event decoder for name"
        (let*-values
          (((name ix) (dec-string bv ix)))
          (values obj-id name))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for enter"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix))
           ((surface_x ix) (dec-fixed bv ix))
           ((surface_y ix) (dec-fixed bv ix)))
          (values
            obj-id
            serial
            surface
            surface_x
            surface_y)))
      (lambda (obj-id bv ix cm)
        "event decoder for leave"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix)))
          (values obj-id serial surface)))
      (lambda (obj-id bv ix cm)
        "event decoder for motion"
        (let*-values
          (((time ix) (dec-u32 bv ix))
           ((surface_x ix) (dec-fixed bv ix))
           ((surface_y ix) (dec-fixed bv ix)))
          (values obj-id time surface_x surface_y)))
      (lambda (obj-id bv ix cm)
        "event decoder for button"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((time ix) (dec-u32 bv ix))
           ((button ix) (dec-u32 bv ix))
           ((state ix) (dec-u32 bv ix)))
          (values obj-id serial time button state)))
      (lambda (obj-id bv ix cm)
        "event decoder for axis"
        (let*-values
          (((time ix) (dec-u32 bv ix))
           ((axis ix) (dec-u32 bv ix))
           ((value ix) (dec-fixed bv ix)))
          (values obj-id time axis value)))
      (lambda (obj-id bv ix cm)
        "event decoder for frame"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for axis_source"
        (let*-values
          (((axis_source ix) (dec-u32 bv ix)))
          (values obj-id axis_source)))
      (lambda (obj-id bv ix cm)
        "event decoder for axis_stop"
        (let*-values
          (((time ix) (dec-u32 bv ix))
           ((axis ix) (dec-u32 bv ix)))
          (values obj-id time axis)))
      (lambda (obj-id bv ix cm)
        "event decoder for axis_discrete"
        (let*-values
          (((axis ix) (dec-u32 bv ix))
           ((discrete ix) (dec-s32 bv ix)))
          (values obj-id axis discrete))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for keymap"
        (let*-values
          (((format ix) (dec-u32 bv ix))
           ((fd ix) (dec-fd cm))
           ((size ix) (dec-u32 bv ix)))
          (values obj-id format fd size)))
      (lambda (obj-id bv ix cm)
        "event decoder for enter"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix))
           ((keys ix) (dec-array bv ix)))
          (values obj-id serial surface keys)))
      (lambda (obj-id bv ix cm)
        "event decoder for leave"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix)))
          (values obj-id serial surface)))
      (lambda (obj-id bv ix cm)
        "event decoder for key"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((time ix) (dec-u32 bv ix))
           ((key ix) (dec-u32 bv ix))
           ((state ix) (dec-u32 bv ix)))
          (values obj-id serial time key state)))
      (lambda (obj-id bv ix cm)
        "event decoder for modifiers"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((mods_depressed ix) (dec-u32 bv ix))
           ((mods_latched ix) (dec-u32 bv ix))
           ((mods_locked ix) (dec-u32 bv ix))
           ((group ix) (dec-u32 bv ix)))
          (values
            obj-id
            serial
            mods_depressed
            mods_latched
            mods_locked
            group)))
      (lambda (obj-id bv ix cm)
        "event decoder for repeat_info"
        (let*-values
          (((rate ix) (dec-s32 bv ix))
           ((delay ix) (dec-s32 bv ix)))
          (values obj-id rate delay))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for down"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((time ix) (dec-u32 bv ix))
           ((surface ix) (dec-u32 bv ix))
           ((id ix) (dec-s32 bv ix))
           ((x ix) (dec-fixed bv ix))
           ((y ix) (dec-fixed bv ix)))
          (values obj-id serial time surface id x y)))
      (lambda (obj-id bv ix cm)
        "event decoder for up"
        (let*-values
          (((serial ix) (dec-u32 bv ix))
           ((time ix) (dec-u32 bv ix))
           ((id ix) (dec-s32 bv ix)))
          (values obj-id serial time id)))
      (lambda (obj-id bv ix cm)
        "event decoder for motion"
        (let*-values
          (((time ix) (dec-u32 bv ix))
           ((id ix) (dec-s32 bv ix))
           ((x ix) (dec-fixed bv ix))
           ((y ix) (dec-fixed bv ix)))
          (values obj-id time id x y)))
      (lambda (obj-id bv ix cm)
        "event decoder for frame"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for cancel"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for shape"
        (let*-values
          (((id ix) (dec-s32 bv ix))
           ((major ix) (dec-fixed bv ix))
           ((minor ix) (dec-fixed bv ix)))
          (values obj-id id major minor)))
      (lambda (obj-id bv ix cm)
        "event decoder for orientation"
        (let*-values
          (((id ix) (dec-s32 bv ix))
           ((orientation ix) (dec-fixed bv ix)))
          (values obj-id id orientation))))
    (vector
      (lambda (obj-id bv ix cm)
        "event decoder for geometry"
        (let*-values
          (((x ix) (dec-s32 bv ix))
           ((y ix) (dec-s32 bv ix))
           ((physical_width ix) (dec-s32 bv ix))
           ((physical_height ix) (dec-s32 bv ix))
           ((subpixel ix) (dec-s32 bv ix))
           ((make ix) (dec-string bv ix))
           ((model ix) (dec-string bv ix))
           ((transform ix) (dec-s32 bv ix)))
          (values
            obj-id
            x
            y
            physical_width
            physical_height
            subpixel
            make
            model
            transform)))
      (lambda (obj-id bv ix cm)
        "event decoder for mode"
        (let*-values
          (((flags ix) (dec-u32 bv ix))
           ((width ix) (dec-s32 bv ix))
           ((height ix) (dec-s32 bv ix))
           ((refresh ix) (dec-s32 bv ix)))
          (values obj-id flags width height refresh)))
      (lambda (obj-id bv ix cm)
        "event decoder for done"
        (let*-values () (values obj-id)))
      (lambda (obj-id bv ix cm)
        "event decoder for scale"
        (let*-values
          (((factor ix) (dec-s32 bv ix)))
          (values obj-id factor)))
      (lambda (obj-id bv ix cm)
        "event decoder for name"
        (let*-values
          (((name ix) (dec-string bv ix)))
          (values obj-id name)))
      (lambda (obj-id bv ix cm)
        "event decoder for description"
        (let*-values
          (((description ix) (dec-string bv ix)))
          (values obj-id description))))
    (vector)
    (vector)
    (vector)))

(define-public (make-wl-handler-vec-vec)
  (vector
    (make-vector 2)
    (make-vector 2)
    (make-vector 1)
    (make-vector 0)
    (make-vector 0)
    (make-vector 1)
    (make-vector 1)
    (make-vector 3)
    (make-vector 6)
    (make-vector 6)
    (make-vector 0)
    (make-vector 0)
    (make-vector 3)
    (make-vector 2)
    (make-vector 2)
    (make-vector 9)
    (make-vector 6)
    (make-vector 7)
    (make-vector 6)
    (make-vector 0)
    (make-vector 0)
    (make-vector 0)))

;; --- last line ---
