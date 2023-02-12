;; wayland-client.scm - from wayland.xml

(define-public wayland-interface-list
  '(wl_display wl_registry wl_callback wl_compositor wl_shm_pool wl_shm 
    wl_buffer wl_data_offer wl_data_source wl_data_device 
    wl_data_device_manager wl_shell wl_shell_surface wl_surface wl_seat 
    wl_pointer wl_keyboard wl_touch wl_output wl_region wl_subcompositor 
    wl_subsurface))

(define-public wayland-event-opcode-dict-list
  '(;; wl_display
    ((error . 0) (delete_id . 1))
    ;; wl_registry
    ((global . 0) (global_remove . 1))
    ;; wl_callback
    ((done . 0))
    ;; wl_compositor
    ()
    ;; wl_shm_pool
    ()
    ;; wl_shm
    ((format . 0))
    ;; wl_buffer
    ((release . 0))
    ;; wl_data_offer
    ((offer . 0) (source_actions . 1) (action . 2))
    ;; wl_data_source
    ((target . 0) (send . 1) (cancelled . 2) (dnd_drop_performed . 3) 
     (dnd_finished . 4) (action . 5))
    ;; wl_data_device
    ((data_offer . 0) (enter . 1) (leave . 2) (motion . 3) (drop . 4) 
     (selection . 5))
    ;; wl_data_device_manager
    ()
    ;; wl_shell
    ()
    ;; wl_shell_surface
    ((ping . 0) (configure . 1) (popup_done . 2))
    ;; wl_surface
    ((enter . 0) (leave . 1))
    ;; wl_seat
    ((capabilities . 0) (name . 1))
    ;; wl_pointer
    ((enter . 0) (leave . 1) (motion . 2) (button . 3) (axis . 4) 
     (frame . 5) (axis_source . 6) (axis_stop . 7) (axis_discrete . 8))
    ;; wl_keyboard
    ((keymap . 0) (enter . 1) (leave . 2) (key . 3) (modifiers . 4) 
     (repeat_info . 5))
    ;; wl_touch
    ((down . 0) (up . 1) (motion . 2) (frame . 3) (cancel . 4) (shape . 5) 
     (orientation . 6))
    ;; wl_output
    ((geometry . 0) (mode . 1) (done . 2) (scale . 3) (name . 4) 
     (description . 5))
    ;; wl_region
    ()
    ;; wl_subcompositor
    ()
    ;; wl_subsurface
    ()))

