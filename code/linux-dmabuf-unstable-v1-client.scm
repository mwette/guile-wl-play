;; linux-dmabuf-unstable-v1-client.scm - from ../../proto/linux-dmabuf-unstable-v1.xml

(define-public linux-dmabuf-iface-list
  '(zwp_linux_dmabuf_v1
     zwp_linux_buffer_params_v1
     zwp_linux_dmabuf_feedback_v1))

(define-public linux-dmabuf-opcode-dict-list
  '(((destroy . 0) (create_params . 1) (format . 0) (modifier . 1) (get_default_feedback . 2) (get_surface_feedback . 3))
    ((destroy . 0) (add . 1) (create . 2) (created . 0) (failed . 1) (create_immed . 3))
    ((destroy . 0) (done . 0) (format_table . 1) (main_device . 2) (tranche_done . 3) (tranche_target_device . 4) (tranche_formats . 5) (tranche_flags . 6))))

(define linux-dmabuf-decoder-vec-list
  (list (vector
          (lambda (obj-id bv ix cm)
            "event decoder for format"
            (let*-values
              (((format ix) (dec-u32 bv ix)))
              (values obj-id format)))
          (lambda (obj-id bv ix cm)
            "event decoder for modifier"
            (let*-values
              (((format ix) (dec-u32 bv ix))
               ((modifier_hi ix) (dec-u32 bv ix))
               ((modifier_lo ix) (dec-u32 bv ix)))
              (values obj-id format modifier_hi modifier_lo))))
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for created"
            (let*-values
              (((buffer ix) (dec-u32 bv ix)))
              (values obj-id buffer)))
          (lambda (obj-id bv ix cm)
            "event decoder for failed"
            (let*-values () (values obj-id))))
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for done"
            (let*-values () (values obj-id)))
          (lambda (obj-id bv ix cm)
            "event decoder for format_table"
            (let*-values
              (((fd ix) (dec-fd cm))
               ((size ix) (dec-u32 bv ix)))
              (values obj-id fd size)))
          (lambda (obj-id bv ix cm)
            "event decoder for main_device"
            (let*-values
              (((device ix) (dec-array bv ix)))
              (values obj-id device)))
          (lambda (obj-id bv ix cm)
            "event decoder for tranche_done"
            (let*-values () (values obj-id)))
          (lambda (obj-id bv ix cm)
            "event decoder for tranche_target_device"
            (let*-values
              (((device ix) (dec-array bv ix)))
              (values obj-id device)))
          (lambda (obj-id bv ix cm)
            "event decoder for tranche_formats"
            (let*-values
              (((indices ix) (dec-array bv ix)))
              (values obj-id indices)))
          (lambda (obj-id bv ix cm)
            "event decoder for tranche_flags"
            (let*-values
              (((flags ix) (dec-u32 bv ix)))
              (values obj-id flags))))))

(define linux-dmabuf-handler-vec-list
  (list (make-vector 2)
        (make-vector 2)
        (make-vector 7)))

(add-iface-list linux-dmabuf-iface-list)
(add-opcode-dict-list linux-dmabuf-opcode-dict-list)
(add-decoder-vec-list linux-dmabuf-decoder-vec-list)
(add-handler-vec-list linux-dmabuf-handler-vec-list)

(define-public encode-zwp_linux_dmabuf_v1:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-zwp_linux_dmabuf_v1:create_params
  (lambda (obj-id bv ix params_id)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        params_id)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-zwp_linux_dmabuf_v1:get_default_feedback
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

(define-public encode-zwp_linux_dmabuf_v1:get_surface_feedback
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
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-zwp_linux_buffer_params_v1:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-zwp_linux_buffer_params_v1:add
  (lambda (obj-id
           bv
           ix
           fd
           plane_idx
           offset
           stride
           modifier_hi
           modifier_lo)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        plane_idx)
      (bytevector-u32-native-set! bv (+ ix 12) offset)
      (bytevector-u32-native-set! bv (+ ix 16) stride)
      (bytevector-u32-native-set!
        bv
        (+ ix 20)
        modifier_hi)
      (bytevector-u32-native-set!
        bv
        (+ ix 24)
        modifier_lo)
      (values (+ ix 28) (enc-fd fd)))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-zwp_linux_buffer_params_v1:create
  (lambda (obj-id bv ix width height format flags)
    (define (encode-body)
      (bytevector-s32-native-set! bv (+ ix 8) width)
      (bytevector-s32-native-set! bv (+ ix 12) height)
      (bytevector-u32-native-set! bv (+ ix 16) format)
      (bytevector-u32-native-set! bv (+ ix 20) flags)
      (values (+ ix 24) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

(define-public encode-zwp_linux_buffer_params_v1:create_immed
  (lambda (obj-id
           bv
           ix
           buffer_id
           width
           height
           format
           flags)
    (define (encode-body)
      (bytevector-u32-native-set!
        bv
        (+ ix 8)
        buffer_id)
      (bytevector-s32-native-set! bv (+ ix 12) width)
      (bytevector-s32-native-set! bv (+ ix 16) height)
      (bytevector-u32-native-set! bv (+ ix 20) format)
      (bytevector-u32-native-set! bv (+ ix 24) flags)
      (values (+ ix 28) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 3)
        (values msg-size control)))))

(define-public encode-zwp_linux_dmabuf_feedback_v1:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

;; --- last line ---
