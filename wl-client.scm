;; wl-client.scm

;; Copyright (C) 2022 Matthew Wette
;;
;; This library is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 3 of the License, or (at your option) any later version.
;;
;; This library is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public License
;; along with this library; if not, see <http://www.gnu.org/licenses/>.


(define-module (wl-client)
  #:export (fmtbv/x
            enc-u32 dec-u32 enc-s32 dec-s32
            enc-string dec-string enc-array dec-array enc-fd dec-fd
            bytevector-sint-native-ref bytevector-sint-native-set!
            msg-size-offset opcode-offset
            wl-index-dict wl-opcode-dict-vec
            wl-decoder-vec-vec make-wl-handler-vec-vec)
  #:declarative? #f
  #:use-module (sockmsg))
(use-modules (srfi srfi-11))
(use-modules (rnrs bytevectors))
(use-modules (system foreign))

;;(define (sf fmt . args) (apply simple-format #t fmt args))
(define (sferr fmt . args) (apply simple-format (current-error-port) fmt args))
(use-modules (ice-9 pretty-print))
(define (pperr exp) (pretty-print exp (current-error-port)))

(use-modules (ice-9 format))

(define* (fmtbv/x bv st ct #:optional (sc 1))
  (let ((p (open-output-string)))
    (let loop ((ix st) (ct ct))
      (cond
       ((zero? ct) (get-output-string p))
       ((zero? (remainder ix 4))
        (if (zero? (remainder ix sc))
            (format p " ~2,'0x" (bytevector-u8-ref bv ix))
            (format p "~2,'0x" (bytevector-u8-ref bv ix)))
        (loop (1+ ix) (1- ct)))
       (else
        (if (zero? (remainder ix sc))
            (format p " ~2,'0x" (bytevector-u8-ref bv ix))
            (format p "~2,'0x" (bytevector-u8-ref bv ix)))
        (loop (1+ ix) (1- ct)))))))
(export fmtbv/x)

(define endness (native-endianness))
(define sizeof-int (sizeof int))

(define msg-size-offset
  (cond
   ((equal? endness (endianness big)) 4)
   ((equal? endness (endianness little)) 6)))
(define opcode-offset
  (cond
   ((equal? endness (endianness big)) 6)
   ((equal? endness (endianness little)) 4)))

(define (bytevector-sint-native-ref bv ix)
  (bytevector-sint-ref bv ix endness sizeof-int))

(define (bytevector-sint-native-set! bv ix value)
  (bytevector-sint-set! bv ix value endness sizeof-int))

(define bytevector-size_t-ref
  (case (sizeof size_t)
    ((4) bytevector-s32-native-ref)
    ((8) bytevector-s64-native-ref)))

(define bytevector-size_t-set!
  (case (sizeof size_t)
    ((4) bytevector-s32-native-set!)
    ((8) bytevector-s64-native-set!)))


(define-syntax-rule (dec-u32 bv ix)
  (values (bytevector-u32-native-ref bv ix) (+ ix 4)))

(define-syntax-rule (dec-s32 bv ix)
  (values (bytevector-s32-native-ref bv ix) (+ ix 4)))

(define (dec-string bv ix) ;; => values str ix
  (let* ((ln (bytevector-u32-native-ref bv ix))
         (ln-1 (1- ln))
         (bs (make-bytevector ln-1)))
    (bytevector-copy! bv (+ ix 4) bs 0 ln-1)
    (values
     (utf8->string bs)
     (* (quotient (+ ix 4 ln 3) 4) 4))))

(define (dec-array bv ix) ;; => values abv ix
  (let* ((ln (bytevector-u32-native-ref bv ix))
         (array (make-bytevector ln)))
    (bytevector-copy! bv (+ ix 4) array 0 ln)
    (values array (* (quotient (+ ix 4 ln 3) 4) 4))))

(define-syntax-rule (dec-fixed bv ix)
  (values (bytevector-s32-native-ref bv ix) (+ ix 4)))

(define (enc-string bv ix str) ;; => ix
  (let* ((ln (1+ (string-length str)))
         (ln-1 (1- ln)))
    (bytevector-u32-native-set! bv ix ln)
    (bytevector-copy! (string->utf8 str) 0 bv (+ ix 4) ln-1)
    (bytevector-u8-set! bv (+ ix 4 ln-1) 0)
    (* (quotient (+ ix 4 ln 3) 4) 4)))

(define (enc-array bv ix array) ;; => ix
  (let* ((ln (bytevector-length array)))
    (bytevector-u32-native-set! bv ix ln)
    (bytevector-copy! array 0 bv (+ ix 4) ln)
    (* (quotient (+ ix 4 ln 3) 4) 4)))

;; fd is special case

(define cmsghdr-size (+ (sizeof size_t) (* 2 (sizeof int))))
(define fd-level-oset (sizeof size_t))
(define fd-type-oset (+ fd-level-oset (sizeof int)))
(define fd-cmsg-size (+ cmsghdr-size (sizeof int)))

(define (dec-fd cm)
  (bytevector-sint-native-ref cm cmsghdr-size))

(define (enc-fd fd)
  (let* ((bv (make-bytevector fd-cmsg-size)))
    (bytevector-size_t-set! bv 0 fd-cmsg-size)
    (bytevector-sint-native-set! bv fd-level-oset SOL_SOCKET)
    (bytevector-sint-native-set! bv fd-type-oset SCM_RIGHTS)
    (bytevector-sint-native-set! bv cmsghdr-size fd)
    bv))

;; per spec:
;; <spec>-iface-list : gets mapped into wl-index-dict
;; <spec>-opcode-dict-list : 
;; <spec>-decoder-dict-list : 
;; <spec>-handler-dict-list : 

;; collect into:
;;   all-iface-list-list
;;   all-opcode-dict-list
;;   all-decoder-vec-list

(define all-iface-ll '())
(define all-opcode-dict-list '())
(define all-decoder-vec-list '())
(define all-handler-vec-list '())

(define (add-iface-list iface-list)
  (set! all-iface-ll (cons iface-list all-iface-ll)))
(define (add-opcode-dict-list opcode-dict-list)
  (set! all-opcode-dict-list (cons opcode-dict-list all-opcode-dict-list)))
(define (add-decoder-vec-list decoder-vec-list)
  (set! all-decoder-vec-list (cons decoder-vec-list all-decoder-vec-list)))
(define (add-handler-vec-list handler-vec-list)
  (set! all-handler-vec-list (cons handler-vec-list all-handler-vec-list)))

(include-from-path "code/wayland-client.scm")
(include-from-path "code/xdg-shell-client.scm")
;;(include-from-path "code/xdg-decoration-unstable-v1-client.scm")
;;(include-from-path "code/linux-dmabuf-unstable-v1-client.scm")

(define wl-index-dict #f)
(define wl-opcode-dict-vec #f)
(define wl-decoder-vec-vec #f)
(define wl-handler-vec-vec #f)
(define (make-wl-handler-vec-vec)
  (vector-copy wl-handler-vec-vec))

(let ((n (let loop ((ln 0) (dict '()) (cl '()) (ll (reverse all-iface-ll)))
           (cond
            ((pair? cl) (loop (1+ ln) (acons (car cl) ln dict) (cdr cl) ll))
            ((pair? ll) (loop ln dict (car ll) (cdr ll)))
            (else (set! wl-index-dict (reverse dict)) ln))))
      (odl (apply append (reverse all-opcode-dict-list)))
      (dvl (apply append (reverse all-decoder-vec-list)))
      (hvl (apply append (reverse all-handler-vec-list))))
  (set! wl-opcode-dict-vec (list->vector odl))
  (set! wl-decoder-vec-vec (list->vector dvl))
  (set! wl-handler-vec-vec (list->vector hvl))
  (if #f #f))

;; --- last line ---
