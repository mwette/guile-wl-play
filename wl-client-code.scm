;; wl-client-code.scm - from wayland.xml

(define-public wayland-index-dict
  '((wl_display . 0)
    (wl_registry . 1)))

(define-public wayland-opcode-dict-vec
  #(((sync . 0) (get_registry . 1) (error . 0) (delete_id . 1))
    ((bind . 0) (global . 0) (global_remove . 1))))

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
          (values obj-id name))))))

(define-public (make-wl-handler-vec-vec)
  (vector (make-vector 2) (make-vector 2)))

;; --- last line ---