(define wayland-decoder-vec-list
  (list
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_display:error"
      (let*-values
        (((object_id ix) (dec-u32 bv ix))
         ((code ix) (dec-u32 bv ix))
         ((message ix) (dec-string bv ix)))
        (values obj-id object_id code message)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_display:delete_id"
      (let*-values
        (((id ix) (dec-u32 bv ix)))
        (values obj-id id))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_registry:global"
      (let*-values
        (((name ix) (dec-u32 bv ix))
         ((interface ix) (dec-string bv ix))
         ((version ix) (dec-u32 bv ix)))
        (values obj-id name interface version)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_registry:global_remove"
      (let*-values
        (((name ix) (dec-u32 bv ix)))
        (values obj-id name))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_callback:done"
      (let*-values
        (((callback_data ix) (dec-u32 bv ix)))
        (values obj-id callback_data))))
   (vector)
   (vector)
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_shm:format"
      (let*-values
        (((format ix) (dec-u32 bv ix)))
        (values obj-id format))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_buffer:release"
      (let*-values () (values obj-id))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_offer:offer"
      (let*-values
        (((mime_type ix) (dec-string bv ix)))
        (values obj-id mime_type)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_offer:source_actions"
      (let*-values
        (((source_actions ix) (dec-u32 bv ix)))
        (values obj-id source_actions)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_offer:action"
      (let*-values
        (((dnd_action ix) (dec-u32 bv ix)))
        (values obj-id dnd_action))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:target"
      (let*-values
        (((mime_type ix) (dec-string bv ix)))
        (values obj-id mime_type)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:send"
      (let*-values
        (((mime_type ix) (dec-string bv ix))
         ((fd ix) (dec-fd cm)))
        (values obj-id mime_type fd)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:cancelled"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:dnd_drop_performed"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:dnd_finished"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_source:action"
      (let*-values
        (((dnd_action ix) (dec-u32 bv ix)))
        (values obj-id dnd_action))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:data_offer"
      (let*-values
        (((id ix) (dec-u32 bv ix)))
        (values obj-id id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:enter"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((surface ix) (dec-u32 bv ix))
         ((x ix) (dec-fixed bv ix))
         ((y ix) (dec-fixed bv ix))
         ((id ix) (dec-u32 bv ix)))
        (values obj-id serial surface x y id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:leave"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:motion"
      (let*-values
        (((time ix) (dec-u32 bv ix))
         ((x ix) (dec-fixed bv ix))
         ((y ix) (dec-fixed bv ix)))
        (values obj-id time x y)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:drop"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_data_device:selection"
      (let*-values
        (((id ix) (dec-u32 bv ix)))
        (values obj-id id))))
   (vector)
   (vector)
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_shell_surface:ping"
      (let*-values
        (((serial ix) (dec-u32 bv ix)))
        (values obj-id serial)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_shell_surface:configure"
      (let*-values
        (((edges ix) (dec-u32 bv ix))
         ((width ix) (dec-s32 bv ix))
         ((height ix) (dec-s32 bv ix)))
        (values obj-id edges width height)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_shell_surface:popup_done"
      (let*-values () (values obj-id))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_surface:enter"
      (let*-values
        (((output ix) (dec-u32 bv ix)))
        (values obj-id output)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_surface:leave"
      (let*-values
        (((output ix) (dec-u32 bv ix)))
        (values obj-id output))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_seat:capabilities"
      (let*-values
        (((capabilities ix) (dec-u32 bv ix)))
        (values obj-id capabilities)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_seat:name"
      (let*-values
        (((name ix) (dec-string bv ix)))
        (values obj-id name))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:enter"
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
      "event decoder for wl_pointer:leave"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((surface ix) (dec-u32 bv ix)))
        (values obj-id serial surface)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:motion"
      (let*-values
        (((time ix) (dec-u32 bv ix))
         ((surface_x ix) (dec-fixed bv ix))
         ((surface_y ix) (dec-fixed bv ix)))
        (values obj-id time surface_x surface_y)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:button"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((time ix) (dec-u32 bv ix))
         ((button ix) (dec-u32 bv ix))
         ((state ix) (dec-u32 bv ix)))
        (values obj-id serial time button state)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:axis"
      (let*-values
        (((time ix) (dec-u32 bv ix))
         ((axis ix) (dec-u32 bv ix))
         ((value ix) (dec-fixed bv ix)))
        (values obj-id time axis value)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:frame"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:axis_source"
      (let*-values
        (((axis_source ix) (dec-u32 bv ix)))
        (values obj-id axis_source)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:axis_stop"
      (let*-values
        (((time ix) (dec-u32 bv ix))
         ((axis ix) (dec-u32 bv ix)))
        (values obj-id time axis)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_pointer:axis_discrete"
      (let*-values
        (((axis ix) (dec-u32 bv ix))
         ((discrete ix) (dec-s32 bv ix)))
        (values obj-id axis discrete))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_keyboard:keymap"
      (let*-values
        (((format ix) (dec-u32 bv ix))
         ((fd ix) (dec-fd cm))
         ((size ix) (dec-u32 bv ix)))
        (values obj-id format fd size)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_keyboard:enter"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((surface ix) (dec-u32 bv ix))
         ((keys ix) (dec-array bv ix)))
        (values obj-id serial surface keys)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_keyboard:leave"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((surface ix) (dec-u32 bv ix)))
        (values obj-id serial surface)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_keyboard:key"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((time ix) (dec-u32 bv ix))
         ((key ix) (dec-u32 bv ix))
         ((state ix) (dec-u32 bv ix)))
        (values obj-id serial time key state)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_keyboard:modifiers"
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
      "event decoder for wl_keyboard:repeat_info"
      (let*-values
        (((rate ix) (dec-s32 bv ix))
         ((delay ix) (dec-s32 bv ix)))
        (values obj-id rate delay))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:down"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((time ix) (dec-u32 bv ix))
         ((surface ix) (dec-u32 bv ix))
         ((id ix) (dec-s32 bv ix))
         ((x ix) (dec-fixed bv ix))
         ((y ix) (dec-fixed bv ix)))
        (values obj-id serial time surface id x y)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:up"
      (let*-values
        (((serial ix) (dec-u32 bv ix))
         ((time ix) (dec-u32 bv ix))
         ((id ix) (dec-s32 bv ix)))
        (values obj-id serial time id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:motion"
      (let*-values
        (((time ix) (dec-u32 bv ix))
         ((id ix) (dec-s32 bv ix))
         ((x ix) (dec-fixed bv ix))
         ((y ix) (dec-fixed bv ix)))
        (values obj-id time id x y)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:frame"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:cancel"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:shape"
      (let*-values
        (((id ix) (dec-s32 bv ix))
         ((major ix) (dec-fixed bv ix))
         ((minor ix) (dec-fixed bv ix)))
        (values obj-id id major minor)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_touch:orientation"
      (let*-values
        (((id ix) (dec-s32 bv ix))
         ((orientation ix) (dec-fixed bv ix)))
        (values obj-id id orientation))))
   (vector
    (lambda (obj-id bv ix cm)
      "event decoder for wl_output:geometry"
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
      "event decoder for wl_output:mode"
      (let*-values
        (((flags ix) (dec-u32 bv ix))
         ((width ix) (dec-s32 bv ix))
         ((height ix) (dec-s32 bv ix))
         ((refresh ix) (dec-s32 bv ix)))
        (values obj-id flags width height refresh)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_output:done"
      (let*-values () (values obj-id)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_output:scale"
      (let*-values
        (((factor ix) (dec-s32 bv ix)))
        (values obj-id factor)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_output:name"
      (let*-values
        (((name ix) (dec-string bv ix)))
        (values obj-id name)))
    (lambda (obj-id bv ix cm)
      "event decoder for wl_output:description"
      (let*-values
        (((description ix) (dec-string bv ix)))
        (values obj-id description))))
   (vector)
   (vector)
   (vector)))

(define wayland-handler-vec-list
  (list (make-vector 2 #f) (make-vector 2 #f) (make-vector 1 #f) 
        (make-vector 0 #f) (make-vector 0 #f) (make-vector 1 #f) 
        (make-vector 1 #f) (make-vector 3 #f) (make-vector 6 #f) 
        (make-vector 6 #f) (make-vector 0 #f) (make-vector 0 #f) 
        (make-vector 3 #f) (make-vector 2 #f) (make-vector 2 #f) 
        (make-vector 9 #f) (make-vector 6 #f) (make-vector 7 #f) 
        (make-vector 6 #f) (make-vector 0 #f) (make-vector 0 #f) 
        (make-vector 0 #f)))

(add-iface-list wayland-interface-list)
(add-opcode-dict-list wayland-event-opcode-dict-list)
(add-decoder-vec-list wayland-decoder-vec-list)
(add-handler-vec-list wayland-handler-vec-list)

(define-public wl_display:error-enum
  '((invalid_object . 0) (invalid_method . 1) (no_memory . 2) 
    (implementation . 3)))

(define-public wl_shm:error-enum
  '((invalid_format . 0) (invalid_stride . 1) (invalid_fd . 2)))

(define-public wl_shm:format-enum
  '((argb8888 . 0) (xrgb8888 . 1) (c8 . #x20203843) (rgb332 . #x38424752) 
    (bgr233 . #x38524742) (xrgb4444 . #x32315258) (xbgr4444 . #x32314258) 
    (rgbx4444 . #x32315852) (bgrx4444 . #x32315842) (argb4444 . #x32315241) 
    (abgr4444 . #x32314241) (rgba4444 . #x32314152) (bgra4444 . #x32314142) 
    (xrgb1555 . #x35315258) (xbgr1555 . #x35314258) (rgbx5551 . #x35315852) 
    (bgrx5551 . #x35315842) (argb1555 . #x35315241) (abgr1555 . #x35314241) 
    (rgba5551 . #x35314152) (bgra5551 . #x35314142) (rgb565 . #x36314752) 
    (bgr565 . #x36314742) (rgb888 . #x34324752) (bgr888 . #x34324742) 
    (xbgr8888 . #x34324258) (rgbx8888 . #x34325852) (bgrx8888 . #x34325842) 
    (abgr8888 . #x34324241) (rgba8888 . #x34324152) (bgra8888 . #x34324142) 
    (xrgb2101010 . #x30335258) (xbgr2101010 . #x30334258) 
    (rgbx1010102 . #x30335852) (bgrx1010102 . #x30335842) 
    (argb2101010 . #x30335241) (abgr2101010 . #x30334241) 
    (rgba1010102 . #x30334152) (bgra1010102 . #x30334142) 
    (yuyv . #x56595559) (yvyu . #x55595659) (uyvy . #x59565955) 
    (vyuy . #x59555956) (ayuv . #x56555941) (nv12 . #x3231564e) 
    (nv21 . #x3132564e) (nv16 . #x3631564e) (nv61 . #x3136564e) 
    (yuv410 . #x39565559) (yvu410 . #x39555659) (yuv411 . #x31315559) 
    (yvu411 . #x31315659) (yuv420 . #x32315559) (yvu420 . #x32315659) 
    (yuv422 . #x36315559) (yvu422 . #x36315659) (yuv444 . #x34325559) 
    (yvu444 . #x34325659) (r8 . #x20203852) (r16 . #x20363152) 
    (rg88 . #x38384752) (gr88 . #x38385247) (rg1616 . #x32334752) 
    (gr1616 . #x32335247) (xrgb16161616f . #x48345258) 
    (xbgr16161616f . #x48344258) (argb16161616f . #x48345241) 
    (abgr16161616f . #x48344241) (xyuv8888 . #x56555958) 
    (vuy888 . #x34325556) (vuy101010 . #x30335556) (y210 . #x30313259) 
    (y212 . #x32313259) (y216 . #x36313259) (y410 . #x30313459) 
    (y412 . #x32313459) (y416 . #x36313459) (xvyu2101010 . #x30335658) 
    (xvyu12_16161616 . #x36335658) (xvyu16161616 . #x38345658) 
    (y0l0 . #x304c3059) (x0l0 . #x304c3058) (y0l2 . #x324c3059) 
    (x0l2 . #x324c3058) (yuv420_8bit . #x38305559) 
    (yuv420_10bit . #x30315559) (xrgb8888_a8 . #x38415258) 
    (xbgr8888_a8 . #x38414258) (rgbx8888_a8 . #x38415852) 
    (bgrx8888_a8 . #x38415842) (rgb888_a8 . #x38413852) 
    (bgr888_a8 . #x38413842) (rgb565_a8 . #x38413552) 
    (bgr565_a8 . #x38413542) (nv24 . #x3432564e) (nv42 . #x3234564e) 
    (p210 . #x30313250) (p010 . #x30313050) (p012 . #x32313050) 
    (p016 . #x36313050) (axbxgxrx106106106106 . #x30314241) 
    (nv15 . #x3531564e) (q410 . #x30313451) (q401 . #x31303451) 
    (xrgb16161616 . #x38345258) (xbgr16161616 . #x38344258) 
    (argb16161616 . #x38345241) (abgr16161616 . #x38344241)))

(define-public wl_data_offer:error-enum
  '((invalid_finish . 0) (invalid_action_mask . 1) (invalid_action . 2) 
    (invalid_offer . 3)))

(define-public wl_data_source:error-enum
  '((invalid_action_mask . 0) (invalid_source . 1)))

(define-public wl_data_device:error-enum
  '((role . 0)))

(define-public wl_data_device_manager:dnd_action-enum
  '((none . 0) (copy . 1) (move . 2) (ask . 4)))

(define-public wl_shell:error-enum
  '((role . 0)))

(define-public wl_shell_surface:resize-enum
  '((none . 0) (top . 1) (bottom . 2) (left . 4) (top_left . 5) 
    (bottom_left . 6) (right . 8) (top_right . 9) (bottom_right . 10)))

(define-public wl_shell_surface:transient-enum
  '((inactive . #x1)))

(define-public wl_shell_surface:fullscreen_method-enum
  '((default . 0) (scale . 1) (driver . 2) (fill . 3)))

(define-public wl_surface:error-enum
  '((invalid_scale . 0) (invalid_transform . 1) (invalid_size . 2) 
    (invalid_offset . 3)))

(define-public wl_seat:capability-enum
  '((pointer . 1) (keyboard . 2) (touch . 4)))

(define-public wl_seat:error-enum
  '((missing_capability . 0)))

(define-public wl_pointer:error-enum
  '((role . 0)))

(define-public wl_pointer:button_state-enum
  '((released . 0) (pressed . 1)))

(define-public wl_pointer:axis-enum
  '((vertical_scroll . 0) (horizontal_scroll . 1)))

(define-public wl_pointer:axis_source-enum
  '((wheel . 0) (finger . 1) (continuous . 2) (wheel_tilt . 3)))

(define-public wl_keyboard:keymap_format-enum
  '((no_keymap . 0) (xkb_v1 . 1)))

(define-public wl_keyboard:key_state-enum
  '((released . 0) (pressed . 1)))

(define-public wl_output:subpixel-enum
  '((unknown . 0) (none . 1) (horizontal_rgb . 2) (horizontal_bgr . 3) 
    (vertical_rgb . 4) (vertical_bgr . 5)))

(define-public wl_output:transform-enum
  '((normal . 0) (90 . 1) (180 . 2) (270 . 3) (flipped . 4) (flipped_90 . 5)
   (flipped_180 . 6) (flipped_270 . 7)))

(define-public wl_output:mode-enum
  '((current . #x1) (preferred . #x2)))

(define-public wl_subcompositor:error-enum
  '((bad_surface . 0)))

(define-public wl_subsurface:error-enum
  '((bad_surface . 0)))

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
      (let ((ix (enc-string bv (+ ix 12) mime_type)))
        (values (+ ix 0) #f)))
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
      (let ((ix (enc-string bv (+ ix 8) mime_type)))
        (values (+ ix 0) #f)))
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
      (let ((ix (enc-string bv (+ ix 8) title)))
        (values (+ ix 0) #f)))
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
      (let ((ix (enc-string bv (+ ix 8) class_)))
        (values (+ ix 0) #f)))
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

;; --- last line ---
