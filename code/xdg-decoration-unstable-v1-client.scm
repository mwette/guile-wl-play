;; xdg-decoration-unstable-v1-client.scm - from ../../proto/xdg-decoration-unstable-v1.xml

(define-public xdg-decoration-unstable-v1-iface-list
  '(zxdg_decoration_manager_v1
     zxdg_toplevel_decoration_v1))

(define-public xdg-decoration-unstable-v1-opcode-dict-list
  '(((destroy . 0) (get_toplevel_decoration . 1))
    ((destroy . 0) (set_mode . 1) (unset_mode . 2) (configure . 0))))

(define xdg-decoration-unstable-v1-decoder-vec-list
  (list (vector)
        (vector
          (lambda (obj-id bv ix cm)
            "event decoder for configure"
            (let*-values
              (((mode ix) (dec-u32 bv ix)))
              (values obj-id mode))))))

(define xdg-decoration-unstable-v1-handler-vec-list
  (list (make-vector 0) (make-vector 1)))

(add-iface-list xdg-decoration-unstable-v1-iface-list)
(add-opcode-dict-list xdg-decoration-unstable-v1-opcode-dict-list)
(add-decoder-vec-list xdg-decoration-unstable-v1-decoder-vec-list)
(add-handler-vec-list xdg-decoration-unstable-v1-handler-vec-list)

(define-public encode-zxdg_decoration_manager_v1:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-zxdg_decoration_manager_v1:get_toplevel_decoration
  (lambda (obj-id bv ix id toplevel)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) id)
      (bytevector-u32-native-set!
        bv
        (+ ix 12)
        toplevel)
      (values (+ ix 16) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-zxdg_toplevel_decoration_v1:destroy
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 0)
        (values msg-size control)))))

(define-public encode-zxdg_toplevel_decoration_v1:set_mode
  (lambda (obj-id bv ix mode)
    (define (encode-body)
      (bytevector-u32-native-set! bv (+ ix 8) mode)
      (values (+ ix 12) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 1)
        (values msg-size control)))))

(define-public encode-zxdg_toplevel_decoration_v1:unset_mode
  (lambda (obj-id bv ix)
    (define (encode-body) (values (+ ix 8) #f))
    (call-with-values
      encode-body
      (lambda (msg-size control)
        (bytevector-u32-native-set! bv ix obj-id)
        (bytevector-u16-native-set! bv (+ ix 6) msg-size)
        (bytevector-u16-native-set! bv (+ ix 4) 2)
        (values msg-size control)))))

;; --- last line ---
