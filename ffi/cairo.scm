;; generated with `guild compile-ffi ffi/cairo.ffi'
;; using nyacc version 3.00.0

(define-module (ffi cairo)
  #:export (M_PI M_2PI make-cairo-unit-matrix)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (system foreign-library)
  #:use-module (nyacc foreign cdata))

(define (foreign-pointer-search name)
  (define (flc l)
    (load-foreign-library
      (car l)
      #:search-path
      (list)))
  (let loop ((libs (list #f "libcairo")))
    (cond ((null? libs) (error "no library for ~s" name))
          ((false-if-exception
             (foreign-library-pointer (flc libs) name)))
          (else (loop (cdr libs))))))


;; extern int cairo_version(void);
(define-public cairo_version
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_version")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; extern const char *cairo_version_string(void);
(define-public cairo_version_string
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_version_string")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; typedef int cairo_bool_t;
(define-public cairo_bool_t
  (name-ctype 'cairo_bool_t (cbase 'int)))

;; typedef struct _cairo cairo_t;
(define-public cairo_t*
  (name-ctype 'cairo_t* (cpointer 'void)))

;; typedef struct _cairo_surface cairo_surface_t;
(define-public cairo_surface_t*
  (name-ctype 'cairo_surface_t* (cpointer 'void)))

;; typedef struct _cairo_device cairo_device_t;
(define-public cairo_device_t*
  (name-ctype 'cairo_device_t* (cpointer 'void)))

;; typedef struct _cairo_matrix {
;;   double xx;
;;   double yx;
;;   double xy;
;;   double yy;
;;   double x0;
;;   double y0;
;; } cairo_matrix_t;
(define-public cairo_matrix_t
  (name-ctype
    'cairo_matrix_t
    (cstruct
      (list `(xx ,(cbase 'double))
            `(yx ,(cbase 'double))
            `(xy ,(cbase 'double))
            `(yy ,(cbase 'double))
            `(x0 ,(cbase 'double))
            `(y0 ,(cbase 'double))))))
(define-public cairo_matrix_t*
  (name-ctype
    'cairo_matrix_t*
    (cpointer cairo_matrix_t)))
(define-public struct-_cairo_matrix
  (name-ctype 'struct-_cairo_matrix cairo_matrix_t))
(define-public struct-_cairo_matrix*
  (name-ctype
    'struct-_cairo_matrix*
    cairo_matrix_t*))

;; typedef struct _cairo_pattern cairo_pattern_t;
(define-public cairo_pattern_t*
  (name-ctype 'cairo_pattern_t* (cpointer 'void)))

;; typedef void (*cairo_destroy_func_t)(void *data);
(define *cairo_destroy_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (data) (~proc data))
        (list '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure ffi:void ~fptr (list '*))))
        (lambda (data)
          (let ((data (cdata-arg->pointer data)))
            (~proc data)))))))
(define-public cairo_destroy_func_t
  (name-ctype
    'cairo_destroy_func_t
    (cpointer *cairo_destroy_func_t)))

;; typedef struct _cairo_user_data_key {
;;   int unused;
;; } cairo_user_data_key_t;
(define-public cairo_user_data_key_t
  (name-ctype
    'cairo_user_data_key_t
    (cstruct (list `(unused ,(cbase 'int))))))
(define-public cairo_user_data_key_t*
  (name-ctype
    'cairo_user_data_key_t*
    (cpointer cairo_user_data_key_t)))
(define-public struct-_cairo_user_data_key
  (name-ctype
    'struct-_cairo_user_data_key
    cairo_user_data_key_t))
(define-public struct-_cairo_user_data_key*
  (name-ctype
    'struct-_cairo_user_data_key*
    cairo_user_data_key_t*))

;; typedef enum _cairo_status {
;;   CAIRO_STATUS_SUCCESS = 0,
;;   CAIRO_STATUS_NO_MEMORY,
;;   CAIRO_STATUS_INVALID_RESTORE,
;;   CAIRO_STATUS_INVALID_POP_GROUP,
;;   CAIRO_STATUS_NO_CURRENT_POINT,
;;   CAIRO_STATUS_INVALID_MATRIX,
;;   CAIRO_STATUS_INVALID_STATUS,
;;   CAIRO_STATUS_NULL_POINTER,
;;   CAIRO_STATUS_INVALID_STRING,
;;   CAIRO_STATUS_INVALID_PATH_DATA,
;;   CAIRO_STATUS_READ_ERROR,
;;   CAIRO_STATUS_WRITE_ERROR,
;;   CAIRO_STATUS_SURFACE_FINISHED,
;;   CAIRO_STATUS_SURFACE_TYPE_MISMATCH,
;;   CAIRO_STATUS_PATTERN_TYPE_MISMATCH,
;;   CAIRO_STATUS_INVALID_CONTENT,
;;   CAIRO_STATUS_INVALID_FORMAT,
;;   CAIRO_STATUS_INVALID_VISUAL,
;;   CAIRO_STATUS_FILE_NOT_FOUND,
;;   CAIRO_STATUS_INVALID_DASH,
;;   CAIRO_STATUS_INVALID_DSC_COMMENT,
;;   CAIRO_STATUS_INVALID_INDEX,
;;   CAIRO_STATUS_CLIP_NOT_REPRESENTABLE,
;;   CAIRO_STATUS_TEMP_FILE_ERROR,
;;   CAIRO_STATUS_INVALID_STRIDE,
;;   CAIRO_STATUS_FONT_TYPE_MISMATCH,
;;   CAIRO_STATUS_USER_FONT_IMMUTABLE,
;;   CAIRO_STATUS_USER_FONT_ERROR,
;;   CAIRO_STATUS_NEGATIVE_COUNT,
;;   CAIRO_STATUS_INVALID_CLUSTERS,
;;   CAIRO_STATUS_INVALID_SLANT,
;;   CAIRO_STATUS_INVALID_WEIGHT,
;;   CAIRO_STATUS_INVALID_SIZE,
;;   CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED,
;;   CAIRO_STATUS_DEVICE_TYPE_MISMATCH,
;;   CAIRO_STATUS_DEVICE_ERROR,
;;   CAIRO_STATUS_INVALID_MESH_CONSTRUCTION,
;;   CAIRO_STATUS_DEVICE_FINISHED,
;;   CAIRO_STATUS_JBIG2_GLOBAL_MISSING,
;;   CAIRO_STATUS_PNG_ERROR,
;;   CAIRO_STATUS_FREETYPE_ERROR,
;;   CAIRO_STATUS_WIN32_GDI_ERROR,
;;   CAIRO_STATUS_TAG_ERROR,
;;   CAIRO_STATUS_DWRITE_ERROR,
;;   CAIRO_STATUS_SVG_FONT_ERROR,
;;   CAIRO_STATUS_LAST_STATUS,
;; } cairo_status_t;
(define-public cairo_status_t
  (name-ctype
    'cairo_status_t
    (cenum '((CAIRO_STATUS_SUCCESS 0)
             (CAIRO_STATUS_NO_MEMORY 1)
             (CAIRO_STATUS_INVALID_RESTORE 2)
             (CAIRO_STATUS_INVALID_POP_GROUP 3)
             (CAIRO_STATUS_NO_CURRENT_POINT 4)
             (CAIRO_STATUS_INVALID_MATRIX 5)
             (CAIRO_STATUS_INVALID_STATUS 6)
             (CAIRO_STATUS_NULL_POINTER 7)
             (CAIRO_STATUS_INVALID_STRING 8)
             (CAIRO_STATUS_INVALID_PATH_DATA 9)
             (CAIRO_STATUS_READ_ERROR 10)
             (CAIRO_STATUS_WRITE_ERROR 11)
             (CAIRO_STATUS_SURFACE_FINISHED 12)
             (CAIRO_STATUS_SURFACE_TYPE_MISMATCH 13)
             (CAIRO_STATUS_PATTERN_TYPE_MISMATCH 14)
             (CAIRO_STATUS_INVALID_CONTENT 15)
             (CAIRO_STATUS_INVALID_FORMAT 16)
             (CAIRO_STATUS_INVALID_VISUAL 17)
             (CAIRO_STATUS_FILE_NOT_FOUND 18)
             (CAIRO_STATUS_INVALID_DASH 19)
             (CAIRO_STATUS_INVALID_DSC_COMMENT 20)
             (CAIRO_STATUS_INVALID_INDEX 21)
             (CAIRO_STATUS_CLIP_NOT_REPRESENTABLE 22)
             (CAIRO_STATUS_TEMP_FILE_ERROR 23)
             (CAIRO_STATUS_INVALID_STRIDE 24)
             (CAIRO_STATUS_FONT_TYPE_MISMATCH 25)
             (CAIRO_STATUS_USER_FONT_IMMUTABLE 26)
             (CAIRO_STATUS_USER_FONT_ERROR 27)
             (CAIRO_STATUS_NEGATIVE_COUNT 28)
             (CAIRO_STATUS_INVALID_CLUSTERS 29)
             (CAIRO_STATUS_INVALID_SLANT 30)
             (CAIRO_STATUS_INVALID_WEIGHT 31)
             (CAIRO_STATUS_INVALID_SIZE 32)
             (CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED 33)
             (CAIRO_STATUS_DEVICE_TYPE_MISMATCH 34)
             (CAIRO_STATUS_DEVICE_ERROR 35)
             (CAIRO_STATUS_INVALID_MESH_CONSTRUCTION 36)
             (CAIRO_STATUS_DEVICE_FINISHED 37)
             (CAIRO_STATUS_JBIG2_GLOBAL_MISSING 38)
             (CAIRO_STATUS_PNG_ERROR 39)
             (CAIRO_STATUS_FREETYPE_ERROR 40)
             (CAIRO_STATUS_WIN32_GDI_ERROR 41)
             (CAIRO_STATUS_TAG_ERROR 42)
             (CAIRO_STATUS_DWRITE_ERROR 43)
             (CAIRO_STATUS_SVG_FONT_ERROR 44)
             (CAIRO_STATUS_LAST_STATUS 45)))))
(define-public unwrap-cairo_status_t
  (let ((numf (cenum-numf (ctype-info cairo_status_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_status_t
  (let ((symf (cenum-symf (ctype-info cairo_status_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_content {
;;   CAIRO_CONTENT_COLOR = 0x1000,
;;   CAIRO_CONTENT_ALPHA = 0x2000,
;;   CAIRO_CONTENT_COLOR_ALPHA = 0x3000,
;; } cairo_content_t;
(define-public cairo_content_t
  (name-ctype
    'cairo_content_t
    (cenum '((CAIRO_CONTENT_COLOR 4096)
             (CAIRO_CONTENT_ALPHA 8192)
             (CAIRO_CONTENT_COLOR_ALPHA 12288)))))
(define-public unwrap-cairo_content_t
  (let ((numf (cenum-numf (ctype-info cairo_content_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_content_t
  (let ((symf (cenum-symf (ctype-info cairo_content_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_format {
;;   CAIRO_FORMAT_INVALID = -1,
;;   CAIRO_FORMAT_ARGB32 = 0,
;;   CAIRO_FORMAT_RGB24 = 1,
;;   CAIRO_FORMAT_A8 = 2,
;;   CAIRO_FORMAT_A1 = 3,
;;   CAIRO_FORMAT_RGB16_565 = 4,
;;   CAIRO_FORMAT_RGB30 = 5,
;;   CAIRO_FORMAT_RGB96F = 6,
;;   CAIRO_FORMAT_RGBA128F = 7,
;; } cairo_format_t;
(define-public cairo_format_t
  (name-ctype
    'cairo_format_t
    (cenum '((CAIRO_FORMAT_INVALID -1)
             (CAIRO_FORMAT_ARGB32 0)
             (CAIRO_FORMAT_RGB24 1)
             (CAIRO_FORMAT_A8 2)
             (CAIRO_FORMAT_A1 3)
             (CAIRO_FORMAT_RGB16_565 4)
             (CAIRO_FORMAT_RGB30 5)
             (CAIRO_FORMAT_RGB96F 6)
             (CAIRO_FORMAT_RGBA128F 7)))))
(define-public unwrap-cairo_format_t
  (let ((numf (cenum-numf (ctype-info cairo_format_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_format_t
  (let ((symf (cenum-symf (ctype-info cairo_format_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_dither {
;;   CAIRO_DITHER_NONE,
;;   CAIRO_DITHER_DEFAULT,
;;   CAIRO_DITHER_FAST,
;;   CAIRO_DITHER_GOOD,
;;   CAIRO_DITHER_BEST,
;; } cairo_dither_t;
(define-public cairo_dither_t
  (name-ctype
    'cairo_dither_t
    (cenum '((CAIRO_DITHER_NONE 0)
             (CAIRO_DITHER_DEFAULT 1)
             (CAIRO_DITHER_FAST 2)
             (CAIRO_DITHER_GOOD 3)
             (CAIRO_DITHER_BEST 4)))))
(define-public unwrap-cairo_dither_t
  (let ((numf (cenum-numf (ctype-info cairo_dither_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_dither_t
  (let ((symf (cenum-symf (ctype-info cairo_dither_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_pattern_set_dither(cairo_pattern_t *pattern, 
;;     cairo_dither_t dither);
(define-public cairo_pattern_set_dither
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_set_dither")
                        (list '* ffi:int)))))
    (lambda (pattern dither)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (dither (unwrap~enum dither)))
        ((force ~proc) pattern dither)))))

;; extern cairo_dither_t cairo_pattern_get_dither(cairo_pattern_t *pattern);
(define-public cairo_pattern_get_dither
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_dither")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret) (wrap-cairo_dither_t ~ret))
         ((force ~proc) pattern))))))

;; typedef cairo_status_t (*cairo_write_func_t)(void *closure, const 
;;     unsigned char *data, unsigned length);
(define *cairo_write_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (closure data length)
          ((lambda (~ret) (unwrap~enum ~ret))
           (~proc closure data length)))
        (list '* '* ffi:unsigned-int)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '* ffi:unsigned-int))))
        (lambda (closure data length)
          (let ((closure (cdata-arg->pointer closure))
                (data (cdata-arg->pointer data))
                (length (cdata-arg->number length)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc closure data length))))))))
(define-public cairo_write_func_t
  (name-ctype
    'cairo_write_func_t
    (cpointer *cairo_write_func_t)))

;; typedef cairo_status_t (*cairo_read_func_t)(void *closure, unsigned char *
;;     data, unsigned length);
(define *cairo_read_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (closure data length)
          ((lambda (~ret) (unwrap~enum ~ret))
           (~proc closure data length)))
        (list '* '* ffi:unsigned-int)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '* ffi:unsigned-int))))
        (lambda (closure data length)
          (let ((closure (cdata-arg->pointer closure))
                (data (cdata-arg->pointer data))
                (length (cdata-arg->number length)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc closure data length))))))))
(define-public cairo_read_func_t
  (name-ctype
    'cairo_read_func_t
    (cpointer *cairo_read_func_t)))

;; typedef struct _cairo_rectangle_int {
;;   int x, y;
;;   int width, height;
;; } cairo_rectangle_int_t;
(define-public cairo_rectangle_int_t
  (name-ctype
    'cairo_rectangle_int_t
    (cstruct
      (list `(x ,(cbase 'int))
            `(y ,(cbase 'int))
            `(width ,(cbase 'int))
            `(height ,(cbase 'int))))))
(define-public cairo_rectangle_int_t*
  (name-ctype
    'cairo_rectangle_int_t*
    (cpointer cairo_rectangle_int_t)))
(define-public struct-_cairo_rectangle_int
  (name-ctype
    'struct-_cairo_rectangle_int
    cairo_rectangle_int_t))
(define-public struct-_cairo_rectangle_int*
  (name-ctype
    'struct-_cairo_rectangle_int*
    cairo_rectangle_int_t*))

;; extern cairo_t *cairo_create(cairo_surface_t *target);
(define-public cairo_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_create")
                        (list '*)))))
    (lambda (target)
      (let ((target
              (cdata-arg->pointer target cairo_surface_t*)))
        ((lambda (~ret) (make-cdata cairo_t* ~ret))
         ((force ~proc) target))))))

;; extern cairo_t *cairo_reference(cairo_t *cr);
(define-public cairo_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_reference")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (make-cdata cairo_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_destroy(cairo_t *cr);
(define-public cairo_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_destroy")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern unsigned cairo_get_reference_count(cairo_t *cr);
(define-public cairo_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_get_reference_count")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void *cairo_get_user_data(cairo_t *cr, const cairo_user_data_key_t *
;;     key);
(define-public cairo_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_user_data")
                        (list '* '*)))))
    (lambda (cr key)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) cr key)))))

;; extern cairo_status_t cairo_set_user_data(cairo_t *cr, const 
;;     cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define-public cairo_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (cr key user_data destroy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) cr key user_data destroy))))))

;; extern void cairo_save(cairo_t *cr);
(define-public cairo_save
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_save")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_restore(cairo_t *cr);
(define-public cairo_restore
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_restore")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_push_group(cairo_t *cr);
(define-public cairo_push_group
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_push_group")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_push_group_with_content(cairo_t *cr, cairo_content_t 
;;     content);
(define-public cairo_push_group_with_content
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_push_group_with_content")
                        (list '* ffi:int)))))
    (lambda (cr content)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (content (unwrap~enum content)))
        ((force ~proc) cr content)))))

;; extern cairo_pattern_t *cairo_pop_group(cairo_t *cr);
(define-public cairo_pop_group
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_pop_group")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_pop_group_to_source(cairo_t *cr);
(define-public cairo_pop_group_to_source
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pop_group_to_source")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; typedef enum _cairo_operator {
;;   CAIRO_OPERATOR_CLEAR,
;;   CAIRO_OPERATOR_SOURCE,
;;   CAIRO_OPERATOR_OVER,
;;   CAIRO_OPERATOR_IN,
;;   CAIRO_OPERATOR_OUT,
;;   CAIRO_OPERATOR_ATOP,
;;   CAIRO_OPERATOR_DEST,
;;   CAIRO_OPERATOR_DEST_OVER,
;;   CAIRO_OPERATOR_DEST_IN,
;;   CAIRO_OPERATOR_DEST_OUT,
;;   CAIRO_OPERATOR_DEST_ATOP,
;;   CAIRO_OPERATOR_XOR,
;;   CAIRO_OPERATOR_ADD,
;;   CAIRO_OPERATOR_SATURATE,
;;   CAIRO_OPERATOR_MULTIPLY,
;;   CAIRO_OPERATOR_SCREEN,
;;   CAIRO_OPERATOR_OVERLAY,
;;   CAIRO_OPERATOR_DARKEN,
;;   CAIRO_OPERATOR_LIGHTEN,
;;   CAIRO_OPERATOR_COLOR_DODGE,
;;   CAIRO_OPERATOR_COLOR_BURN,
;;   CAIRO_OPERATOR_HARD_LIGHT,
;;   CAIRO_OPERATOR_SOFT_LIGHT,
;;   CAIRO_OPERATOR_DIFFERENCE,
;;   CAIRO_OPERATOR_EXCLUSION,
;;   CAIRO_OPERATOR_HSL_HUE,
;;   CAIRO_OPERATOR_HSL_SATURATION,
;;   CAIRO_OPERATOR_HSL_COLOR,
;;   CAIRO_OPERATOR_HSL_LUMINOSITY,
;; } cairo_operator_t;
(define-public cairo_operator_t
  (name-ctype
    'cairo_operator_t
    (cenum '((CAIRO_OPERATOR_CLEAR 0)
             (CAIRO_OPERATOR_SOURCE 1)
             (CAIRO_OPERATOR_OVER 2)
             (CAIRO_OPERATOR_IN 3)
             (CAIRO_OPERATOR_OUT 4)
             (CAIRO_OPERATOR_ATOP 5)
             (CAIRO_OPERATOR_DEST 6)
             (CAIRO_OPERATOR_DEST_OVER 7)
             (CAIRO_OPERATOR_DEST_IN 8)
             (CAIRO_OPERATOR_DEST_OUT 9)
             (CAIRO_OPERATOR_DEST_ATOP 10)
             (CAIRO_OPERATOR_XOR 11)
             (CAIRO_OPERATOR_ADD 12)
             (CAIRO_OPERATOR_SATURATE 13)
             (CAIRO_OPERATOR_MULTIPLY 14)
             (CAIRO_OPERATOR_SCREEN 15)
             (CAIRO_OPERATOR_OVERLAY 16)
             (CAIRO_OPERATOR_DARKEN 17)
             (CAIRO_OPERATOR_LIGHTEN 18)
             (CAIRO_OPERATOR_COLOR_DODGE 19)
             (CAIRO_OPERATOR_COLOR_BURN 20)
             (CAIRO_OPERATOR_HARD_LIGHT 21)
             (CAIRO_OPERATOR_SOFT_LIGHT 22)
             (CAIRO_OPERATOR_DIFFERENCE 23)
             (CAIRO_OPERATOR_EXCLUSION 24)
             (CAIRO_OPERATOR_HSL_HUE 25)
             (CAIRO_OPERATOR_HSL_SATURATION 26)
             (CAIRO_OPERATOR_HSL_COLOR 27)
             (CAIRO_OPERATOR_HSL_LUMINOSITY 28)))))
(define-public unwrap-cairo_operator_t
  (let ((numf (cenum-numf (ctype-info cairo_operator_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_operator_t
  (let ((symf (cenum-symf (ctype-info cairo_operator_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_set_operator(cairo_t *cr, cairo_operator_t op);
(define-public cairo_set_operator
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_operator")
                        (list '* ffi:int)))))
    (lambda (cr op)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (op (unwrap~enum op)))
        ((force ~proc) cr op)))))

;; extern void cairo_set_source(cairo_t *cr, cairo_pattern_t *source);
(define-public cairo_set_source
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_source")
                        (list '* '*)))))
    (lambda (cr source)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (source
              (cdata-arg->pointer source cairo_pattern_t*)))
        ((force ~proc) cr source)))))

;; extern void cairo_set_source_rgb(cairo_t *cr, double red, double green, 
;;     double blue);
(define-public cairo_set_source_rgb
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_source_rgb")
                        (list '* ffi:double ffi:double ffi:double)))))
    (lambda (cr red green blue)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue)))
        ((force ~proc) cr red green blue)))))

;; extern void cairo_set_source_rgba(cairo_t *cr, double red, double green, 
;;     double blue, double alpha);
(define-public cairo_set_source_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_source_rgba")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr red green blue alpha)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue))
            (alpha (cdata-arg->number alpha)))
        ((force ~proc) cr red green blue alpha)))))

;; extern void cairo_set_source_surface(cairo_t *cr, cairo_surface_t *surface, 
;;     double x, double y);
(define-public cairo_set_source_surface
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_set_source_surface")
                        (list '* '* ffi:double ffi:double)))))
    (lambda (cr surface x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr surface x y)))))

;; extern void cairo_set_tolerance(cairo_t *cr, double tolerance);
(define-public cairo_set_tolerance
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_tolerance")
                        (list '* ffi:double)))))
    (lambda (cr tolerance)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (tolerance (cdata-arg->number tolerance)))
        ((force ~proc) cr tolerance)))))

;; typedef enum _cairo_antialias {
;;   CAIRO_ANTIALIAS_DEFAULT,
;;   CAIRO_ANTIALIAS_NONE,
;;   CAIRO_ANTIALIAS_GRAY,
;;   CAIRO_ANTIALIAS_SUBPIXEL,
;;   CAIRO_ANTIALIAS_FAST,
;;   CAIRO_ANTIALIAS_GOOD,
;;   CAIRO_ANTIALIAS_BEST,
;; } cairo_antialias_t;
(define-public cairo_antialias_t
  (name-ctype
    'cairo_antialias_t
    (cenum '((CAIRO_ANTIALIAS_DEFAULT 0)
             (CAIRO_ANTIALIAS_NONE 1)
             (CAIRO_ANTIALIAS_GRAY 2)
             (CAIRO_ANTIALIAS_SUBPIXEL 3)
             (CAIRO_ANTIALIAS_FAST 4)
             (CAIRO_ANTIALIAS_GOOD 5)
             (CAIRO_ANTIALIAS_BEST 6)))))
(define-public unwrap-cairo_antialias_t
  (let ((numf (cenum-numf (ctype-info cairo_antialias_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_antialias_t
  (let ((symf (cenum-symf (ctype-info cairo_antialias_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_set_antialias(cairo_t *cr, cairo_antialias_t antialias);
(define-public cairo_set_antialias
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_antialias")
                        (list '* ffi:int)))))
    (lambda (cr antialias)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (antialias (unwrap~enum antialias)))
        ((force ~proc) cr antialias)))))

;; typedef enum _cairo_fill_rule {
;;   CAIRO_FILL_RULE_WINDING,
;;   CAIRO_FILL_RULE_EVEN_ODD,
;; } cairo_fill_rule_t;
(define-public cairo_fill_rule_t
  (name-ctype
    'cairo_fill_rule_t
    (cenum '((CAIRO_FILL_RULE_WINDING 0)
             (CAIRO_FILL_RULE_EVEN_ODD 1)))))
(define-public unwrap-cairo_fill_rule_t
  (let ((numf (cenum-numf (ctype-info cairo_fill_rule_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_fill_rule_t
  (let ((symf (cenum-symf (ctype-info cairo_fill_rule_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_set_fill_rule(cairo_t *cr, cairo_fill_rule_t fill_rule);
(define-public cairo_set_fill_rule
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_fill_rule")
                        (list '* ffi:int)))))
    (lambda (cr fill_rule)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (fill_rule (unwrap~enum fill_rule)))
        ((force ~proc) cr fill_rule)))))

;; extern void cairo_set_line_width(cairo_t *cr, double width);
(define-public cairo_set_line_width
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_line_width")
                        (list '* ffi:double)))))
    (lambda (cr width)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (width (cdata-arg->number width)))
        ((force ~proc) cr width)))))

;; extern void cairo_set_hairline(cairo_t *cr, cairo_bool_t set_hairline);
(define-public cairo_set_hairline
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_hairline")
                        (list '* ffi:int)))))
    (lambda (cr set_hairline)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (set_hairline (cdata-arg->number set_hairline)))
        ((force ~proc) cr set_hairline)))))

;; typedef enum _cairo_line_cap {
;;   CAIRO_LINE_CAP_BUTT,
;;   CAIRO_LINE_CAP_ROUND,
;;   CAIRO_LINE_CAP_SQUARE,
;; } cairo_line_cap_t;
(define-public cairo_line_cap_t
  (name-ctype
    'cairo_line_cap_t
    (cenum '((CAIRO_LINE_CAP_BUTT 0)
             (CAIRO_LINE_CAP_ROUND 1)
             (CAIRO_LINE_CAP_SQUARE 2)))))
(define-public unwrap-cairo_line_cap_t
  (let ((numf (cenum-numf (ctype-info cairo_line_cap_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_line_cap_t
  (let ((symf (cenum-symf (ctype-info cairo_line_cap_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_set_line_cap(cairo_t *cr, cairo_line_cap_t line_cap);
(define-public cairo_set_line_cap
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_line_cap")
                        (list '* ffi:int)))))
    (lambda (cr line_cap)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (line_cap (unwrap~enum line_cap)))
        ((force ~proc) cr line_cap)))))

;; typedef enum _cairo_line_join {
;;   CAIRO_LINE_JOIN_MITER,
;;   CAIRO_LINE_JOIN_ROUND,
;;   CAIRO_LINE_JOIN_BEVEL,
;; } cairo_line_join_t;
(define-public cairo_line_join_t
  (name-ctype
    'cairo_line_join_t
    (cenum '((CAIRO_LINE_JOIN_MITER 0)
             (CAIRO_LINE_JOIN_ROUND 1)
             (CAIRO_LINE_JOIN_BEVEL 2)))))
(define-public unwrap-cairo_line_join_t
  (let ((numf (cenum-numf (ctype-info cairo_line_join_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_line_join_t
  (let ((symf (cenum-symf (ctype-info cairo_line_join_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_set_line_join(cairo_t *cr, cairo_line_join_t line_join);
(define-public cairo_set_line_join
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_line_join")
                        (list '* ffi:int)))))
    (lambda (cr line_join)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (line_join (unwrap~enum line_join)))
        ((force ~proc) cr line_join)))))

;; extern void cairo_set_dash(cairo_t *cr, const double *dashes, int num_dashes
;;     , double offset);
(define-public cairo_set_dash
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_dash")
                        (list '* '* ffi:int ffi:double)))))
    (lambda (cr dashes num_dashes offset)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dashes (cdata-arg->pointer dashes))
            (num_dashes (cdata-arg->number num_dashes))
            (offset (cdata-arg->number offset)))
        ((force ~proc) cr dashes num_dashes offset)))))

;; extern void cairo_set_miter_limit(cairo_t *cr, double limit);
(define-public cairo_set_miter_limit
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_miter_limit")
                        (list '* ffi:double)))))
    (lambda (cr limit)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (limit (cdata-arg->number limit)))
        ((force ~proc) cr limit)))))

;; extern void cairo_translate(cairo_t *cr, double tx, double ty);
(define-public cairo_translate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_translate")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr tx ty)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (tx (cdata-arg->number tx))
            (ty (cdata-arg->number ty)))
        ((force ~proc) cr tx ty)))))

;; extern void cairo_scale(cairo_t *cr, double sx, double sy);
(define-public cairo_scale
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_scale")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr sx sy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (sx (cdata-arg->number sx))
            (sy (cdata-arg->number sy)))
        ((force ~proc) cr sx sy)))))

;; extern void cairo_rotate(cairo_t *cr, double angle);
(define-public cairo_rotate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_rotate")
                        (list '* ffi:double)))))
    (lambda (cr angle)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (angle (cdata-arg->number angle)))
        ((force ~proc) cr angle)))))

;; extern void cairo_transform(cairo_t *cr, const cairo_matrix_t *matrix);
(define-public cairo_transform
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_transform")
                        (list '* '*)))))
    (lambda (cr matrix)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) cr matrix)))))

;; extern void cairo_set_matrix(cairo_t *cr, const cairo_matrix_t *matrix);
(define-public cairo_set_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_matrix")
                        (list '* '*)))))
    (lambda (cr matrix)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) cr matrix)))))

;; extern void cairo_identity_matrix(cairo_t *cr);
(define-public cairo_identity_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_identity_matrix")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_user_to_device(cairo_t *cr, double *x, double *y);
(define-public cairo_user_to_device
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_user_to_device")
                        (list '* '* '*)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->pointer x))
            (y (cdata-arg->pointer y)))
        ((force ~proc) cr x y)))))

;; extern void cairo_user_to_device_distance(cairo_t *cr, double *dx, double *
;;     dy);
(define-public cairo_user_to_device_distance
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_to_device_distance")
                        (list '* '* '*)))))
    (lambda (cr dx dy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dx (cdata-arg->pointer dx))
            (dy (cdata-arg->pointer dy)))
        ((force ~proc) cr dx dy)))))

;; extern void cairo_device_to_user(cairo_t *cr, double *x, double *y);
(define-public cairo_device_to_user
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_device_to_user")
                        (list '* '* '*)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->pointer x))
            (y (cdata-arg->pointer y)))
        ((force ~proc) cr x y)))))

;; extern void cairo_device_to_user_distance(cairo_t *cr, double *dx, double *
;;     dy);
(define-public cairo_device_to_user_distance
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_device_to_user_distance")
                        (list '* '* '*)))))
    (lambda (cr dx dy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dx (cdata-arg->pointer dx))
            (dy (cdata-arg->pointer dy)))
        ((force ~proc) cr dx dy)))))

;; extern void cairo_new_path(cairo_t *cr);
(define-public cairo_new_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_new_path")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_move_to(cairo_t *cr, double x, double y);
(define-public cairo_move_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_move_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr x y)))))

;; extern void cairo_new_sub_path(cairo_t *cr);
(define-public cairo_new_sub_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_new_sub_path")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_line_to(cairo_t *cr, double x, double y);
(define-public cairo_line_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_line_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr x y)))))

;; extern void cairo_curve_to(cairo_t *cr, double x1, double y1, double x2, 
;;     double y2, double x3, double y3);
(define-public cairo_curve_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_curve_to")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr x1 y1 x2 y2 x3 y3)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x1 (cdata-arg->number x1))
            (y1 (cdata-arg->number y1))
            (x2 (cdata-arg->number x2))
            (y2 (cdata-arg->number y2))
            (x3 (cdata-arg->number x3))
            (y3 (cdata-arg->number y3)))
        ((force ~proc) cr x1 y1 x2 y2 x3 y3)))))

;; extern void cairo_arc(cairo_t *cr, double xc, double yc, double radius, 
;;     double angle1, double angle2);
(define-public cairo_arc
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_arc")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr xc yc radius angle1 angle2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (xc (cdata-arg->number xc))
            (yc (cdata-arg->number yc))
            (radius (cdata-arg->number radius))
            (angle1 (cdata-arg->number angle1))
            (angle2 (cdata-arg->number angle2)))
        ((force ~proc) cr xc yc radius angle1 angle2)))))

;; extern void cairo_arc_negative(cairo_t *cr, double xc, double yc, double 
;;     radius, double angle1, double angle2);
(define-public cairo_arc_negative
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_arc_negative")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr xc yc radius angle1 angle2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (xc (cdata-arg->number xc))
            (yc (cdata-arg->number yc))
            (radius (cdata-arg->number radius))
            (angle1 (cdata-arg->number angle1))
            (angle2 (cdata-arg->number angle2)))
        ((force ~proc) cr xc yc radius angle1 angle2)))))

;; extern void cairo_rel_move_to(cairo_t *cr, double dx, double dy);
(define-public cairo_rel_move_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_rel_move_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr dx dy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dx (cdata-arg->number dx))
            (dy (cdata-arg->number dy)))
        ((force ~proc) cr dx dy)))))

;; extern void cairo_rel_line_to(cairo_t *cr, double dx, double dy);
(define-public cairo_rel_line_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_rel_line_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr dx dy)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dx (cdata-arg->number dx))
            (dy (cdata-arg->number dy)))
        ((force ~proc) cr dx dy)))))

;; extern void cairo_rel_curve_to(cairo_t *cr, double dx1, double dy1, double 
;;     dx2, double dy2, double dx3, double dy3);
(define-public cairo_rel_curve_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_rel_curve_to")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr dx1 dy1 dx2 dy2 dx3 dy3)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dx1 (cdata-arg->number dx1))
            (dy1 (cdata-arg->number dy1))
            (dx2 (cdata-arg->number dx2))
            (dy2 (cdata-arg->number dy2))
            (dx3 (cdata-arg->number dx3))
            (dy3 (cdata-arg->number dy3)))
        ((force ~proc) cr dx1 dy1 dx2 dy2 dx3 dy3)))))

;; extern void cairo_rectangle(cairo_t *cr, double x, double y, double width, 
;;     double height);
(define-public cairo_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_rectangle")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cr x y width height)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((force ~proc) cr x y width height)))))

;; extern void cairo_close_path(cairo_t *cr);
(define-public cairo_close_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_close_path")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_path_extents(cairo_t *cr, double *x1, double *y1, double *
;;     x2, double *y2);
(define-public cairo_path_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_path_extents")
                        (list '* '* '* '* '*)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1))
            (x2 (cdata-arg->pointer x2))
            (y2 (cdata-arg->pointer y2)))
        ((force ~proc) cr x1 y1 x2 y2)))))

;; extern void cairo_paint(cairo_t *cr);
(define-public cairo_paint
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_paint")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_paint_with_alpha(cairo_t *cr, double alpha);
(define-public cairo_paint_with_alpha
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_paint_with_alpha")
                        (list '* ffi:double)))))
    (lambda (cr alpha)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (alpha (cdata-arg->number alpha)))
        ((force ~proc) cr alpha)))))

;; extern void cairo_mask(cairo_t *cr, cairo_pattern_t *pattern);
(define-public cairo_mask
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_mask")
                        (list '* '*)))))
    (lambda (cr pattern)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) cr pattern)))))

;; extern void cairo_mask_surface(cairo_t *cr, cairo_surface_t *surface, double
;;      surface_x, double surface_y);
(define-public cairo_mask_surface
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_mask_surface")
                        (list '* '* ffi:double ffi:double)))))
    (lambda (cr surface surface_x surface_y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (surface_x (cdata-arg->number surface_x))
            (surface_y (cdata-arg->number surface_y)))
        ((force ~proc) cr surface surface_x surface_y)))))

;; extern void cairo_stroke(cairo_t *cr);
(define-public cairo_stroke
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_stroke")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_stroke_preserve(cairo_t *cr);
(define-public cairo_stroke_preserve
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_stroke_preserve")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_fill(cairo_t *cr);
(define-public cairo_fill
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_fill")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_fill_preserve(cairo_t *cr);
(define-public cairo_fill_preserve
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_fill_preserve")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_copy_page(cairo_t *cr);
(define-public cairo_copy_page
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_copy_page")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_show_page(cairo_t *cr);
(define-public cairo_show_page
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_show_page")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern cairo_bool_t cairo_in_stroke(cairo_t *cr, double x, double y);
(define-public cairo_in_stroke
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_in_stroke")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr x y)))))

;; extern cairo_bool_t cairo_in_fill(cairo_t *cr, double x, double y);
(define-public cairo_in_fill
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_in_fill")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr x y)))))

;; extern cairo_bool_t cairo_in_clip(cairo_t *cr, double x, double y);
(define-public cairo_in_clip
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_in_clip")
                        (list '* ffi:double ffi:double)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) cr x y)))))

;; extern void cairo_stroke_extents(cairo_t *cr, double *x1, double *y1, double
;;      *x2, double *y2);
(define-public cairo_stroke_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_stroke_extents")
                        (list '* '* '* '* '*)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1))
            (x2 (cdata-arg->pointer x2))
            (y2 (cdata-arg->pointer y2)))
        ((force ~proc) cr x1 y1 x2 y2)))))

;; extern void cairo_fill_extents(cairo_t *cr, double *x1, double *y1, double *
;;     x2, double *y2);
(define-public cairo_fill_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_fill_extents")
                        (list '* '* '* '* '*)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1))
            (x2 (cdata-arg->pointer x2))
            (y2 (cdata-arg->pointer y2)))
        ((force ~proc) cr x1 y1 x2 y2)))))

;; extern void cairo_reset_clip(cairo_t *cr);
(define-public cairo_reset_clip
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_reset_clip")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_clip(cairo_t *cr);
(define-public cairo_clip
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_clip")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_clip_preserve(cairo_t *cr);
(define-public cairo_clip_preserve
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_clip_preserve")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_clip_extents(cairo_t *cr, double *x1, double *y1, double *
;;     x2, double *y2);
(define-public cairo_clip_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_clip_extents")
                        (list '* '* '* '* '*)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1))
            (x2 (cdata-arg->pointer x2))
            (y2 (cdata-arg->pointer y2)))
        ((force ~proc) cr x1 y1 x2 y2)))))

;; typedef struct _cairo_rectangle {
;;   double x, y, width, height;
;; } cairo_rectangle_t;
(define-public cairo_rectangle_t
  (name-ctype
    'cairo_rectangle_t
    (cstruct
      (list `(x ,(cbase 'double))
            `(y ,(cbase 'double))
            `(width ,(cbase 'double))
            `(height ,(cbase 'double))))))
(define-public cairo_rectangle_t*
  (name-ctype
    'cairo_rectangle_t*
    (cpointer cairo_rectangle_t)))
(define-public struct-_cairo_rectangle
  (name-ctype
    'struct-_cairo_rectangle
    cairo_rectangle_t))
(define-public struct-_cairo_rectangle*
  (name-ctype
    'struct-_cairo_rectangle*
    cairo_rectangle_t*))

;; typedef struct _cairo_rectangle_list {
;;   cairo_status_t status;
;;   cairo_rectangle_t *rectangles;
;;   int num_rectangles;
;; } cairo_rectangle_list_t;
(define-public cairo_rectangle_list_t
  (name-ctype
    'cairo_rectangle_list_t
    (cstruct
      (list `(status ,cairo_status_t)
            `(rectangles ,cairo_rectangle_t*)
            `(num_rectangles ,(cbase 'int))))))
(define-public cairo_rectangle_list_t*
  (name-ctype
    'cairo_rectangle_list_t*
    (cpointer cairo_rectangle_list_t)))
(define-public struct-_cairo_rectangle_list
  (name-ctype
    'struct-_cairo_rectangle_list
    cairo_rectangle_list_t))
(define-public struct-_cairo_rectangle_list*
  (name-ctype
    'struct-_cairo_rectangle_list*
    cairo_rectangle_list_t*))

;; extern cairo_rectangle_list_t *cairo_copy_clip_rectangle_list(cairo_t *cr);
(define-public cairo_copy_clip_rectangle_list
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_copy_clip_rectangle_list")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_rectangle_list_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_rectangle_list_destroy(cairo_rectangle_list_t *
;;     rectangle_list);
(define-public cairo_rectangle_list_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_rectangle_list_destroy")
                        (list '*)))))
    (lambda (rectangle_list)
      (let ((rectangle_list
              (cdata-arg->pointer
                rectangle_list
                cairo_rectangle_list_t*)))
        ((force ~proc) rectangle_list)))))

;; extern void cairo_tag_begin(cairo_t *cr, const char *tag_name, const char *
;;     attributes);
(define-public cairo_tag_begin
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_tag_begin")
                        (list '* '* '*)))))
    (lambda (cr tag_name attributes)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (tag_name (cdata-arg->pointer tag_name))
            (attributes (cdata-arg->pointer attributes)))
        ((force ~proc) cr tag_name attributes)))))

;; extern void cairo_tag_end(cairo_t *cr, const char *tag_name);
(define-public cairo_tag_end
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_tag_end")
                        (list '* '*)))))
    (lambda (cr tag_name)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (tag_name (cdata-arg->pointer tag_name)))
        ((force ~proc) cr tag_name)))))

;; typedef struct _cairo_scaled_font cairo_scaled_font_t;
(define-public cairo_scaled_font_t*
  (name-ctype
    'cairo_scaled_font_t*
    (cpointer 'void)))

;; typedef struct _cairo_font_face cairo_font_face_t;
(define-public cairo_font_face_t*
  (name-ctype 'cairo_font_face_t* (cpointer 'void)))

;; typedef struct {
;;   unsigned long index;
;;   double x;
;;   double y;
;; } cairo_glyph_t;
(define-public cairo_glyph_t
  (name-ctype
    'cairo_glyph_t
    (cstruct
      (list `(index ,(cbase 'unsigned-long))
            `(x ,(cbase 'double))
            `(y ,(cbase 'double))))))
(define-public cairo_glyph_t*
  (name-ctype
    'cairo_glyph_t*
    (cpointer cairo_glyph_t)))

;; extern cairo_glyph_t *cairo_glyph_allocate(int num_glyphs);
(define-public cairo_glyph_allocate
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_glyph_allocate")
                        (list ffi:int)))))
    (lambda (num_glyphs)
      (let ((num_glyphs (cdata-arg->number num_glyphs)))
        ((lambda (~ret) (make-cdata cairo_glyph_t* ~ret))
         ((force ~proc) num_glyphs))))))

;; extern void cairo_glyph_free(cairo_glyph_t *glyphs);
(define-public cairo_glyph_free
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_glyph_free")
                        (list '*)))))
    (lambda (glyphs)
      (let ((glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*)))
        ((force ~proc) glyphs)))))

;; typedef struct {
;;   int num_bytes;
;;   int num_glyphs;
;; } cairo_text_cluster_t;
(define-public cairo_text_cluster_t
  (name-ctype
    'cairo_text_cluster_t
    (cstruct
      (list `(num_bytes ,(cbase 'int))
            `(num_glyphs ,(cbase 'int))))))
(define-public cairo_text_cluster_t*
  (name-ctype
    'cairo_text_cluster_t*
    (cpointer cairo_text_cluster_t)))

;; extern cairo_text_cluster_t *cairo_text_cluster_allocate(int num_clusters);
(define-public cairo_text_cluster_allocate
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_text_cluster_allocate")
                        (list ffi:int)))))
    (lambda (num_clusters)
      (let ((num_clusters (cdata-arg->number num_clusters)))
        ((lambda (~ret)
           (make-cdata cairo_text_cluster_t* ~ret))
         ((force ~proc) num_clusters))))))

;; extern void cairo_text_cluster_free(cairo_text_cluster_t *clusters);
(define-public cairo_text_cluster_free
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_text_cluster_free")
                        (list '*)))))
    (lambda (clusters)
      (let ((clusters
              (cdata-arg->pointer
                clusters
                cairo_text_cluster_t*)))
        ((force ~proc) clusters)))))

;; typedef enum _cairo_text_cluster_flags {
;;   CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = 0x00000001,
;; } cairo_text_cluster_flags_t;
(define-public cairo_text_cluster_flags_t
  (name-ctype
    'cairo_text_cluster_flags_t
    (cenum '((CAIRO_TEXT_CLUSTER_FLAG_BACKWARD 1)))))
(define-public unwrap-cairo_text_cluster_flags_t
  (let ((numf (cenum-numf
                (ctype-info cairo_text_cluster_flags_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_text_cluster_flags_t
  (let ((symf (cenum-symf
                (ctype-info cairo_text_cluster_flags_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef struct {
;;   double x_bearing;
;;   double y_bearing;
;;   double width;
;;   double height;
;;   double x_advance;
;;   double y_advance;
;; } cairo_text_extents_t;
(define-public cairo_text_extents_t
  (name-ctype
    'cairo_text_extents_t
    (cstruct
      (list `(x_bearing ,(cbase 'double))
            `(y_bearing ,(cbase 'double))
            `(width ,(cbase 'double))
            `(height ,(cbase 'double))
            `(x_advance ,(cbase 'double))
            `(y_advance ,(cbase 'double))))))
(define-public cairo_text_extents_t*
  (name-ctype
    'cairo_text_extents_t*
    (cpointer cairo_text_extents_t)))

;; typedef struct {
;;   double ascent;
;;   double descent;
;;   double height;
;;   double max_x_advance;
;;   double max_y_advance;
;; } cairo_font_extents_t;
(define-public cairo_font_extents_t
  (name-ctype
    'cairo_font_extents_t
    (cstruct
      (list `(ascent ,(cbase 'double))
            `(descent ,(cbase 'double))
            `(height ,(cbase 'double))
            `(max_x_advance ,(cbase 'double))
            `(max_y_advance ,(cbase 'double))))))
(define-public cairo_font_extents_t*
  (name-ctype
    'cairo_font_extents_t*
    (cpointer cairo_font_extents_t)))

;; typedef enum _cairo_font_slant {
;;   CAIRO_FONT_SLANT_NORMAL,
;;   CAIRO_FONT_SLANT_ITALIC,
;;   CAIRO_FONT_SLANT_OBLIQUE,
;; } cairo_font_slant_t;
(define-public cairo_font_slant_t
  (name-ctype
    'cairo_font_slant_t
    (cenum '((CAIRO_FONT_SLANT_NORMAL 0)
             (CAIRO_FONT_SLANT_ITALIC 1)
             (CAIRO_FONT_SLANT_OBLIQUE 2)))))
(define-public unwrap-cairo_font_slant_t
  (let ((numf (cenum-numf (ctype-info cairo_font_slant_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_font_slant_t
  (let ((symf (cenum-symf (ctype-info cairo_font_slant_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_font_weight {
;;   CAIRO_FONT_WEIGHT_NORMAL,
;;   CAIRO_FONT_WEIGHT_BOLD,
;; } cairo_font_weight_t;
(define-public cairo_font_weight_t
  (name-ctype
    'cairo_font_weight_t
    (cenum '((CAIRO_FONT_WEIGHT_NORMAL 0)
             (CAIRO_FONT_WEIGHT_BOLD 1)))))
(define-public unwrap-cairo_font_weight_t
  (let ((numf (cenum-numf (ctype-info cairo_font_weight_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_font_weight_t
  (let ((symf (cenum-symf (ctype-info cairo_font_weight_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_subpixel_order {
;;   CAIRO_SUBPIXEL_ORDER_DEFAULT,
;;   CAIRO_SUBPIXEL_ORDER_RGB,
;;   CAIRO_SUBPIXEL_ORDER_BGR,
;;   CAIRO_SUBPIXEL_ORDER_VRGB,
;;   CAIRO_SUBPIXEL_ORDER_VBGR,
;; } cairo_subpixel_order_t;
(define-public cairo_subpixel_order_t
  (name-ctype
    'cairo_subpixel_order_t
    (cenum '((CAIRO_SUBPIXEL_ORDER_DEFAULT 0)
             (CAIRO_SUBPIXEL_ORDER_RGB 1)
             (CAIRO_SUBPIXEL_ORDER_BGR 2)
             (CAIRO_SUBPIXEL_ORDER_VRGB 3)
             (CAIRO_SUBPIXEL_ORDER_VBGR 4)))))
(define-public unwrap-cairo_subpixel_order_t
  (let ((numf (cenum-numf (ctype-info cairo_subpixel_order_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_subpixel_order_t
  (let ((symf (cenum-symf (ctype-info cairo_subpixel_order_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_hint_style {
;;   CAIRO_HINT_STYLE_DEFAULT,
;;   CAIRO_HINT_STYLE_NONE,
;;   CAIRO_HINT_STYLE_SLIGHT,
;;   CAIRO_HINT_STYLE_MEDIUM,
;;   CAIRO_HINT_STYLE_FULL,
;; } cairo_hint_style_t;
(define-public cairo_hint_style_t
  (name-ctype
    'cairo_hint_style_t
    (cenum '((CAIRO_HINT_STYLE_DEFAULT 0)
             (CAIRO_HINT_STYLE_NONE 1)
             (CAIRO_HINT_STYLE_SLIGHT 2)
             (CAIRO_HINT_STYLE_MEDIUM 3)
             (CAIRO_HINT_STYLE_FULL 4)))))
(define-public unwrap-cairo_hint_style_t
  (let ((numf (cenum-numf (ctype-info cairo_hint_style_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_hint_style_t
  (let ((symf (cenum-symf (ctype-info cairo_hint_style_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_hint_metrics {
;;   CAIRO_HINT_METRICS_DEFAULT,
;;   CAIRO_HINT_METRICS_OFF,
;;   CAIRO_HINT_METRICS_ON,
;; } cairo_hint_metrics_t;
(define-public cairo_hint_metrics_t
  (name-ctype
    'cairo_hint_metrics_t
    (cenum '((CAIRO_HINT_METRICS_DEFAULT 0)
             (CAIRO_HINT_METRICS_OFF 1)
             (CAIRO_HINT_METRICS_ON 2)))))
(define-public unwrap-cairo_hint_metrics_t
  (let ((numf (cenum-numf (ctype-info cairo_hint_metrics_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_hint_metrics_t
  (let ((symf (cenum-symf (ctype-info cairo_hint_metrics_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef enum _cairo_color_mode {
;;   CAIRO_COLOR_MODE_DEFAULT,
;;   CAIRO_COLOR_MODE_NO_COLOR,
;;   CAIRO_COLOR_MODE_COLOR,
;; } cairo_color_mode_t;
(define-public cairo_color_mode_t
  (name-ctype
    'cairo_color_mode_t
    (cenum '((CAIRO_COLOR_MODE_DEFAULT 0)
             (CAIRO_COLOR_MODE_NO_COLOR 1)
             (CAIRO_COLOR_MODE_COLOR 2)))))
(define-public unwrap-cairo_color_mode_t
  (let ((numf (cenum-numf (ctype-info cairo_color_mode_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_color_mode_t
  (let ((symf (cenum-symf (ctype-info cairo_color_mode_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef struct _cairo_font_options cairo_font_options_t;
(define-public cairo_font_options_t*
  (name-ctype
    'cairo_font_options_t*
    (cpointer 'void)))

;; extern cairo_font_options_t *cairo_font_options_create(void);
(define-public cairo_font_options_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_font_options_create")
                        (list)))))
    (lambda ()
      (let ()
        ((lambda (~ret)
           (make-cdata cairo_font_options_t* ~ret))
         ((force ~proc)))))))

;; extern cairo_font_options_t *cairo_font_options_copy(const 
;;     cairo_font_options_t *original);
(define-public cairo_font_options_copy
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_font_options_copy")
                        (list '*)))))
    (lambda (original)
      (let ((original
              (cdata-arg->pointer
                original
                cairo_font_options_t*)))
        ((lambda (~ret)
           (make-cdata cairo_font_options_t* ~ret))
         ((force ~proc) original))))))

;; extern void cairo_font_options_destroy(cairo_font_options_t *options);
(define-public cairo_font_options_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_destroy")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) options)))))

;; extern cairo_status_t cairo_font_options_status(cairo_font_options_t *
;;     options);
(define-public cairo_font_options_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_status")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) options))))))

;; extern void cairo_font_options_merge(cairo_font_options_t *options, const 
;;     cairo_font_options_t *other);
(define-public cairo_font_options_merge
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_merge")
                        (list '* '*)))))
    (lambda (options other)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (other (cdata-arg->pointer other cairo_font_options_t*)))
        ((force ~proc) options other)))))

;; extern cairo_bool_t cairo_font_options_equal(const cairo_font_options_t *
;;     options, const cairo_font_options_t *other);
(define-public cairo_font_options_equal
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_equal")
                        (list '* '*)))))
    (lambda (options other)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (other (cdata-arg->pointer other cairo_font_options_t*)))
        ((force ~proc) options other)))))

;; extern unsigned long cairo_font_options_hash(const cairo_font_options_t *
;;     options);
(define-public cairo_font_options_hash
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-long
                        (foreign-pointer-search
                          "cairo_font_options_hash")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) options)))))

;; extern void cairo_font_options_set_antialias(cairo_font_options_t *options, 
;;     cairo_antialias_t antialias);
(define-public cairo_font_options_set_antialias
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_antialias")
                        (list '* ffi:int)))))
    (lambda (options antialias)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (antialias (unwrap~enum antialias)))
        ((force ~proc) options antialias)))))

;; extern cairo_antialias_t cairo_font_options_get_antialias(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_antialias
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_antialias")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret) (wrap-cairo_antialias_t ~ret))
         ((force ~proc) options))))))

;; extern void cairo_font_options_set_subpixel_order(cairo_font_options_t *
;;     options, cairo_subpixel_order_t subpixel_order);
(define-public cairo_font_options_set_subpixel_order
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_subpixel_order")
                        (list '* ffi:int)))))
    (lambda (options subpixel_order)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (subpixel_order (unwrap~enum subpixel_order)))
        ((force ~proc) options subpixel_order)))))

;; extern cairo_subpixel_order_t cairo_font_options_get_subpixel_order(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_subpixel_order
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_subpixel_order")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret)
           (wrap-cairo_subpixel_order_t ~ret))
         ((force ~proc) options))))))

;; extern void cairo_font_options_set_hint_style(cairo_font_options_t *options
;;     , cairo_hint_style_t hint_style);
(define-public cairo_font_options_set_hint_style
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_hint_style")
                        (list '* ffi:int)))))
    (lambda (options hint_style)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (hint_style (unwrap~enum hint_style)))
        ((force ~proc) options hint_style)))))

;; extern cairo_hint_style_t cairo_font_options_get_hint_style(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_hint_style
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_hint_style")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret) (wrap-cairo_hint_style_t ~ret))
         ((force ~proc) options))))))

;; extern void cairo_font_options_set_hint_metrics(cairo_font_options_t *
;;     options, cairo_hint_metrics_t hint_metrics);
(define-public cairo_font_options_set_hint_metrics
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_hint_metrics")
                        (list '* ffi:int)))))
    (lambda (options hint_metrics)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (hint_metrics (unwrap~enum hint_metrics)))
        ((force ~proc) options hint_metrics)))))

;; extern cairo_hint_metrics_t cairo_font_options_get_hint_metrics(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_hint_metrics
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_hint_metrics")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret) (wrap-cairo_hint_metrics_t ~ret))
         ((force ~proc) options))))))

;; extern const char *cairo_font_options_get_variations(cairo_font_options_t *
;;     options);
(define-public cairo_font_options_get_variations
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_font_options_get_variations")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) options)))))

;; extern void cairo_font_options_set_variations(cairo_font_options_t *options
;;     , const char *variations);
(define-public cairo_font_options_set_variations
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_variations")
                        (list '* '*)))))
    (lambda (options variations)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (variations (cdata-arg->pointer variations)))
        ((force ~proc) options variations)))))

;; extern void cairo_font_options_set_color_mode(cairo_font_options_t *options
;;     , cairo_color_mode_t color_mode);
(define-public cairo_font_options_set_color_mode
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_color_mode")
                        (list '* ffi:int)))))
    (lambda (options color_mode)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (color_mode (unwrap~enum color_mode)))
        ((force ~proc) options color_mode)))))

;; extern cairo_color_mode_t cairo_font_options_get_color_mode(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_color_mode
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_color_mode")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret) (wrap-cairo_color_mode_t ~ret))
         ((force ~proc) options))))))

;; extern unsigned cairo_font_options_get_color_palette(const 
;;     cairo_font_options_t *options);
(define-public cairo_font_options_get_color_palette
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_font_options_get_color_palette")
                        (list '*)))))
    (lambda (options)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) options)))))

;; extern void cairo_font_options_set_color_palette(cairo_font_options_t *
;;     options, unsigned palette_index);
(define-public cairo_font_options_set_color_palette
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_color_palette")
                        (list '* ffi:unsigned-int)))))
    (lambda (options palette_index)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (palette_index (cdata-arg->number palette_index)))
        ((force ~proc) options palette_index)))))

;; extern void cairo_font_options_set_custom_palette_color(cairo_font_options_t
;;      *options, unsigned index, double red, double green, double blue, double
;;      alpha);
(define-public cairo_font_options_set_custom_palette_color
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_options_set_custom_palette_color")
                        (list '*
                              ffi:unsigned-int
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (options index red green blue alpha)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (index (cdata-arg->number index))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue))
            (alpha (cdata-arg->number alpha)))
        ((force ~proc)
         options
         index
         red
         green
         blue
         alpha)))))

;; extern cairo_status_t cairo_font_options_get_custom_palette_color(
;;     cairo_font_options_t *options, unsigned index, double *red, double *
;;     green, double *blue, double *alpha);
(define-public cairo_font_options_get_custom_palette_color
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_options_get_custom_palette_color")
                        (list '* ffi:unsigned-int '* '* '* '*)))))
    (lambda (options index red green blue alpha)
      (let ((options
              (cdata-arg->pointer
                options
                cairo_font_options_t*))
            (index (cdata-arg->number index))
            (red (cdata-arg->pointer red))
            (green (cdata-arg->pointer green))
            (blue (cdata-arg->pointer blue))
            (alpha (cdata-arg->pointer alpha)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          options
          index
          red
          green
          blue
          alpha))))))

;; extern void cairo_select_font_face(cairo_t *cr, const char *family, 
;;     cairo_font_slant_t slant, cairo_font_weight_t weight);
(define-public cairo_select_font_face
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_select_font_face")
                        (list '* '* ffi:int ffi:int)))))
    (lambda (cr family slant weight)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (family (cdata-arg->pointer family))
            (slant (unwrap~enum slant))
            (weight (unwrap~enum weight)))
        ((force ~proc) cr family slant weight)))))

;; extern void cairo_set_font_size(cairo_t *cr, double size);
(define-public cairo_set_font_size
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_font_size")
                        (list '* ffi:double)))))
    (lambda (cr size)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (size (cdata-arg->number size)))
        ((force ~proc) cr size)))))

;; extern void cairo_set_font_matrix(cairo_t *cr, const cairo_matrix_t *matrix)
;;     ;
(define-public cairo_set_font_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_font_matrix")
                        (list '* '*)))))
    (lambda (cr matrix)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) cr matrix)))))

;; extern void cairo_get_font_matrix(cairo_t *cr, cairo_matrix_t *matrix);
(define-public cairo_get_font_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_get_font_matrix")
                        (list '* '*)))))
    (lambda (cr matrix)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) cr matrix)))))

;; extern void cairo_set_font_options(cairo_t *cr, const cairo_font_options_t *
;;     options);
(define-public cairo_set_font_options
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_font_options")
                        (list '* '*)))))
    (lambda (cr options)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) cr options)))))

;; extern void cairo_get_font_options(cairo_t *cr, cairo_font_options_t *
;;     options);
(define-public cairo_get_font_options
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_get_font_options")
                        (list '* '*)))))
    (lambda (cr options)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) cr options)))))

;; extern void cairo_set_font_face(cairo_t *cr, cairo_font_face_t *font_face);
(define-public cairo_set_font_face
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_font_face")
                        (list '* '*)))))
    (lambda (cr font_face)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((force ~proc) cr font_face)))))

;; extern cairo_font_face_t *cairo_get_font_face(cairo_t *cr);
(define-public cairo_get_font_face
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_font_face")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_font_face_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_set_scaled_font(cairo_t *cr, const cairo_scaled_font_t *
;;     scaled_font);
(define-public cairo_set_scaled_font
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_set_scaled_font")
                        (list '* '*)))))
    (lambda (cr scaled_font)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((force ~proc) cr scaled_font)))))

;; extern cairo_scaled_font_t *cairo_get_scaled_font(cairo_t *cr);
(define-public cairo_get_scaled_font
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_scaled_font")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_scaled_font_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_show_text(cairo_t *cr, const char *utf8);
(define-public cairo_show_text
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_show_text")
                        (list '* '*)))))
    (lambda (cr utf8)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (utf8 (cdata-arg->pointer utf8)))
        ((force ~proc) cr utf8)))))

;; extern void cairo_show_glyphs(cairo_t *cr, const cairo_glyph_t *glyphs, int 
;;     num_glyphs);
(define-public cairo_show_glyphs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_show_glyphs")
                        (list '* '* ffi:int)))))
    (lambda (cr glyphs num_glyphs)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*))
            (num_glyphs (cdata-arg->number num_glyphs)))
        ((force ~proc) cr glyphs num_glyphs)))))

;; extern void cairo_show_text_glyphs(cairo_t *cr, const char *utf8, int 
;;     utf8_len, const cairo_glyph_t *glyphs, int num_glyphs, const 
;;     cairo_text_cluster_t *clusters, int num_clusters, 
;;     cairo_text_cluster_flags_t cluster_flags);
(define-public cairo_show_text_glyphs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_show_text_glyphs")
                        (list '*
                              '*
                              ffi:int
                              '*
                              ffi:int
                              '*
                              ffi:int
                              ffi:int)))))
    (lambda (cr
             utf8
             utf8_len
             glyphs
             num_glyphs
             clusters
             num_clusters
             cluster_flags)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (utf8 (cdata-arg->pointer utf8))
            (utf8_len (cdata-arg->number utf8_len))
            (glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*))
            (num_glyphs (cdata-arg->number num_glyphs))
            (clusters
              (cdata-arg->pointer
                clusters
                cairo_text_cluster_t*))
            (num_clusters (cdata-arg->number num_clusters))
            (cluster_flags (unwrap~enum cluster_flags)))
        ((force ~proc)
         cr
         utf8
         utf8_len
         glyphs
         num_glyphs
         clusters
         num_clusters
         cluster_flags)))))

;; extern void cairo_text_path(cairo_t *cr, const char *utf8);
(define-public cairo_text_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_text_path")
                        (list '* '*)))))
    (lambda (cr utf8)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (utf8 (cdata-arg->pointer utf8)))
        ((force ~proc) cr utf8)))))

;; extern void cairo_glyph_path(cairo_t *cr, const cairo_glyph_t *glyphs, int 
;;     num_glyphs);
(define-public cairo_glyph_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_glyph_path")
                        (list '* '* ffi:int)))))
    (lambda (cr glyphs num_glyphs)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*))
            (num_glyphs (cdata-arg->number num_glyphs)))
        ((force ~proc) cr glyphs num_glyphs)))))

;; extern void cairo_text_extents(cairo_t *cr, const char *utf8, 
;;     cairo_text_extents_t *extents);
(define-public cairo_text_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_text_extents")
                        (list '* '* '*)))))
    (lambda (cr utf8 extents)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (utf8 (cdata-arg->pointer utf8))
            (extents
              (cdata-arg->pointer
                extents
                cairo_text_extents_t*)))
        ((force ~proc) cr utf8 extents)))))

;; extern void cairo_glyph_extents(cairo_t *cr, const cairo_glyph_t *glyphs, 
;;     int num_glyphs, cairo_text_extents_t *extents);
(define-public cairo_glyph_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_glyph_extents")
                        (list '* '* ffi:int '*)))))
    (lambda (cr glyphs num_glyphs extents)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*))
            (num_glyphs (cdata-arg->number num_glyphs))
            (extents
              (cdata-arg->pointer
                extents
                cairo_text_extents_t*)))
        ((force ~proc) cr glyphs num_glyphs extents)))))

;; extern void cairo_font_extents(cairo_t *cr, cairo_font_extents_t *extents);
(define-public cairo_font_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_font_extents")
                        (list '* '*)))))
    (lambda (cr extents)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (extents
              (cdata-arg->pointer
                extents
                cairo_font_extents_t*)))
        ((force ~proc) cr extents)))))

;; extern cairo_font_face_t *cairo_font_face_reference(cairo_font_face_t *
;;     font_face);
(define-public cairo_font_face_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_font_face_reference")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata cairo_font_face_t* ~ret))
         ((force ~proc) font_face))))))

;; extern void cairo_font_face_destroy(cairo_font_face_t *font_face);
(define-public cairo_font_face_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_font_face_destroy")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((force ~proc) font_face)))))

;; extern unsigned cairo_font_face_get_reference_count(cairo_font_face_t *
;;     font_face);
(define-public cairo_font_face_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_font_face_get_reference_count")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((force ~proc) font_face)))))

;; extern cairo_status_t cairo_font_face_status(cairo_font_face_t *font_face);
(define-public cairo_font_face_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_font_face_status")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) font_face))))))

;; typedef enum _cairo_font_type {
;;   CAIRO_FONT_TYPE_TOY,
;;   CAIRO_FONT_TYPE_FT,
;;   CAIRO_FONT_TYPE_WIN32,
;;   CAIRO_FONT_TYPE_QUARTZ,
;;   CAIRO_FONT_TYPE_USER,
;;   CAIRO_FONT_TYPE_DWRITE,
;; } cairo_font_type_t;
(define-public cairo_font_type_t
  (name-ctype
    'cairo_font_type_t
    (cenum '((CAIRO_FONT_TYPE_TOY 0)
             (CAIRO_FONT_TYPE_FT 1)
             (CAIRO_FONT_TYPE_WIN32 2)
             (CAIRO_FONT_TYPE_QUARTZ 3)
             (CAIRO_FONT_TYPE_USER 4)
             (CAIRO_FONT_TYPE_DWRITE 5)))))
(define-public unwrap-cairo_font_type_t
  (let ((numf (cenum-numf (ctype-info cairo_font_type_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_font_type_t
  (let ((symf (cenum-symf (ctype-info cairo_font_type_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_font_type_t cairo_font_face_get_type(cairo_font_face_t *
;;     font_face);
(define-public cairo_font_face_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_face_get_type")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret) (wrap-cairo_font_type_t ~ret))
         ((force ~proc) font_face))))))

;; extern void *cairo_font_face_get_user_data(cairo_font_face_t *font_face, 
;;     const cairo_user_data_key_t *key);
(define-public cairo_font_face_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_font_face_get_user_data")
                        (list '* '*)))))
    (lambda (font_face key)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) font_face key)))))

;; extern cairo_status_t cairo_font_face_set_user_data(cairo_font_face_t *
;;     font_face, const cairo_user_data_key_t *key, void *user_data, 
;;     cairo_destroy_func_t destroy);
(define-public cairo_font_face_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_font_face_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (font_face key user_data destroy)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) font_face key user_data destroy))))))

;; extern cairo_scaled_font_t *cairo_scaled_font_create(cairo_font_face_t *
;;     font_face, const cairo_matrix_t *font_matrix, const cairo_matrix_t *ctm
;;     , const cairo_font_options_t *options);
(define-public cairo_scaled_font_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_scaled_font_create")
                        (list '* '* '* '*)))))
    (lambda (font_face font_matrix ctm options)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (font_matrix
              (cdata-arg->pointer font_matrix cairo_matrix_t*))
            (ctm (cdata-arg->pointer ctm cairo_matrix_t*))
            (options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((lambda (~ret)
           (make-cdata cairo_scaled_font_t* ~ret))
         ((force ~proc) font_face font_matrix ctm options))))))

;; extern cairo_scaled_font_t *cairo_scaled_font_reference(cairo_scaled_font_t 
;;     *scaled_font);
(define-public cairo_scaled_font_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_scaled_font_reference")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret)
           (make-cdata cairo_scaled_font_t* ~ret))
         ((force ~proc) scaled_font))))))

;; extern void cairo_scaled_font_destroy(cairo_scaled_font_t *scaled_font);
(define-public cairo_scaled_font_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_destroy")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((force ~proc) scaled_font)))))

;; extern unsigned cairo_scaled_font_get_reference_count(cairo_scaled_font_t *
;;     scaled_font);
(define-public cairo_scaled_font_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_scaled_font_get_reference_count")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((force ~proc) scaled_font)))))

;; extern cairo_status_t cairo_scaled_font_status(cairo_scaled_font_t *
;;     scaled_font);
(define-public cairo_scaled_font_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_scaled_font_status")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) scaled_font))))))

;; extern cairo_font_type_t cairo_scaled_font_get_type(cairo_scaled_font_t *
;;     scaled_font);
(define-public cairo_scaled_font_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_scaled_font_get_type")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret) (wrap-cairo_font_type_t ~ret))
         ((force ~proc) scaled_font))))))

;; extern void *cairo_scaled_font_get_user_data(cairo_scaled_font_t *
;;     scaled_font, const cairo_user_data_key_t *key);
(define-public cairo_scaled_font_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_scaled_font_get_user_data")
                        (list '* '*)))))
    (lambda (scaled_font key)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) scaled_font key)))))

;; extern cairo_status_t cairo_scaled_font_set_user_data(cairo_scaled_font_t *
;;     scaled_font, const cairo_user_data_key_t *key, void *user_data, 
;;     cairo_destroy_func_t destroy);
(define-public cairo_scaled_font_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_scaled_font_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (scaled_font key user_data destroy)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) scaled_font key user_data destroy))))))

;; extern void cairo_scaled_font_extents(cairo_scaled_font_t *scaled_font, 
;;     cairo_font_extents_t *extents);
(define-public cairo_scaled_font_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_extents")
                        (list '* '*)))))
    (lambda (scaled_font extents)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (extents
              (cdata-arg->pointer
                extents
                cairo_font_extents_t*)))
        ((force ~proc) scaled_font extents)))))

;; extern void cairo_scaled_font_text_extents(cairo_scaled_font_t *scaled_font
;;     , const char *utf8, cairo_text_extents_t *extents);
(define-public cairo_scaled_font_text_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_text_extents")
                        (list '* '* '*)))))
    (lambda (scaled_font utf8 extents)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (utf8 (cdata-arg->pointer utf8))
            (extents
              (cdata-arg->pointer
                extents
                cairo_text_extents_t*)))
        ((force ~proc) scaled_font utf8 extents)))))

;; extern void cairo_scaled_font_glyph_extents(cairo_scaled_font_t *scaled_font
;;     , const cairo_glyph_t *glyphs, int num_glyphs, cairo_text_extents_t *
;;     extents);
(define-public cairo_scaled_font_glyph_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_glyph_extents")
                        (list '* '* ffi:int '*)))))
    (lambda (scaled_font glyphs num_glyphs extents)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (glyphs
              (cdata-arg->pointer glyphs cairo_glyph_t*))
            (num_glyphs (cdata-arg->number num_glyphs))
            (extents
              (cdata-arg->pointer
                extents
                cairo_text_extents_t*)))
        ((force ~proc)
         scaled_font
         glyphs
         num_glyphs
         extents)))))

;; extern cairo_status_t cairo_scaled_font_text_to_glyphs(cairo_scaled_font_t *
;;     scaled_font, double x, double y, const char *utf8, int utf8_len, 
;;     cairo_glyph_t **glyphs, int *num_glyphs, cairo_text_cluster_t **clusters
;;     , int *num_clusters, cairo_text_cluster_flags_t *cluster_flags);
(define-public cairo_scaled_font_text_to_glyphs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_scaled_font_text_to_glyphs")
                        (list '*
                              ffi:double
                              ffi:double
                              '*
                              ffi:int
                              '*
                              '*
                              '*
                              '*
                              '*)))))
    (lambda (scaled_font
             x
             y
             utf8
             utf8_len
             glyphs
             num_glyphs
             clusters
             num_clusters
             cluster_flags)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y))
            (utf8 (cdata-arg->pointer utf8))
            (utf8_len (cdata-arg->number utf8_len))
            (glyphs (cdata-arg->pointer glyphs))
            (num_glyphs (cdata-arg->pointer num_glyphs))
            (clusters (cdata-arg->pointer clusters))
            (num_clusters (cdata-arg->pointer num_clusters))
            (cluster_flags
              (cdata-arg->pointer
                cluster_flags
                (cpointer cairo_text_cluster_flags_t))))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          scaled_font
          x
          y
          utf8
          utf8_len
          glyphs
          num_glyphs
          clusters
          num_clusters
          cluster_flags))))))

;; extern cairo_font_face_t *cairo_scaled_font_get_font_face(
;;     cairo_scaled_font_t *scaled_font);
(define-public cairo_scaled_font_get_font_face
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_scaled_font_get_font_face")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret)
           (make-cdata cairo_font_face_t* ~ret))
         ((force ~proc) scaled_font))))))

;; extern void cairo_scaled_font_get_font_matrix(cairo_scaled_font_t *
;;     scaled_font, cairo_matrix_t *font_matrix);
(define-public cairo_scaled_font_get_font_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_get_font_matrix")
                        (list '* '*)))))
    (lambda (scaled_font font_matrix)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (font_matrix
              (cdata-arg->pointer font_matrix cairo_matrix_t*)))
        ((force ~proc) scaled_font font_matrix)))))

;; extern void cairo_scaled_font_get_ctm(cairo_scaled_font_t *scaled_font, 
;;     cairo_matrix_t *ctm);
(define-public cairo_scaled_font_get_ctm
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_get_ctm")
                        (list '* '*)))))
    (lambda (scaled_font ctm)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (ctm (cdata-arg->pointer ctm cairo_matrix_t*)))
        ((force ~proc) scaled_font ctm)))))

;; extern void cairo_scaled_font_get_scale_matrix(cairo_scaled_font_t *
;;     scaled_font, cairo_matrix_t *scale_matrix);
(define-public cairo_scaled_font_get_scale_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_get_scale_matrix")
                        (list '* '*)))))
    (lambda (scaled_font scale_matrix)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (scale_matrix
              (cdata-arg->pointer scale_matrix cairo_matrix_t*)))
        ((force ~proc) scaled_font scale_matrix)))))

;; extern void cairo_scaled_font_get_font_options(cairo_scaled_font_t *
;;     scaled_font, cairo_font_options_t *options);
(define-public cairo_scaled_font_get_font_options
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_scaled_font_get_font_options")
                        (list '* '*)))))
    (lambda (scaled_font options)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*))
            (options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) scaled_font options)))))

;; extern cairo_font_face_t *cairo_toy_font_face_create(const char *family, 
;;     cairo_font_slant_t slant, cairo_font_weight_t weight);
(define-public cairo_toy_font_face_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_toy_font_face_create")
                        (list '* ffi:int ffi:int)))))
    (lambda (family slant weight)
      (let ((family (cdata-arg->pointer family))
            (slant (unwrap~enum slant))
            (weight (unwrap~enum weight)))
        ((lambda (~ret)
           (make-cdata cairo_font_face_t* ~ret))
         ((force ~proc) family slant weight))))))

;; extern const char *cairo_toy_font_face_get_family(cairo_font_face_t *
;;     font_face);
(define-public cairo_toy_font_face_get_family
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_toy_font_face_get_family")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((force ~proc) font_face)))))

;; extern cairo_font_slant_t cairo_toy_font_face_get_slant(cairo_font_face_t *
;;     font_face);
(define-public cairo_toy_font_face_get_slant
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_toy_font_face_get_slant")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret) (wrap-cairo_font_slant_t ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_font_weight_t cairo_toy_font_face_get_weight(cairo_font_face_t 
;;     *font_face);
(define-public cairo_toy_font_face_get_weight
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_toy_font_face_get_weight")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret) (wrap-cairo_font_weight_t ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_font_face_t *cairo_user_font_face_create(void);
(define-public cairo_user_font_face_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_create")
                        (list)))))
    (lambda ()
      (let ()
        ((lambda (~ret)
           (make-cdata cairo_font_face_t* ~ret))
         ((force ~proc)))))))

;; typedef cairo_status_t (*cairo_user_scaled_font_init_func_t)(
;;     cairo_scaled_font_t *scaled_font, cairo_t *cr, cairo_font_extents_t *
;;     extents);
(define *cairo_user_scaled_font_init_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (scaled_font cr extents)
          (let ((scaled_font
                  (make-cdata cairo_scaled_font_t* scaled_font))
                (cr (make-cdata cairo_t* cr))
                (extents
                  (make-cdata cairo_font_extents_t* extents)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc scaled_font cr extents))))
        (list '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '* '*))))
        (lambda (scaled_font cr extents)
          (let ((scaled_font
                  (cdata-arg->pointer
                    scaled_font
                    cairo_scaled_font_t*))
                (cr (cdata-arg->pointer cr cairo_t*))
                (extents
                  (cdata-arg->pointer
                    extents
                    cairo_font_extents_t*)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc scaled_font cr extents))))))))
(define-public cairo_user_scaled_font_init_func_t
  (name-ctype
    'cairo_user_scaled_font_init_func_t
    (cpointer *cairo_user_scaled_font_init_func_t)))

;; typedef cairo_status_t (*cairo_user_scaled_font_render_glyph_func_t)(
;;     cairo_scaled_font_t *scaled_font, unsigned long glyph, cairo_t *cr, 
;;     cairo_text_extents_t *extents);
(define *cairo_user_scaled_font_render_glyph_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (scaled_font glyph cr extents)
          (let ((scaled_font
                  (make-cdata cairo_scaled_font_t* scaled_font))
                (cr (make-cdata cairo_t* cr))
                (extents
                  (make-cdata cairo_text_extents_t* extents)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc scaled_font glyph cr extents))))
        (list '* ffi:unsigned-long '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* ffi:unsigned-long '* '*))))
        (lambda (scaled_font glyph cr extents)
          (let ((scaled_font
                  (cdata-arg->pointer
                    scaled_font
                    cairo_scaled_font_t*))
                (glyph (cdata-arg->number glyph))
                (cr (cdata-arg->pointer cr cairo_t*))
                (extents
                  (cdata-arg->pointer
                    extents
                    cairo_text_extents_t*)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc scaled_font glyph cr extents))))))))
(define-public cairo_user_scaled_font_render_glyph_func_t
  (name-ctype
    'cairo_user_scaled_font_render_glyph_func_t
    (cpointer
      *cairo_user_scaled_font_render_glyph_func_t)))

;; typedef cairo_status_t (*cairo_user_scaled_font_text_to_glyphs_func_t)(
;;     cairo_scaled_font_t *scaled_font, const char *utf8, int utf8_len, 
;;     cairo_glyph_t **glyphs, int *num_glyphs, cairo_text_cluster_t **clusters
;;     , int *num_clusters, cairo_text_cluster_flags_t *cluster_flags);
(define *cairo_user_scaled_font_text_to_glyphs_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (scaled_font
                 utf8
                 utf8_len
                 glyphs
                 num_glyphs
                 clusters
                 num_clusters
                 cluster_flags)
          (let ((scaled_font
                  (make-cdata cairo_scaled_font_t* scaled_font)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc scaled_font
                    utf8
                    utf8_len
                    glyphs
                    num_glyphs
                    clusters
                    num_clusters
                    cluster_flags))))
        (list '* '* ffi:int '* '* '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '* ffi:int '* '* '* '* '*))))
        (lambda (scaled_font
                 utf8
                 utf8_len
                 glyphs
                 num_glyphs
                 clusters
                 num_clusters
                 cluster_flags)
          (let ((scaled_font
                  (cdata-arg->pointer
                    scaled_font
                    cairo_scaled_font_t*))
                (utf8 (cdata-arg->pointer utf8))
                (utf8_len (cdata-arg->number utf8_len))
                (glyphs (cdata-arg->pointer glyphs))
                (num_glyphs (cdata-arg->pointer num_glyphs))
                (clusters (cdata-arg->pointer clusters))
                (num_clusters (cdata-arg->pointer num_clusters))
                (cluster_flags
                  (cdata-arg->pointer
                    cluster_flags
                    (cpointer cairo_text_cluster_flags_t))))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc scaled_font
                    utf8
                    utf8_len
                    glyphs
                    num_glyphs
                    clusters
                    num_clusters
                    cluster_flags))))))))
(define-public cairo_user_scaled_font_text_to_glyphs_func_t
  (name-ctype
    'cairo_user_scaled_font_text_to_glyphs_func_t
    (cpointer
      *cairo_user_scaled_font_text_to_glyphs_func_t)))

;; typedef cairo_status_t (*cairo_user_scaled_font_unicode_to_glyph_func_t)(
;;     cairo_scaled_font_t *scaled_font, unsigned long unicode, unsigned long *
;;     glyph_index);
(define *cairo_user_scaled_font_unicode_to_glyph_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (scaled_font unicode glyph_index)
          (let ((scaled_font
                  (make-cdata cairo_scaled_font_t* scaled_font)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc scaled_font unicode glyph_index))))
        (list '* ffi:unsigned-long '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* ffi:unsigned-long '*))))
        (lambda (scaled_font unicode glyph_index)
          (let ((scaled_font
                  (cdata-arg->pointer
                    scaled_font
                    cairo_scaled_font_t*))
                (unicode (cdata-arg->number unicode))
                (glyph_index (cdata-arg->pointer glyph_index)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc scaled_font unicode glyph_index))))))))
(define-public cairo_user_scaled_font_unicode_to_glyph_func_t
  (name-ctype
    'cairo_user_scaled_font_unicode_to_glyph_func_t
    (cpointer
      *cairo_user_scaled_font_unicode_to_glyph_func_t)))

;; extern void cairo_user_font_face_set_init_func(cairo_font_face_t *font_face
;;     , cairo_user_scaled_font_init_func_t init_func);
(define-public cairo_user_font_face_set_init_func
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_font_face_set_init_func")
                        (list '* '*)))))
    (lambda (font_face init_func)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (init_func
              (cdata-arg->pointer
                init_func
                cairo_user_scaled_font_init_func_t)))
        ((force ~proc) font_face init_func)))))

;; extern void cairo_user_font_face_set_render_glyph_func(cairo_font_face_t *
;;     font_face, cairo_user_scaled_font_render_glyph_func_t render_glyph_func)
;;     ;
(define-public cairo_user_font_face_set_render_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_font_face_set_render_glyph_func")
                        (list '* '*)))))
    (lambda (font_face render_glyph_func)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (render_glyph_func
              (cdata-arg->pointer
                render_glyph_func
                cairo_user_scaled_font_render_glyph_func_t)))
        ((force ~proc) font_face render_glyph_func)))))

;; extern void cairo_user_font_face_set_render_color_glyph_func(
;;     cairo_font_face_t *font_face, cairo_user_scaled_font_render_glyph_func_t
;;      render_glyph_func);
(define-public cairo_user_font_face_set_render_color_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_font_face_set_render_color_glyph_func")
                        (list '* '*)))))
    (lambda (font_face render_glyph_func)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (render_glyph_func
              (cdata-arg->pointer
                render_glyph_func
                cairo_user_scaled_font_render_glyph_func_t)))
        ((force ~proc) font_face render_glyph_func)))))

;; extern void cairo_user_font_face_set_text_to_glyphs_func(cairo_font_face_t *
;;     font_face, cairo_user_scaled_font_text_to_glyphs_func_t 
;;     text_to_glyphs_func);
(define-public cairo_user_font_face_set_text_to_glyphs_func
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_font_face_set_text_to_glyphs_func")
                        (list '* '*)))))
    (lambda (font_face text_to_glyphs_func)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (text_to_glyphs_func
              (cdata-arg->pointer
                text_to_glyphs_func
                cairo_user_scaled_font_text_to_glyphs_func_t)))
        ((force ~proc) font_face text_to_glyphs_func)))))

;; extern void cairo_user_font_face_set_unicode_to_glyph_func(cairo_font_face_t
;;      *font_face, cairo_user_scaled_font_unicode_to_glyph_func_t 
;;     unicode_to_glyph_func);
(define-public cairo_user_font_face_set_unicode_to_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_user_font_face_set_unicode_to_glyph_func")
                        (list '* '*)))))
    (lambda (font_face unicode_to_glyph_func)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*))
            (unicode_to_glyph_func
              (cdata-arg->pointer
                unicode_to_glyph_func
                cairo_user_scaled_font_unicode_to_glyph_func_t)))
        ((force ~proc) font_face unicode_to_glyph_func)))))

;; extern cairo_user_scaled_font_init_func_t cairo_user_font_face_get_init_func
;;     (cairo_font_face_t *font_face);
(define-public cairo_user_font_face_get_init_func
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_get_init_func")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_user_scaled_font_init_func_t
             ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_user_scaled_font_render_glyph_func_t 
;;     cairo_user_font_face_get_render_glyph_func(cairo_font_face_t *font_face)
;;     ;
(define-public cairo_user_font_face_get_render_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_get_render_glyph_func")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_user_scaled_font_render_glyph_func_t
             ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_user_scaled_font_render_glyph_func_t 
;;     cairo_user_font_face_get_render_color_glyph_func(cairo_font_face_t *
;;     font_face);
(define-public cairo_user_font_face_get_render_color_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_get_render_color_glyph_func")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_user_scaled_font_render_glyph_func_t
             ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_user_scaled_font_text_to_glyphs_func_t 
;;     cairo_user_font_face_get_text_to_glyphs_func(cairo_font_face_t *
;;     font_face);
(define-public cairo_user_font_face_get_text_to_glyphs_func
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_get_text_to_glyphs_func")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_user_scaled_font_text_to_glyphs_func_t
             ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_user_scaled_font_unicode_to_glyph_func_t 
;;     cairo_user_font_face_get_unicode_to_glyph_func(cairo_font_face_t *
;;     font_face);
(define-public cairo_user_font_face_get_unicode_to_glyph_func
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_font_face_get_unicode_to_glyph_func")
                        (list '*)))))
    (lambda (font_face)
      (let ((font_face
              (cdata-arg->pointer font_face cairo_font_face_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_user_scaled_font_unicode_to_glyph_func_t
             ~ret))
         ((force ~proc) font_face))))))

;; extern cairo_pattern_t *cairo_user_scaled_font_get_foreground_marker(
;;     cairo_scaled_font_t *scaled_font);
(define-public cairo_user_scaled_font_get_foreground_marker
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_scaled_font_get_foreground_marker")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) scaled_font))))))

;; extern cairo_pattern_t *cairo_user_scaled_font_get_foreground_source(
;;     cairo_scaled_font_t *scaled_font);
(define-public cairo_user_scaled_font_get_foreground_source
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_user_scaled_font_get_foreground_source")
                        (list '*)))))
    (lambda (scaled_font)
      (let ((scaled_font
              (cdata-arg->pointer
                scaled_font
                cairo_scaled_font_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) scaled_font))))))

;; extern cairo_operator_t cairo_get_operator(cairo_t *cr);
(define-public cairo_get_operator
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_operator")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_operator_t ~ret))
         ((force ~proc) cr))))))

;; extern cairo_pattern_t *cairo_get_source(cairo_t *cr);
(define-public cairo_get_source
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_source")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) cr))))))

;; extern double cairo_get_tolerance(cairo_t *cr);
(define-public cairo_get_tolerance
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search "cairo_get_tolerance")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern cairo_antialias_t cairo_get_antialias(cairo_t *cr);
(define-public cairo_get_antialias
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_antialias")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_antialias_t ~ret))
         ((force ~proc) cr))))))

;; extern cairo_bool_t cairo_has_current_point(cairo_t *cr);
(define-public cairo_has_current_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_has_current_point")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_get_current_point(cairo_t *cr, double *x, double *y);
(define-public cairo_get_current_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_get_current_point")
                        (list '* '* '*)))))
    (lambda (cr x y)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (x (cdata-arg->pointer x))
            (y (cdata-arg->pointer y)))
        ((force ~proc) cr x y)))))

;; extern cairo_fill_rule_t cairo_get_fill_rule(cairo_t *cr);
(define-public cairo_get_fill_rule
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_fill_rule")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_fill_rule_t ~ret))
         ((force ~proc) cr))))))

;; extern double cairo_get_line_width(cairo_t *cr);
(define-public cairo_get_line_width
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search "cairo_get_line_width")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern cairo_bool_t cairo_get_hairline(cairo_t *cr);
(define-public cairo_get_hairline
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_hairline")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern cairo_line_cap_t cairo_get_line_cap(cairo_t *cr);
(define-public cairo_get_line_cap
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_line_cap")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_line_cap_t ~ret))
         ((force ~proc) cr))))))

;; extern cairo_line_join_t cairo_get_line_join(cairo_t *cr);
(define-public cairo_get_line_join
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_line_join")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_line_join_t ~ret))
         ((force ~proc) cr))))))

;; extern double cairo_get_miter_limit(cairo_t *cr);
(define-public cairo_get_miter_limit
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search "cairo_get_miter_limit")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern int cairo_get_dash_count(cairo_t *cr);
(define-public cairo_get_dash_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_get_dash_count")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((force ~proc) cr)))))

;; extern void cairo_get_dash(cairo_t *cr, double *dashes, double *offset);
(define-public cairo_get_dash
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_get_dash")
                        (list '* '* '*)))))
    (lambda (cr dashes offset)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (dashes (cdata-arg->pointer dashes))
            (offset (cdata-arg->pointer offset)))
        ((force ~proc) cr dashes offset)))))

;; extern void cairo_get_matrix(cairo_t *cr, cairo_matrix_t *matrix);
(define-public cairo_get_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_get_matrix")
                        (list '* '*)))))
    (lambda (cr matrix)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) cr matrix)))))

;; extern cairo_surface_t *cairo_get_target(cairo_t *cr);
(define-public cairo_get_target
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_target")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) cr))))))

;; extern cairo_surface_t *cairo_get_group_target(cairo_t *cr);
(define-public cairo_get_group_target
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_get_group_target")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) cr))))))

;; typedef enum _cairo_path_data_type {
;;   CAIRO_PATH_MOVE_TO,
;;   CAIRO_PATH_LINE_TO,
;;   CAIRO_PATH_CURVE_TO,
;;   CAIRO_PATH_CLOSE_PATH,
;; } cairo_path_data_type_t;
(define-public cairo_path_data_type_t
  (name-ctype
    'cairo_path_data_type_t
    (cenum '((CAIRO_PATH_MOVE_TO 0)
             (CAIRO_PATH_LINE_TO 1)
             (CAIRO_PATH_CURVE_TO 2)
             (CAIRO_PATH_CLOSE_PATH 3)))))
(define-public unwrap-cairo_path_data_type_t
  (let ((numf (cenum-numf (ctype-info cairo_path_data_type_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_path_data_type_t
  (let ((symf (cenum-symf (ctype-info cairo_path_data_type_t))))
    (lambda (arg) (or (symf arg) arg))))

;; typedef union _cairo_path_data_t cairo_path_data_t;
(define-public cairo_path_data_t*
  (name-ctype
    'cairo_path_data_t*
    (cpointer (delay cairo_path_data_t))))

;; union _cairo_path_data_t {
;;   struct {
;;     cairo_path_data_type_t type;
;;     int length;
;;   } header;
;;   struct {
;;     double x, y;
;;   } point;
;; };
(define-public union-_cairo_path_data_t
  (name-ctype
    'union-_cairo_path_data_t
    (cunion
      (list `(header
               ,(cstruct
                  (list `(type ,cairo_path_data_type_t)
                        `(length ,(cbase 'int)))))
            `(point ,(cstruct
                       (list `(x ,(cbase 'double))
                             `(y ,(cbase 'double)))))))))
(define-public union-_cairo_path_data_t*
  (name-ctype
    'union-_cairo_path_data_t*
    (cpointer union-_cairo_path_data_t)))
(define-public cairo_path_data_t
  (name-ctype
    'cairo_path_data_t
    union-_cairo_path_data_t))

;; typedef struct cairo_path {
;;   cairo_status_t status;
;;   cairo_path_data_t *data;
;;   int num_data;
;; } cairo_path_t;
(define-public cairo_path_t
  (name-ctype
    'cairo_path_t
    (cstruct
      (list `(status ,cairo_status_t)
            `(data ,cairo_path_data_t*)
            `(num_data ,(cbase 'int))))))
(define-public cairo_path_t*
  (name-ctype
    'cairo_path_t*
    (cpointer cairo_path_t)))
(define-public struct-cairo_path
  (name-ctype 'struct-cairo_path cairo_path_t))
(define-public struct-cairo_path*
  (name-ctype 'struct-cairo_path* cairo_path_t*))

;; extern cairo_path_t *cairo_copy_path(cairo_t *cr);
(define-public cairo_copy_path
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_copy_path")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (make-cdata cairo_path_t* ~ret))
         ((force ~proc) cr))))))

;; extern cairo_path_t *cairo_copy_path_flat(cairo_t *cr);
(define-public cairo_copy_path_flat
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_copy_path_flat")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (make-cdata cairo_path_t* ~ret))
         ((force ~proc) cr))))))

;; extern void cairo_append_path(cairo_t *cr, const cairo_path_t *path);
(define-public cairo_append_path
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_append_path")
                        (list '* '*)))))
    (lambda (cr path)
      (let ((cr (cdata-arg->pointer cr cairo_t*))
            (path (cdata-arg->pointer path cairo_path_t*)))
        ((force ~proc) cr path)))))

;; extern void cairo_path_destroy(cairo_path_t *path);
(define-public cairo_path_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_path_destroy")
                        (list '*)))))
    (lambda (path)
      (let ((path (cdata-arg->pointer path cairo_path_t*)))
        ((force ~proc) path)))))

;; extern cairo_status_t cairo_status(cairo_t *cr);
(define-public cairo_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_status")
                        (list '*)))))
    (lambda (cr)
      (let ((cr (cdata-arg->pointer cr cairo_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) cr))))))

;; extern const char *cairo_status_to_string(cairo_status_t status);
(define-public cairo_status_to_string
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_status_to_string")
                        (list ffi:int)))))
    (lambda (status)
      (let ((status (unwrap~enum status)))
        ((force ~proc) status)))))

;; extern cairo_device_t *cairo_device_reference(cairo_device_t *device);
(define-public cairo_device_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_device_reference")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((lambda (~ret) (make-cdata cairo_device_t* ~ret))
         ((force ~proc) device))))))

;; typedef enum _cairo_device_type {
;;   CAIRO_DEVICE_TYPE_DRM,
;;   CAIRO_DEVICE_TYPE_GL,
;;   CAIRO_DEVICE_TYPE_SCRIPT,
;;   CAIRO_DEVICE_TYPE_XCB,
;;   CAIRO_DEVICE_TYPE_XLIB,
;;   CAIRO_DEVICE_TYPE_XML,
;;   CAIRO_DEVICE_TYPE_COGL,
;;   CAIRO_DEVICE_TYPE_WIN32,
;;   CAIRO_DEVICE_TYPE_INVALID = -1,
;; } cairo_device_type_t;
(define-public cairo_device_type_t
  (name-ctype
    'cairo_device_type_t
    (cenum '((CAIRO_DEVICE_TYPE_DRM 0)
             (CAIRO_DEVICE_TYPE_GL 1)
             (CAIRO_DEVICE_TYPE_SCRIPT 2)
             (CAIRO_DEVICE_TYPE_XCB 3)
             (CAIRO_DEVICE_TYPE_XLIB 4)
             (CAIRO_DEVICE_TYPE_XML 5)
             (CAIRO_DEVICE_TYPE_COGL 6)
             (CAIRO_DEVICE_TYPE_WIN32 7)
             (CAIRO_DEVICE_TYPE_INVALID -1)))))
(define-public unwrap-cairo_device_type_t
  (let ((numf (cenum-numf (ctype-info cairo_device_type_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_device_type_t
  (let ((symf (cenum-symf (ctype-info cairo_device_type_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_device_type_t cairo_device_get_type(cairo_device_t *device);
(define-public cairo_device_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_device_get_type")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((lambda (~ret) (wrap-cairo_device_type_t ~ret))
         ((force ~proc) device))))))

;; extern cairo_status_t cairo_device_status(cairo_device_t *device);
(define-public cairo_device_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_device_status")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) device))))))

;; extern cairo_status_t cairo_device_acquire(cairo_device_t *device);
(define-public cairo_device_acquire
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_device_acquire")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) device))))))

;; extern void cairo_device_release(cairo_device_t *device);
(define-public cairo_device_release
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_device_release")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((force ~proc) device)))))

;; extern void cairo_device_flush(cairo_device_t *device);
(define-public cairo_device_flush
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_device_flush")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((force ~proc) device)))))

;; extern void cairo_device_finish(cairo_device_t *device);
(define-public cairo_device_finish
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_device_finish")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((force ~proc) device)))))

;; extern void cairo_device_destroy(cairo_device_t *device);
(define-public cairo_device_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_device_destroy")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((force ~proc) device)))))

;; extern unsigned cairo_device_get_reference_count(cairo_device_t *device);
(define-public cairo_device_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_device_get_reference_count")
                        (list '*)))))
    (lambda (device)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*)))
        ((force ~proc) device)))))

;; extern void *cairo_device_get_user_data(cairo_device_t *device, const 
;;     cairo_user_data_key_t *key);
(define-public cairo_device_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_device_get_user_data")
                        (list '* '*)))))
    (lambda (device key)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) device key)))))

;; extern cairo_status_t cairo_device_set_user_data(cairo_device_t *device, 
;;     const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define-public cairo_device_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_device_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (device key user_data destroy)
      (let ((device
              (cdata-arg->pointer device cairo_device_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) device key user_data destroy))))))

;; extern cairo_surface_t *cairo_surface_create_similar(cairo_surface_t *other
;;     , cairo_content_t content, int width, int height);
(define-public cairo_surface_create_similar
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_create_similar")
                        (list '* ffi:int ffi:int ffi:int)))))
    (lambda (other content width height)
      (let ((other (cdata-arg->pointer other cairo_surface_t*))
            (content (unwrap~enum content))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) other content width height))))))

;; extern cairo_surface_t *cairo_surface_create_similar_image(cairo_surface_t *
;;     other, cairo_format_t format, int width, int height);
(define-public cairo_surface_create_similar_image
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_create_similar_image")
                        (list '* ffi:int ffi:int ffi:int)))))
    (lambda (other format width height)
      (let ((other (cdata-arg->pointer other cairo_surface_t*))
            (format (unwrap~enum format))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) other format width height))))))

;; extern cairo_surface_t *cairo_surface_map_to_image(cairo_surface_t *surface
;;     , const cairo_rectangle_int_t *extents);
(define-public cairo_surface_map_to_image
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_map_to_image")
                        (list '* '*)))))
    (lambda (surface extents)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (extents
              (cdata-arg->pointer
                extents
                cairo_rectangle_int_t*)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) surface extents))))))

;; extern void cairo_surface_unmap_image(cairo_surface_t *surface, 
;;     cairo_surface_t *image);
(define-public cairo_surface_unmap_image
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_unmap_image")
                        (list '* '*)))))
    (lambda (surface image)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (image (cdata-arg->pointer image cairo_surface_t*)))
        ((force ~proc) surface image)))))

;; extern cairo_surface_t *cairo_surface_create_for_rectangle(cairo_surface_t *
;;     target, double x, double y, double width, double height);
(define-public cairo_surface_create_for_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_create_for_rectangle")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (target x y width height)
      (let ((target
              (cdata-arg->pointer target cairo_surface_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) target x y width height))))))

;; typedef enum {
;;   CAIRO_SURFACE_OBSERVER_NORMAL = 0,
;;   CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS = 0x1,
;; } cairo_surface_observer_mode_t;
(define-public cairo_surface_observer_mode_t
  (name-ctype
    'cairo_surface_observer_mode_t
    (cenum '((CAIRO_SURFACE_OBSERVER_NORMAL 0)
             (CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS 1)))))
(define-public unwrap-cairo_surface_observer_mode_t
  (let ((numf (cenum-numf
                (ctype-info cairo_surface_observer_mode_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_surface_observer_mode_t
  (let ((symf (cenum-symf
                (ctype-info cairo_surface_observer_mode_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_surface_t *cairo_surface_create_observer(cairo_surface_t *
;;     target, cairo_surface_observer_mode_t mode);
(define-public cairo_surface_create_observer
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_create_observer")
                        (list '* ffi:int)))))
    (lambda (target mode)
      (let ((target
              (cdata-arg->pointer target cairo_surface_t*))
            (mode (unwrap~enum mode)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) target mode))))))

;; typedef void (*cairo_surface_observer_callback_t)(cairo_surface_t *observer
;;     , cairo_surface_t *target, void *data);
(define *cairo_surface_observer_callback_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (observer target data)
          (let ((observer (make-cdata cairo_surface_t* observer))
                (target (make-cdata cairo_surface_t* target)))
            (~proc observer target data)))
        (list '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:void
                     ~fptr
                     (list '* '* '*))))
        (lambda (observer target data)
          (let ((observer
                  (cdata-arg->pointer observer cairo_surface_t*))
                (target
                  (cdata-arg->pointer target cairo_surface_t*))
                (data (cdata-arg->pointer data)))
            (~proc observer target data)))))))
(define-public cairo_surface_observer_callback_t
  (name-ctype
    'cairo_surface_observer_callback_t
    (cpointer *cairo_surface_observer_callback_t)))

;; extern cairo_status_t cairo_surface_observer_add_paint_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_paint_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_paint_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_mask_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_mask_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_mask_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_fill_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_fill_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_fill_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_stroke_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_stroke_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_stroke_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_glyphs_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_glyphs_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_glyphs_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_flush_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_flush_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_flush_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_add_finish_callback(
;;     cairo_surface_t *abstract_surface, cairo_surface_observer_callback_t 
;;     func, void *data);
(define-public cairo_surface_observer_add_finish_callback
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_add_finish_callback")
                        (list '* '* '*)))))
    (lambda (abstract_surface func data)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (func (cdata-arg->pointer
                    func
                    cairo_surface_observer_callback_t))
            (data (cdata-arg->pointer data)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) abstract_surface func data))))))

;; extern cairo_status_t cairo_surface_observer_print(cairo_surface_t *
;;     abstract_surface, cairo_write_func_t write_func, void *closure);
(define-public cairo_surface_observer_print
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_observer_print")
                        (list '* '* '*)))))
    (lambda (abstract_surface write_func closure)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*))
            (write_func
              (cdata-arg->pointer
                write_func
                cairo_write_func_t))
            (closure (cdata-arg->pointer closure)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          abstract_surface
          write_func
          closure))))))

;; extern double cairo_surface_observer_elapsed(cairo_surface_t *
;;     abstract_surface);
(define-public cairo_surface_observer_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_surface_observer_elapsed")
                        (list '*)))))
    (lambda (abstract_surface)
      (let ((abstract_surface
              (cdata-arg->pointer
                abstract_surface
                cairo_surface_t*)))
        ((force ~proc) abstract_surface)))))

;; extern cairo_status_t cairo_device_observer_print(cairo_device_t *
;;     abstract_device, cairo_write_func_t write_func, void *closure);
(define-public cairo_device_observer_print
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_device_observer_print")
                        (list '* '* '*)))))
    (lambda (abstract_device write_func closure)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*))
            (write_func
              (cdata-arg->pointer
                write_func
                cairo_write_func_t))
            (closure (cdata-arg->pointer closure)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          abstract_device
          write_func
          closure))))))

;; extern double cairo_device_observer_elapsed(cairo_device_t *abstract_device)
;;     ;
(define-public cairo_device_observer_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern double cairo_device_observer_paint_elapsed(cairo_device_t *
;;     abstract_device);
(define-public cairo_device_observer_paint_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_paint_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern double cairo_device_observer_mask_elapsed(cairo_device_t *
;;     abstract_device);
(define-public cairo_device_observer_mask_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_mask_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern double cairo_device_observer_fill_elapsed(cairo_device_t *
;;     abstract_device);
(define-public cairo_device_observer_fill_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_fill_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern double cairo_device_observer_stroke_elapsed(cairo_device_t *
;;     abstract_device);
(define-public cairo_device_observer_stroke_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_stroke_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern double cairo_device_observer_glyphs_elapsed(cairo_device_t *
;;     abstract_device);
(define-public cairo_device_observer_glyphs_elapsed
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:double
                        (foreign-pointer-search
                          "cairo_device_observer_glyphs_elapsed")
                        (list '*)))))
    (lambda (abstract_device)
      (let ((abstract_device
              (cdata-arg->pointer
                abstract_device
                cairo_device_t*)))
        ((force ~proc) abstract_device)))))

;; extern cairo_surface_t *cairo_surface_reference(cairo_surface_t *surface);
(define-public cairo_surface_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_reference")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) surface))))))

;; extern void cairo_surface_finish(cairo_surface_t *surface);
(define-public cairo_surface_finish
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_surface_finish")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern void cairo_surface_destroy(cairo_surface_t *surface);
(define-public cairo_surface_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_surface_destroy")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_device_t *cairo_surface_get_device(cairo_surface_t *surface);
(define-public cairo_surface_get_device
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_get_device")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret) (make-cdata cairo_device_t* ~ret))
         ((force ~proc) surface))))))

;; extern unsigned cairo_surface_get_reference_count(cairo_surface_t *surface);
;;     
(define-public cairo_surface_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_surface_get_reference_count")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_status_t cairo_surface_status(cairo_surface_t *surface);
(define-public cairo_surface_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_surface_status")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) surface))))))

;; typedef enum _cairo_surface_type {
;;   CAIRO_SURFACE_TYPE_IMAGE,
;;   CAIRO_SURFACE_TYPE_PDF,
;;   CAIRO_SURFACE_TYPE_PS,
;;   CAIRO_SURFACE_TYPE_XLIB,
;;   CAIRO_SURFACE_TYPE_XCB,
;;   CAIRO_SURFACE_TYPE_GLITZ,
;;   CAIRO_SURFACE_TYPE_QUARTZ,
;;   CAIRO_SURFACE_TYPE_WIN32,
;;   CAIRO_SURFACE_TYPE_BEOS,
;;   CAIRO_SURFACE_TYPE_DIRECTFB,
;;   CAIRO_SURFACE_TYPE_SVG,
;;   CAIRO_SURFACE_TYPE_OS2,
;;   CAIRO_SURFACE_TYPE_WIN32_PRINTING,
;;   CAIRO_SURFACE_TYPE_QUARTZ_IMAGE,
;;   CAIRO_SURFACE_TYPE_SCRIPT,
;;   CAIRO_SURFACE_TYPE_QT,
;;   CAIRO_SURFACE_TYPE_RECORDING,
;;   CAIRO_SURFACE_TYPE_VG,
;;   CAIRO_SURFACE_TYPE_GL,
;;   CAIRO_SURFACE_TYPE_DRM,
;;   CAIRO_SURFACE_TYPE_TEE,
;;   CAIRO_SURFACE_TYPE_XML,
;;   CAIRO_SURFACE_TYPE_SKIA,
;;   CAIRO_SURFACE_TYPE_SUBSURFACE,
;;   CAIRO_SURFACE_TYPE_COGL,
;; } cairo_surface_type_t;
(define-public cairo_surface_type_t
  (name-ctype
    'cairo_surface_type_t
    (cenum '((CAIRO_SURFACE_TYPE_IMAGE 0)
             (CAIRO_SURFACE_TYPE_PDF 1)
             (CAIRO_SURFACE_TYPE_PS 2)
             (CAIRO_SURFACE_TYPE_XLIB 3)
             (CAIRO_SURFACE_TYPE_XCB 4)
             (CAIRO_SURFACE_TYPE_GLITZ 5)
             (CAIRO_SURFACE_TYPE_QUARTZ 6)
             (CAIRO_SURFACE_TYPE_WIN32 7)
             (CAIRO_SURFACE_TYPE_BEOS 8)
             (CAIRO_SURFACE_TYPE_DIRECTFB 9)
             (CAIRO_SURFACE_TYPE_SVG 10)
             (CAIRO_SURFACE_TYPE_OS2 11)
             (CAIRO_SURFACE_TYPE_WIN32_PRINTING 12)
             (CAIRO_SURFACE_TYPE_QUARTZ_IMAGE 13)
             (CAIRO_SURFACE_TYPE_SCRIPT 14)
             (CAIRO_SURFACE_TYPE_QT 15)
             (CAIRO_SURFACE_TYPE_RECORDING 16)
             (CAIRO_SURFACE_TYPE_VG 17)
             (CAIRO_SURFACE_TYPE_GL 18)
             (CAIRO_SURFACE_TYPE_DRM 19)
             (CAIRO_SURFACE_TYPE_TEE 20)
             (CAIRO_SURFACE_TYPE_XML 21)
             (CAIRO_SURFACE_TYPE_SKIA 22)
             (CAIRO_SURFACE_TYPE_SUBSURFACE 23)
             (CAIRO_SURFACE_TYPE_COGL 24)))))
(define-public unwrap-cairo_surface_type_t
  (let ((numf (cenum-numf (ctype-info cairo_surface_type_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_surface_type_t
  (let ((symf (cenum-symf (ctype-info cairo_surface_type_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_surface_type_t cairo_surface_get_type(cairo_surface_t *surface)
;;     ;
(define-public cairo_surface_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_surface_get_type")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret) (wrap-cairo_surface_type_t ~ret))
         ((force ~proc) surface))))))

;; extern cairo_content_t cairo_surface_get_content(cairo_surface_t *surface);
(define-public cairo_surface_get_content
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_get_content")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret) (wrap-cairo_content_t ~ret))
         ((force ~proc) surface))))))

;; extern cairo_status_t cairo_surface_write_to_png(cairo_surface_t *surface, 
;;     const char *filename);
(define-public cairo_surface_write_to_png
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_write_to_png")
                        (list '* '*)))))
    (lambda (surface filename)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (filename (cdata-arg->pointer filename)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) surface filename))))))

;; extern cairo_status_t cairo_surface_write_to_png_stream(cairo_surface_t *
;;     surface, cairo_write_func_t write_func, void *closure);
(define-public cairo_surface_write_to_png_stream
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_write_to_png_stream")
                        (list '* '* '*)))))
    (lambda (surface write_func closure)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (write_func
              (cdata-arg->pointer
                write_func
                cairo_write_func_t))
            (closure (cdata-arg->pointer closure)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) surface write_func closure))))))

;; extern void *cairo_surface_get_user_data(cairo_surface_t *surface, const 
;;     cairo_user_data_key_t *key);
(define-public cairo_surface_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_surface_get_user_data")
                        (list '* '*)))))
    (lambda (surface key)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) surface key)))))

;; extern cairo_status_t cairo_surface_set_user_data(cairo_surface_t *surface, 
;;     const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define-public cairo_surface_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (surface key user_data destroy)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) surface key user_data destroy))))))

;; extern void cairo_surface_get_mime_data(cairo_surface_t *surface, const char
;;      *mime_type, const unsigned char **data, unsigned long *length);
(define-public cairo_surface_get_mime_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_get_mime_data")
                        (list '* '* '* '*)))))
    (lambda (surface mime_type data length)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (mime_type (cdata-arg->pointer mime_type))
            (data (cdata-arg->pointer data))
            (length (cdata-arg->pointer length)))
        ((force ~proc) surface mime_type data length)))))

;; extern cairo_status_t cairo_surface_set_mime_data(cairo_surface_t *surface, 
;;     const char *mime_type, const unsigned char *data, unsigned long length, 
;;     cairo_destroy_func_t destroy, void *closure);
(define-public cairo_surface_set_mime_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_set_mime_data")
                        (list '* '* '* ffi:unsigned-long '* '*)))))
    (lambda (surface mime_type data length destroy closure)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (mime_type (cdata-arg->pointer mime_type))
            (data (cdata-arg->pointer data))
            (length (cdata-arg->number length))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t))
            (closure (cdata-arg->pointer closure)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          surface
          mime_type
          data
          length
          destroy
          closure))))))

;; extern cairo_bool_t cairo_surface_supports_mime_type(cairo_surface_t *
;;     surface, const char *mime_type);
(define-public cairo_surface_supports_mime_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_supports_mime_type")
                        (list '* '*)))))
    (lambda (surface mime_type)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (mime_type (cdata-arg->pointer mime_type)))
        ((force ~proc) surface mime_type)))))

;; extern void cairo_surface_get_font_options(cairo_surface_t *surface, 
;;     cairo_font_options_t *options);
(define-public cairo_surface_get_font_options
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_get_font_options")
                        (list '* '*)))))
    (lambda (surface options)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (options
              (cdata-arg->pointer
                options
                cairo_font_options_t*)))
        ((force ~proc) surface options)))))

;; extern void cairo_surface_flush(cairo_surface_t *surface);
(define-public cairo_surface_flush
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_surface_flush")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern void cairo_surface_mark_dirty(cairo_surface_t *surface);
(define-public cairo_surface_mark_dirty
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_mark_dirty")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern void cairo_surface_mark_dirty_rectangle(cairo_surface_t *surface, int
;;      x, int y, int width, int height);
(define-public cairo_surface_mark_dirty_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_mark_dirty_rectangle")
                        (list '* ffi:int ffi:int ffi:int ffi:int)))))
    (lambda (surface x y width height)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((force ~proc) surface x y width height)))))

;; extern void cairo_surface_set_device_scale(cairo_surface_t *surface, double 
;;     x_scale, double y_scale);
(define-public cairo_surface_set_device_scale
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_set_device_scale")
                        (list '* ffi:double ffi:double)))))
    (lambda (surface x_scale y_scale)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_scale (cdata-arg->number x_scale))
            (y_scale (cdata-arg->number y_scale)))
        ((force ~proc) surface x_scale y_scale)))))

;; extern void cairo_surface_get_device_scale(cairo_surface_t *surface, double 
;;     *x_scale, double *y_scale);
(define-public cairo_surface_get_device_scale
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_get_device_scale")
                        (list '* '* '*)))))
    (lambda (surface x_scale y_scale)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_scale (cdata-arg->pointer x_scale))
            (y_scale (cdata-arg->pointer y_scale)))
        ((force ~proc) surface x_scale y_scale)))))

;; extern void cairo_surface_set_device_offset(cairo_surface_t *surface, double
;;      x_offset, double y_offset);
(define-public cairo_surface_set_device_offset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_set_device_offset")
                        (list '* ffi:double ffi:double)))))
    (lambda (surface x_offset y_offset)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_offset (cdata-arg->number x_offset))
            (y_offset (cdata-arg->number y_offset)))
        ((force ~proc) surface x_offset y_offset)))))

;; extern void cairo_surface_get_device_offset(cairo_surface_t *surface, double
;;      *x_offset, double *y_offset);
(define-public cairo_surface_get_device_offset
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_get_device_offset")
                        (list '* '* '*)))))
    (lambda (surface x_offset y_offset)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_offset (cdata-arg->pointer x_offset))
            (y_offset (cdata-arg->pointer y_offset)))
        ((force ~proc) surface x_offset y_offset)))))

;; extern void cairo_surface_set_fallback_resolution(cairo_surface_t *surface, 
;;     double x_pixels_per_inch, double y_pixels_per_inch);
(define-public cairo_surface_set_fallback_resolution
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_set_fallback_resolution")
                        (list '* ffi:double ffi:double)))))
    (lambda (surface x_pixels_per_inch y_pixels_per_inch)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_pixels_per_inch
              (cdata-arg->number x_pixels_per_inch))
            (y_pixels_per_inch
              (cdata-arg->number y_pixels_per_inch)))
        ((force ~proc)
         surface
         x_pixels_per_inch
         y_pixels_per_inch)))))

;; extern void cairo_surface_get_fallback_resolution(cairo_surface_t *surface, 
;;     double *x_pixels_per_inch, double *y_pixels_per_inch);
(define-public cairo_surface_get_fallback_resolution
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_get_fallback_resolution")
                        (list '* '* '*)))))
    (lambda (surface x_pixels_per_inch y_pixels_per_inch)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x_pixels_per_inch
              (cdata-arg->pointer x_pixels_per_inch))
            (y_pixels_per_inch
              (cdata-arg->pointer y_pixels_per_inch)))
        ((force ~proc)
         surface
         x_pixels_per_inch
         y_pixels_per_inch)))))

;; extern void cairo_surface_copy_page(cairo_surface_t *surface);
(define-public cairo_surface_copy_page
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_copy_page")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern void cairo_surface_show_page(cairo_surface_t *surface);
(define-public cairo_surface_show_page
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_surface_show_page")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_bool_t cairo_surface_has_show_text_glyphs(cairo_surface_t *
;;     surface);
(define-public cairo_surface_has_show_text_glyphs
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_surface_has_show_text_glyphs")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_surface_t *cairo_image_surface_create(cairo_format_t format, 
;;     int width, int height);
(define-public cairo_image_surface_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_image_surface_create")
                        (list ffi:int ffi:int ffi:int)))))
    (lambda (format width height)
      (let ((format (unwrap~enum format))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) format width height))))))

;; extern int cairo_format_stride_for_width(cairo_format_t format, int width);
(define-public cairo_format_stride_for_width
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_format_stride_for_width")
                        (list ffi:int ffi:int)))))
    (lambda (format width)
      (let ((format (unwrap~enum format))
            (width (cdata-arg->number width)))
        ((force ~proc) format width)))))

;; extern cairo_surface_t *cairo_image_surface_create_for_data(unsigned char *
;;     data, cairo_format_t format, int width, int height, int stride);
(define-public cairo_image_surface_create_for_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_image_surface_create_for_data")
                        (list '* ffi:int ffi:int ffi:int ffi:int)))))
    (lambda (data format width height stride)
      (let ((data (cdata-arg->pointer data))
            (format (unwrap~enum format))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height))
            (stride (cdata-arg->number stride)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) data format width height stride))))))

;; extern unsigned char *cairo_image_surface_get_data(cairo_surface_t *surface)
;;     ;
(define-public cairo_image_surface_get_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_image_surface_get_data")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_format_t cairo_image_surface_get_format(cairo_surface_t *
;;     surface);
(define-public cairo_image_surface_get_format
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_image_surface_get_format")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret) (wrap-cairo_format_t ~ret))
         ((force ~proc) surface))))))

;; extern int cairo_image_surface_get_width(cairo_surface_t *surface);
(define-public cairo_image_surface_get_width
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_image_surface_get_width")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern int cairo_image_surface_get_height(cairo_surface_t *surface);
(define-public cairo_image_surface_get_height
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_image_surface_get_height")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern int cairo_image_surface_get_stride(cairo_surface_t *surface);
(define-public cairo_image_surface_get_stride
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_image_surface_get_stride")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((force ~proc) surface)))))

;; extern cairo_surface_t *cairo_image_surface_create_from_png(const char *
;;     filename);
(define-public cairo_image_surface_create_from_png
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_image_surface_create_from_png")
                        (list '*)))))
    (lambda (filename)
      (let ((filename (cdata-arg->pointer filename)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) filename))))))

;; extern cairo_surface_t *cairo_image_surface_create_from_png_stream(
;;     cairo_read_func_t read_func, void *closure);
(define-public cairo_image_surface_create_from_png_stream
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_image_surface_create_from_png_stream")
                        (list '* '*)))))
    (lambda (read_func closure)
      (let ((read_func
              (cdata-arg->pointer read_func cairo_read_func_t))
            (closure (cdata-arg->pointer closure)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) read_func closure))))))

;; extern cairo_surface_t *cairo_recording_surface_create(cairo_content_t 
;;     content, const cairo_rectangle_t *extents);
(define-public cairo_recording_surface_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_recording_surface_create")
                        (list ffi:int '*)))))
    (lambda (content extents)
      (let ((content (unwrap~enum content))
            (extents
              (cdata-arg->pointer extents cairo_rectangle_t*)))
        ((lambda (~ret)
           (make-cdata cairo_surface_t* ~ret))
         ((force ~proc) content extents))))))

;; extern void cairo_recording_surface_ink_extents(cairo_surface_t *surface, 
;;     double *x0, double *y0, double *width, double *height);
(define-public cairo_recording_surface_ink_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_recording_surface_ink_extents")
                        (list '* '* '* '* '*)))))
    (lambda (surface x0 y0 width height)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (x0 (cdata-arg->pointer x0))
            (y0 (cdata-arg->pointer y0))
            (width (cdata-arg->pointer width))
            (height (cdata-arg->pointer height)))
        ((force ~proc) surface x0 y0 width height)))))

;; extern cairo_bool_t cairo_recording_surface_get_extents(cairo_surface_t *
;;     surface, cairo_rectangle_t *extents);
(define-public cairo_recording_surface_get_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_recording_surface_get_extents")
                        (list '* '*)))))
    (lambda (surface extents)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*))
            (extents
              (cdata-arg->pointer extents cairo_rectangle_t*)))
        ((force ~proc) surface extents)))))

;; typedef cairo_surface_t *(*cairo_raster_source_acquire_func_t)(
;;     cairo_pattern_t *pattern, void *callback_data, cairo_surface_t *target, 
;;     const cairo_rectangle_int_t *extents);
(define *cairo_raster_source_acquire_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        '*
        (lambda (pattern callback_data target extents)
          (let ((pattern (make-cdata cairo_pattern_t* pattern))
                (target (make-cdata cairo_surface_t* target))
                (extents
                  (make-cdata cairo_rectangle_int_t* extents)))
            ((lambda (~ret)
               (cdata-arg->pointer ~ret cairo_surface_t*))
             (~proc pattern callback_data target extents))))
        (list '* '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     '*
                     ~fptr
                     (list '* '* '* '*))))
        (lambda (pattern callback_data target extents)
          (let ((pattern
                  (cdata-arg->pointer pattern cairo_pattern_t*))
                (callback_data
                  (cdata-arg->pointer callback_data))
                (target
                  (cdata-arg->pointer target cairo_surface_t*))
                (extents
                  (cdata-arg->pointer
                    extents
                    cairo_rectangle_int_t*)))
            ((lambda (~ret)
               (make-cdata cairo_surface_t* ~ret))
             (~proc pattern callback_data target extents))))))))
(define-public cairo_raster_source_acquire_func_t
  (name-ctype
    'cairo_raster_source_acquire_func_t
    (cpointer *cairo_raster_source_acquire_func_t)))

;; typedef void (*cairo_raster_source_release_func_t)(cairo_pattern_t *pattern
;;     , void *callback_data, cairo_surface_t *surface);
(define *cairo_raster_source_release_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (pattern callback_data surface)
          (let ((pattern (make-cdata cairo_pattern_t* pattern))
                (surface (make-cdata cairo_surface_t* surface)))
            (~proc pattern callback_data surface)))
        (list '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:void
                     ~fptr
                     (list '* '* '*))))
        (lambda (pattern callback_data surface)
          (let ((pattern
                  (cdata-arg->pointer pattern cairo_pattern_t*))
                (callback_data
                  (cdata-arg->pointer callback_data))
                (surface
                  (cdata-arg->pointer surface cairo_surface_t*)))
            (~proc pattern callback_data surface)))))))
(define-public cairo_raster_source_release_func_t
  (name-ctype
    'cairo_raster_source_release_func_t
    (cpointer *cairo_raster_source_release_func_t)))

;; typedef cairo_status_t (*cairo_raster_source_snapshot_func_t)(
;;     cairo_pattern_t *pattern, void *callback_data);
(define *cairo_raster_source_snapshot_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (pattern callback_data)
          (let ((pattern (make-cdata cairo_pattern_t* pattern)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc pattern callback_data))))
        (list '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '*))))
        (lambda (pattern callback_data)
          (let ((pattern
                  (cdata-arg->pointer pattern cairo_pattern_t*))
                (callback_data
                  (cdata-arg->pointer callback_data)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc pattern callback_data))))))))
(define-public cairo_raster_source_snapshot_func_t
  (name-ctype
    'cairo_raster_source_snapshot_func_t
    (cpointer *cairo_raster_source_snapshot_func_t)))

;; typedef cairo_status_t (*cairo_raster_source_copy_func_t)(cairo_pattern_t *
;;     pattern, void *callback_data, const cairo_pattern_t *other);
(define *cairo_raster_source_copy_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:int
        (lambda (pattern callback_data other)
          (let ((pattern (make-cdata cairo_pattern_t* pattern))
                (other (make-cdata cairo_pattern_t* other)))
            ((lambda (~ret) (unwrap~enum ~ret))
             (~proc pattern callback_data other))))
        (list '* '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:int
                     ~fptr
                     (list '* '* '*))))
        (lambda (pattern callback_data other)
          (let ((pattern
                  (cdata-arg->pointer pattern cairo_pattern_t*))
                (callback_data
                  (cdata-arg->pointer callback_data))
                (other (cdata-arg->pointer other cairo_pattern_t*)))
            ((lambda (~ret) (wrap-cairo_status_t ~ret))
             (~proc pattern callback_data other))))))))
(define-public cairo_raster_source_copy_func_t
  (name-ctype
    'cairo_raster_source_copy_func_t
    (cpointer *cairo_raster_source_copy_func_t)))

;; typedef void (*cairo_raster_source_finish_func_t)(cairo_pattern_t *pattern, 
;;     void *callback_data);
(define *cairo_raster_source_finish_func_t
  (cfunction
    (lambda (~proc)
      (ffi:procedure->pointer
        ffi:void
        (lambda (pattern callback_data)
          (let ((pattern (make-cdata cairo_pattern_t* pattern)))
            (~proc pattern callback_data)))
        (list '* '*)))
    (lambda (~fptr)
      (let ((~proc (ffi:pointer->procedure
                     ffi:void
                     ~fptr
                     (list '* '*))))
        (lambda (pattern callback_data)
          (let ((pattern
                  (cdata-arg->pointer pattern cairo_pattern_t*))
                (callback_data
                  (cdata-arg->pointer callback_data)))
            (~proc pattern callback_data)))))))
(define-public cairo_raster_source_finish_func_t
  (name-ctype
    'cairo_raster_source_finish_func_t
    (cpointer *cairo_raster_source_finish_func_t)))

;; extern cairo_pattern_t *cairo_pattern_create_raster_source(void *user_data, 
;;     cairo_content_t content, int width, int height);
(define-public cairo_pattern_create_raster_source
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_raster_source")
                        (list '* ffi:int ffi:int ffi:int)))))
    (lambda (user_data content width height)
      (let ((user_data (cdata-arg->pointer user_data))
            (content (unwrap~enum content))
            (width (cdata-arg->number width))
            (height (cdata-arg->number height)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) user_data content width height))))))

;; extern void cairo_raster_source_pattern_set_callback_data(cairo_pattern_t *
;;     pattern, void *data);
(define-public cairo_raster_source_pattern_set_callback_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_set_callback_data")
                        (list '* '*)))))
    (lambda (pattern data)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (data (cdata-arg->pointer data)))
        ((force ~proc) pattern data)))))

;; extern void *cairo_raster_source_pattern_get_callback_data(cairo_pattern_t *
;;     pattern);
(define-public cairo_raster_source_pattern_get_callback_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_get_callback_data")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) pattern)))))

;; extern void cairo_raster_source_pattern_set_acquire(cairo_pattern_t *pattern
;;     , cairo_raster_source_acquire_func_t acquire, 
;;     cairo_raster_source_release_func_t release);
(define-public cairo_raster_source_pattern_set_acquire
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_set_acquire")
                        (list '* '* '*)))))
    (lambda (pattern acquire release)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (acquire
              (cdata-arg->pointer
                acquire
                cairo_raster_source_acquire_func_t))
            (release
              (cdata-arg->pointer
                release
                cairo_raster_source_release_func_t)))
        ((force ~proc) pattern acquire release)))))

;; extern void cairo_raster_source_pattern_get_acquire(cairo_pattern_t *pattern
;;     , cairo_raster_source_acquire_func_t *acquire, 
;;     cairo_raster_source_release_func_t *release);
(define-public cairo_raster_source_pattern_get_acquire
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_get_acquire")
                        (list '* '* '*)))))
    (lambda (pattern acquire release)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (acquire
              (cdata-arg->pointer
                acquire
                (cpointer cairo_raster_source_acquire_func_t)))
            (release
              (cdata-arg->pointer
                release
                (cpointer cairo_raster_source_release_func_t))))
        ((force ~proc) pattern acquire release)))))

;; extern void cairo_raster_source_pattern_set_snapshot(cairo_pattern_t *
;;     pattern, cairo_raster_source_snapshot_func_t snapshot);
(define-public cairo_raster_source_pattern_set_snapshot
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_set_snapshot")
                        (list '* '*)))))
    (lambda (pattern snapshot)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (snapshot
              (cdata-arg->pointer
                snapshot
                cairo_raster_source_snapshot_func_t)))
        ((force ~proc) pattern snapshot)))))

;; extern cairo_raster_source_snapshot_func_t 
;;     cairo_raster_source_pattern_get_snapshot(cairo_pattern_t *pattern);
(define-public cairo_raster_source_pattern_get_snapshot
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_get_snapshot")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_raster_source_snapshot_func_t
             ~ret))
         ((force ~proc) pattern))))))

;; extern void cairo_raster_source_pattern_set_copy(cairo_pattern_t *pattern, 
;;     cairo_raster_source_copy_func_t copy);
(define-public cairo_raster_source_pattern_set_copy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_set_copy")
                        (list '* '*)))))
    (lambda (pattern copy)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (copy (cdata-arg->pointer
                    copy
                    cairo_raster_source_copy_func_t)))
        ((force ~proc) pattern copy)))))

;; extern cairo_raster_source_copy_func_t cairo_raster_source_pattern_get_copy(
;;     cairo_pattern_t *pattern);
(define-public cairo_raster_source_pattern_get_copy
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_get_copy")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret)
           (make-cdata cairo_raster_source_copy_func_t ~ret))
         ((force ~proc) pattern))))))

;; extern void cairo_raster_source_pattern_set_finish(cairo_pattern_t *pattern
;;     , cairo_raster_source_finish_func_t finish);
(define-public cairo_raster_source_pattern_set_finish
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_set_finish")
                        (list '* '*)))))
    (lambda (pattern finish)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (finish
              (cdata-arg->pointer
                finish
                cairo_raster_source_finish_func_t)))
        ((force ~proc) pattern finish)))))

;; extern cairo_raster_source_finish_func_t 
;;     cairo_raster_source_pattern_get_finish(cairo_pattern_t *pattern);
(define-public cairo_raster_source_pattern_get_finish
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_raster_source_pattern_get_finish")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret)
           (make-cdata
             cairo_raster_source_finish_func_t
             ~ret))
         ((force ~proc) pattern))))))

;; extern cairo_pattern_t *cairo_pattern_create_rgb(double red, double green, 
;;     double blue);
(define-public cairo_pattern_create_rgb
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_rgb")
                        (list ffi:double ffi:double ffi:double)))))
    (lambda (red green blue)
      (let ((red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) red green blue))))))

;; extern cairo_pattern_t *cairo_pattern_create_rgba(double red, double green, 
;;     double blue, double alpha);
(define-public cairo_pattern_create_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_rgba")
                        (list ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (red green blue alpha)
      (let ((red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue))
            (alpha (cdata-arg->number alpha)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) red green blue alpha))))))

;; extern cairo_pattern_t *cairo_pattern_create_for_surface(cairo_surface_t *
;;     surface);
(define-public cairo_pattern_create_for_surface
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_for_surface")
                        (list '*)))))
    (lambda (surface)
      (let ((surface
              (cdata-arg->pointer surface cairo_surface_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) surface))))))

;; extern cairo_pattern_t *cairo_pattern_create_linear(double x0, double y0, 
;;     double x1, double y1);
(define-public cairo_pattern_create_linear
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_linear")
                        (list ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (x0 y0 x1 y1)
      (let ((x0 (cdata-arg->number x0))
            (y0 (cdata-arg->number y0))
            (x1 (cdata-arg->number x1))
            (y1 (cdata-arg->number y1)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) x0 y0 x1 y1))))))

;; extern cairo_pattern_t *cairo_pattern_create_radial(double cx0, double cy0, 
;;     double radius0, double cx1, double cy1, double radius1);
(define-public cairo_pattern_create_radial
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_radial")
                        (list ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (cx0 cy0 radius0 cx1 cy1 radius1)
      (let ((cx0 (cdata-arg->number cx0))
            (cy0 (cdata-arg->number cy0))
            (radius0 (cdata-arg->number radius0))
            (cx1 (cdata-arg->number cx1))
            (cy1 (cdata-arg->number cy1))
            (radius1 (cdata-arg->number radius1)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) cx0 cy0 radius0 cx1 cy1 radius1))))))

;; extern cairo_pattern_t *cairo_pattern_create_mesh(void);
(define-public cairo_pattern_create_mesh
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_create_mesh")
                        (list)))))
    (lambda ()
      (let ()
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc)))))))

;; extern cairo_pattern_t *cairo_pattern_reference(cairo_pattern_t *pattern);
(define-public cairo_pattern_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_reference")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret)
           (make-cdata cairo_pattern_t* ~ret))
         ((force ~proc) pattern))))))

;; extern void cairo_pattern_destroy(cairo_pattern_t *pattern);
(define-public cairo_pattern_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_pattern_destroy")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) pattern)))))

;; extern unsigned cairo_pattern_get_reference_count(cairo_pattern_t *pattern);
;;     
(define-public cairo_pattern_get_reference_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:unsigned-int
                        (foreign-pointer-search
                          "cairo_pattern_get_reference_count")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) pattern)))))

;; extern cairo_status_t cairo_pattern_status(cairo_pattern_t *pattern);
(define-public cairo_pattern_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_pattern_status")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern))))))

;; extern void *cairo_pattern_get_user_data(cairo_pattern_t *pattern, const 
;;     cairo_user_data_key_t *key);
(define-public cairo_pattern_get_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_pattern_get_user_data")
                        (list '* '*)))))
    (lambda (pattern key)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*)))
        ((force ~proc) pattern key)))))

;; extern cairo_status_t cairo_pattern_set_user_data(cairo_pattern_t *pattern, 
;;     const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define-public cairo_pattern_set_user_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_set_user_data")
                        (list '* '* '* '*)))))
    (lambda (pattern key user_data destroy)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (key (cdata-arg->pointer key cairo_user_data_key_t*))
            (user_data (cdata-arg->pointer user_data))
            (destroy
              (cdata-arg->pointer destroy cairo_destroy_func_t)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern key user_data destroy))))))

;; typedef enum _cairo_pattern_type {
;;   CAIRO_PATTERN_TYPE_SOLID,
;;   CAIRO_PATTERN_TYPE_SURFACE,
;;   CAIRO_PATTERN_TYPE_LINEAR,
;;   CAIRO_PATTERN_TYPE_RADIAL,
;;   CAIRO_PATTERN_TYPE_MESH,
;;   CAIRO_PATTERN_TYPE_RASTER_SOURCE,
;; } cairo_pattern_type_t;
(define-public cairo_pattern_type_t
  (name-ctype
    'cairo_pattern_type_t
    (cenum '((CAIRO_PATTERN_TYPE_SOLID 0)
             (CAIRO_PATTERN_TYPE_SURFACE 1)
             (CAIRO_PATTERN_TYPE_LINEAR 2)
             (CAIRO_PATTERN_TYPE_RADIAL 3)
             (CAIRO_PATTERN_TYPE_MESH 4)
             (CAIRO_PATTERN_TYPE_RASTER_SOURCE 5)))))
(define-public unwrap-cairo_pattern_type_t
  (let ((numf (cenum-numf (ctype-info cairo_pattern_type_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_pattern_type_t
  (let ((symf (cenum-symf (ctype-info cairo_pattern_type_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_pattern_type_t cairo_pattern_get_type(cairo_pattern_t *pattern)
;;     ;
(define-public cairo_pattern_get_type
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_pattern_get_type")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret) (wrap-cairo_pattern_type_t ~ret))
         ((force ~proc) pattern))))))

;; extern void cairo_pattern_add_color_stop_rgb(cairo_pattern_t *pattern, 
;;     double offset, double red, double green, double blue);
(define-public cairo_pattern_add_color_stop_rgb
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_add_color_stop_rgb")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (pattern offset red green blue)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (offset (cdata-arg->number offset))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue)))
        ((force ~proc) pattern offset red green blue)))))

;; extern void cairo_pattern_add_color_stop_rgba(cairo_pattern_t *pattern, 
;;     double offset, double red, double green, double blue, double alpha);
(define-public cairo_pattern_add_color_stop_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_add_color_stop_rgba")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (pattern offset red green blue alpha)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (offset (cdata-arg->number offset))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue))
            (alpha (cdata-arg->number alpha)))
        ((force ~proc)
         pattern
         offset
         red
         green
         blue
         alpha)))))

;; extern void cairo_mesh_pattern_begin_patch(cairo_pattern_t *pattern);
(define-public cairo_mesh_pattern_begin_patch
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_begin_patch")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) pattern)))))

;; extern void cairo_mesh_pattern_end_patch(cairo_pattern_t *pattern);
(define-public cairo_mesh_pattern_end_patch
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_end_patch")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((force ~proc) pattern)))))

;; extern void cairo_mesh_pattern_curve_to(cairo_pattern_t *pattern, double x1
;;     , double y1, double x2, double y2, double x3, double y3);
(define-public cairo_mesh_pattern_curve_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_curve_to")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (pattern x1 y1 x2 y2 x3 y3)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (x1 (cdata-arg->number x1))
            (y1 (cdata-arg->number y1))
            (x2 (cdata-arg->number x2))
            (y2 (cdata-arg->number y2))
            (x3 (cdata-arg->number x3))
            (y3 (cdata-arg->number y3)))
        ((force ~proc) pattern x1 y1 x2 y2 x3 y3)))))

;; extern void cairo_mesh_pattern_line_to(cairo_pattern_t *pattern, double x, 
;;     double y);
(define-public cairo_mesh_pattern_line_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_line_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (pattern x y)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) pattern x y)))))

;; extern void cairo_mesh_pattern_move_to(cairo_pattern_t *pattern, double x, 
;;     double y);
(define-public cairo_mesh_pattern_move_to
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_move_to")
                        (list '* ffi:double ffi:double)))))
    (lambda (pattern x y)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) pattern x y)))))

;; extern void cairo_mesh_pattern_set_control_point(cairo_pattern_t *pattern, 
;;     unsigned point_num, double x, double y);
(define-public cairo_mesh_pattern_set_control_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_set_control_point")
                        (list '* ffi:unsigned-int ffi:double ffi:double)))))
    (lambda (pattern point_num x y)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (point_num (cdata-arg->number point_num))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) pattern point_num x y)))))

;; extern void cairo_mesh_pattern_set_corner_color_rgb(cairo_pattern_t *pattern
;;     , unsigned corner_num, double red, double green, double blue);
(define-public cairo_mesh_pattern_set_corner_color_rgb
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_set_corner_color_rgb")
                        (list '*
                              ffi:unsigned-int
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (pattern corner_num red green blue)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (corner_num (cdata-arg->number corner_num))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue)))
        ((force ~proc) pattern corner_num red green blue)))))

;; extern void cairo_mesh_pattern_set_corner_color_rgba(cairo_pattern_t *
;;     pattern, unsigned corner_num, double red, double green, double blue, 
;;     double alpha);
(define-public cairo_mesh_pattern_set_corner_color_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_mesh_pattern_set_corner_color_rgba")
                        (list '*
                              ffi:unsigned-int
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (pattern corner_num red green blue alpha)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (corner_num (cdata-arg->number corner_num))
            (red (cdata-arg->number red))
            (green (cdata-arg->number green))
            (blue (cdata-arg->number blue))
            (alpha (cdata-arg->number alpha)))
        ((force ~proc)
         pattern
         corner_num
         red
         green
         blue
         alpha)))))

;; extern void cairo_pattern_set_matrix(cairo_pattern_t *pattern, const 
;;     cairo_matrix_t *matrix);
(define-public cairo_pattern_set_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_set_matrix")
                        (list '* '*)))))
    (lambda (pattern matrix)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) pattern matrix)))))

;; extern void cairo_pattern_get_matrix(cairo_pattern_t *pattern, 
;;     cairo_matrix_t *matrix);
(define-public cairo_pattern_get_matrix
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_get_matrix")
                        (list '* '*)))))
    (lambda (pattern matrix)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) pattern matrix)))))

;; typedef enum _cairo_extend {
;;   CAIRO_EXTEND_NONE,
;;   CAIRO_EXTEND_REPEAT,
;;   CAIRO_EXTEND_REFLECT,
;;   CAIRO_EXTEND_PAD,
;; } cairo_extend_t;
(define-public cairo_extend_t
  (name-ctype
    'cairo_extend_t
    (cenum '((CAIRO_EXTEND_NONE 0)
             (CAIRO_EXTEND_REPEAT 1)
             (CAIRO_EXTEND_REFLECT 2)
             (CAIRO_EXTEND_PAD 3)))))
(define-public unwrap-cairo_extend_t
  (let ((numf (cenum-numf (ctype-info cairo_extend_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_extend_t
  (let ((symf (cenum-symf (ctype-info cairo_extend_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_pattern_set_extend(cairo_pattern_t *pattern, 
;;     cairo_extend_t extend);
(define-public cairo_pattern_set_extend
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_set_extend")
                        (list '* ffi:int)))))
    (lambda (pattern extend)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (extend (unwrap~enum extend)))
        ((force ~proc) pattern extend)))))

;; extern cairo_extend_t cairo_pattern_get_extend(cairo_pattern_t *pattern);
(define-public cairo_pattern_get_extend
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_extend")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret) (wrap-cairo_extend_t ~ret))
         ((force ~proc) pattern))))))

;; typedef enum _cairo_filter {
;;   CAIRO_FILTER_FAST,
;;   CAIRO_FILTER_GOOD,
;;   CAIRO_FILTER_BEST,
;;   CAIRO_FILTER_NEAREST,
;;   CAIRO_FILTER_BILINEAR,
;;   CAIRO_FILTER_GAUSSIAN,
;; } cairo_filter_t;
(define-public cairo_filter_t
  (name-ctype
    'cairo_filter_t
    (cenum '((CAIRO_FILTER_FAST 0)
             (CAIRO_FILTER_GOOD 1)
             (CAIRO_FILTER_BEST 2)
             (CAIRO_FILTER_NEAREST 3)
             (CAIRO_FILTER_BILINEAR 4)
             (CAIRO_FILTER_GAUSSIAN 5)))))
(define-public unwrap-cairo_filter_t
  (let ((numf (cenum-numf (ctype-info cairo_filter_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_filter_t
  (let ((symf (cenum-symf (ctype-info cairo_filter_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern void cairo_pattern_set_filter(cairo_pattern_t *pattern, 
;;     cairo_filter_t filter);
(define-public cairo_pattern_set_filter
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_pattern_set_filter")
                        (list '* ffi:int)))))
    (lambda (pattern filter)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (filter (unwrap~enum filter)))
        ((force ~proc) pattern filter)))))

;; extern cairo_filter_t cairo_pattern_get_filter(cairo_pattern_t *pattern);
(define-public cairo_pattern_get_filter
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_filter")
                        (list '*)))))
    (lambda (pattern)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*)))
        ((lambda (~ret) (wrap-cairo_filter_t ~ret))
         ((force ~proc) pattern))))))

;; extern cairo_status_t cairo_pattern_get_rgba(cairo_pattern_t *pattern, 
;;     double *red, double *green, double *blue, double *alpha);
(define-public cairo_pattern_get_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_pattern_get_rgba")
                        (list '* '* '* '* '*)))))
    (lambda (pattern red green blue alpha)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (red (cdata-arg->pointer red))
            (green (cdata-arg->pointer green))
            (blue (cdata-arg->pointer blue))
            (alpha (cdata-arg->pointer alpha)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern red green blue alpha))))))

;; extern cairo_status_t cairo_pattern_get_surface(cairo_pattern_t *pattern, 
;;     cairo_surface_t **surface);
(define-public cairo_pattern_get_surface
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_surface")
                        (list '* '*)))))
    (lambda (pattern surface)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (surface (cdata-arg->pointer surface)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern surface))))))

;; extern cairo_status_t cairo_pattern_get_color_stop_rgba(cairo_pattern_t *
;;     pattern, int index, double *offset, double *red, double *green, double *
;;     blue, double *alpha);
(define-public cairo_pattern_get_color_stop_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_color_stop_rgba")
                        (list '* ffi:int '* '* '* '* '*)))))
    (lambda (pattern index offset red green blue alpha)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (index (cdata-arg->number index))
            (offset (cdata-arg->pointer offset))
            (red (cdata-arg->pointer red))
            (green (cdata-arg->pointer green))
            (blue (cdata-arg->pointer blue))
            (alpha (cdata-arg->pointer alpha)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          pattern
          index
          offset
          red
          green
          blue
          alpha))))))

;; extern cairo_status_t cairo_pattern_get_color_stop_count(cairo_pattern_t *
;;     pattern, int *count);
(define-public cairo_pattern_get_color_stop_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_color_stop_count")
                        (list '* '*)))))
    (lambda (pattern count)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (count (cdata-arg->pointer count)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern count))))))

;; extern cairo_status_t cairo_pattern_get_linear_points(cairo_pattern_t *
;;     pattern, double *x0, double *y0, double *x1, double *y1);
(define-public cairo_pattern_get_linear_points
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_linear_points")
                        (list '* '* '* '* '*)))))
    (lambda (pattern x0 y0 x1 y1)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (x0 (cdata-arg->pointer x0))
            (y0 (cdata-arg->pointer y0))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern x0 y0 x1 y1))))))

;; extern cairo_status_t cairo_pattern_get_radial_circles(cairo_pattern_t *
;;     pattern, double *x0, double *y0, double *r0, double *x1, double *y1, 
;;     double *r1);
(define-public cairo_pattern_get_radial_circles
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_pattern_get_radial_circles")
                        (list '* '* '* '* '* '* '*)))))
    (lambda (pattern x0 y0 r0 x1 y1 r1)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (x0 (cdata-arg->pointer x0))
            (y0 (cdata-arg->pointer y0))
            (r0 (cdata-arg->pointer r0))
            (x1 (cdata-arg->pointer x1))
            (y1 (cdata-arg->pointer y1))
            (r1 (cdata-arg->pointer r1)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern x0 y0 r0 x1 y1 r1))))))

;; extern cairo_status_t cairo_mesh_pattern_get_patch_count(cairo_pattern_t *
;;     pattern, unsigned *count);
(define-public cairo_mesh_pattern_get_patch_count
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_mesh_pattern_get_patch_count")
                        (list '* '*)))))
    (lambda (pattern count)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (count (cdata-arg->pointer count)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern count))))))

;; extern cairo_path_t *cairo_mesh_pattern_get_path(cairo_pattern_t *pattern, 
;;     unsigned patch_num);
(define-public cairo_mesh_pattern_get_path
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_mesh_pattern_get_path")
                        (list '* ffi:unsigned-int)))))
    (lambda (pattern patch_num)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (patch_num (cdata-arg->number patch_num)))
        ((lambda (~ret) (make-cdata cairo_path_t* ~ret))
         ((force ~proc) pattern patch_num))))))

;; extern cairo_status_t cairo_mesh_pattern_get_corner_color_rgba(
;;     cairo_pattern_t *pattern, unsigned patch_num, unsigned corner_num, 
;;     double *red, double *green, double *blue, double *alpha);
(define-public cairo_mesh_pattern_get_corner_color_rgba
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_mesh_pattern_get_corner_color_rgba")
                        (list '*
                              ffi:unsigned-int
                              ffi:unsigned-int
                              '*
                              '*
                              '*
                              '*)))))
    (lambda (pattern
             patch_num
             corner_num
             red
             green
             blue
             alpha)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (patch_num (cdata-arg->number patch_num))
            (corner_num (cdata-arg->number corner_num))
            (red (cdata-arg->pointer red))
            (green (cdata-arg->pointer green))
            (blue (cdata-arg->pointer blue))
            (alpha (cdata-arg->pointer alpha)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc)
          pattern
          patch_num
          corner_num
          red
          green
          blue
          alpha))))))

;; extern cairo_status_t cairo_mesh_pattern_get_control_point(cairo_pattern_t *
;;     pattern, unsigned patch_num, unsigned point_num, double *x, double *y);
(define-public cairo_mesh_pattern_get_control_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_mesh_pattern_get_control_point")
                        (list '* ffi:unsigned-int ffi:unsigned-int '* '*)))))
    (lambda (pattern patch_num point_num x y)
      (let ((pattern
              (cdata-arg->pointer pattern cairo_pattern_t*))
            (patch_num (cdata-arg->number patch_num))
            (point_num (cdata-arg->number point_num))
            (x (cdata-arg->pointer x))
            (y (cdata-arg->pointer y)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) pattern patch_num point_num x y))))))

;; extern void cairo_matrix_init(cairo_matrix_t *matrix, double xx, double yx, 
;;     double xy, double yy, double x0, double y0);
(define-public cairo_matrix_init
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_matrix_init")
                        (list '*
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double
                              ffi:double)))))
    (lambda (matrix xx yx xy yy x0 y0)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (xx (cdata-arg->number xx))
            (yx (cdata-arg->number yx))
            (xy (cdata-arg->number xy))
            (yy (cdata-arg->number yy))
            (x0 (cdata-arg->number x0))
            (y0 (cdata-arg->number y0)))
        ((force ~proc) matrix xx yx xy yy x0 y0)))))

;; extern void cairo_matrix_init_identity(cairo_matrix_t *matrix);
(define-public cairo_matrix_init_identity
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_init_identity")
                        (list '*)))))
    (lambda (matrix)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((force ~proc) matrix)))))

;; extern void cairo_matrix_init_translate(cairo_matrix_t *matrix, double tx, 
;;     double ty);
(define-public cairo_matrix_init_translate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_init_translate")
                        (list '* ffi:double ffi:double)))))
    (lambda (matrix tx ty)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (tx (cdata-arg->number tx))
            (ty (cdata-arg->number ty)))
        ((force ~proc) matrix tx ty)))))

;; extern void cairo_matrix_init_scale(cairo_matrix_t *matrix, double sx, 
;;     double sy);
(define-public cairo_matrix_init_scale
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_init_scale")
                        (list '* ffi:double ffi:double)))))
    (lambda (matrix sx sy)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (sx (cdata-arg->number sx))
            (sy (cdata-arg->number sy)))
        ((force ~proc) matrix sx sy)))))

;; extern void cairo_matrix_init_rotate(cairo_matrix_t *matrix, double radians)
;;     ;
(define-public cairo_matrix_init_rotate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_init_rotate")
                        (list '* ffi:double)))))
    (lambda (matrix radians)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (radians (cdata-arg->number radians)))
        ((force ~proc) matrix radians)))))

;; extern void cairo_matrix_translate(cairo_matrix_t *matrix, double tx, double
;;      ty);
(define-public cairo_matrix_translate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_matrix_translate")
                        (list '* ffi:double ffi:double)))))
    (lambda (matrix tx ty)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (tx (cdata-arg->number tx))
            (ty (cdata-arg->number ty)))
        ((force ~proc) matrix tx ty)))))

;; extern void cairo_matrix_scale(cairo_matrix_t *matrix, double sx, double sy)
;;     ;
(define-public cairo_matrix_scale
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_matrix_scale")
                        (list '* ffi:double ffi:double)))))
    (lambda (matrix sx sy)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (sx (cdata-arg->number sx))
            (sy (cdata-arg->number sy)))
        ((force ~proc) matrix sx sy)))))

;; extern void cairo_matrix_rotate(cairo_matrix_t *matrix, double radians);
(define-public cairo_matrix_rotate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_matrix_rotate")
                        (list '* ffi:double)))))
    (lambda (matrix radians)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (radians (cdata-arg->number radians)))
        ((force ~proc) matrix radians)))))

;; extern cairo_status_t cairo_matrix_invert(cairo_matrix_t *matrix);
(define-public cairo_matrix_invert
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_matrix_invert")
                        (list '*)))))
    (lambda (matrix)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) matrix))))))

;; extern void cairo_matrix_multiply(cairo_matrix_t *result, const 
;;     cairo_matrix_t *a, const cairo_matrix_t *b);
(define-public cairo_matrix_multiply
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_matrix_multiply")
                        (list '* '* '*)))))
    (lambda (result a b)
      (let ((result
              (cdata-arg->pointer result cairo_matrix_t*))
            (a (cdata-arg->pointer a cairo_matrix_t*))
            (b (cdata-arg->pointer b cairo_matrix_t*)))
        ((force ~proc) result a b)))))

;; extern void cairo_matrix_transform_distance(const cairo_matrix_t *matrix, 
;;     double *dx, double *dy);
(define-public cairo_matrix_transform_distance
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_transform_distance")
                        (list '* '* '*)))))
    (lambda (matrix dx dy)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (dx (cdata-arg->pointer dx))
            (dy (cdata-arg->pointer dy)))
        ((force ~proc) matrix dx dy)))))

;; extern void cairo_matrix_transform_point(const cairo_matrix_t *matrix, 
;;     double *x, double *y);
(define-public cairo_matrix_transform_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_matrix_transform_point")
                        (list '* '* '*)))))
    (lambda (matrix x y)
      (let ((matrix
              (cdata-arg->pointer matrix cairo_matrix_t*))
            (x (cdata-arg->pointer x))
            (y (cdata-arg->pointer y)))
        ((force ~proc) matrix x y)))))

;; typedef struct _cairo_region cairo_region_t;
(define-public cairo_region_t*
  (name-ctype 'cairo_region_t* (cpointer 'void)))

;; typedef enum _cairo_region_overlap {
;;   CAIRO_REGION_OVERLAP_IN,
;;   CAIRO_REGION_OVERLAP_OUT,
;;   CAIRO_REGION_OVERLAP_PART,
;; } cairo_region_overlap_t;
(define-public cairo_region_overlap_t
  (name-ctype
    'cairo_region_overlap_t
    (cenum '((CAIRO_REGION_OVERLAP_IN 0)
             (CAIRO_REGION_OVERLAP_OUT 1)
             (CAIRO_REGION_OVERLAP_PART 2)))))
(define-public unwrap-cairo_region_overlap_t
  (let ((numf (cenum-numf (ctype-info cairo_region_overlap_t))))
    (lambda (arg) (or (numf arg) arg))))
(define-public wrap-cairo_region_overlap_t
  (let ((symf (cenum-symf (ctype-info cairo_region_overlap_t))))
    (lambda (arg) (or (symf arg) arg))))

;; extern cairo_region_t *cairo_region_create(void);
(define-public cairo_region_create
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_region_create")
                        (list)))))
    (lambda ()
      (let ()
        ((lambda (~ret) (make-cdata cairo_region_t* ~ret))
         ((force ~proc)))))))

;; extern cairo_region_t *cairo_region_create_rectangle(const 
;;     cairo_rectangle_int_t *rectangle);
(define-public cairo_region_create_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_region_create_rectangle")
                        (list '*)))))
    (lambda (rectangle)
      (let ((rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret) (make-cdata cairo_region_t* ~ret))
         ((force ~proc) rectangle))))))

;; extern cairo_region_t *cairo_region_create_rectangles(const 
;;     cairo_rectangle_int_t *rects, int count);
(define-public cairo_region_create_rectangles
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search
                          "cairo_region_create_rectangles")
                        (list '* ffi:int)))))
    (lambda (rects count)
      (let ((rects (cdata-arg->pointer rects cairo_rectangle_int_t*))
            (count (cdata-arg->number count)))
        ((lambda (~ret) (make-cdata cairo_region_t* ~ret))
         ((force ~proc) rects count))))))

;; extern cairo_region_t *cairo_region_copy(const cairo_region_t *original);
(define-public cairo_region_copy
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_region_copy")
                        (list '*)))))
    (lambda (original)
      (let ((original
              (cdata-arg->pointer original cairo_region_t*)))
        ((lambda (~ret) (make-cdata cairo_region_t* ~ret))
         ((force ~proc) original))))))

;; extern cairo_region_t *cairo_region_reference(cairo_region_t *region);
(define-public cairo_region_reference
  (let ((~proc (delay (ffi:pointer->procedure
                        '*
                        (foreign-pointer-search "cairo_region_reference")
                        (list '*)))))
    (lambda (region)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*)))
        ((lambda (~ret) (make-cdata cairo_region_t* ~ret))
         ((force ~proc) region))))))

;; extern void cairo_region_destroy(cairo_region_t *region);
(define-public cairo_region_destroy
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_region_destroy")
                        (list '*)))))
    (lambda (region)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*)))
        ((force ~proc) region)))))

;; extern cairo_bool_t cairo_region_equal(const cairo_region_t *a, const 
;;     cairo_region_t *b);
(define-public cairo_region_equal
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_equal")
                        (list '* '*)))))
    (lambda (a b)
      (let ((a (cdata-arg->pointer a cairo_region_t*))
            (b (cdata-arg->pointer b cairo_region_t*)))
        ((force ~proc) a b)))))

;; extern cairo_status_t cairo_region_status(const cairo_region_t *region);
(define-public cairo_region_status
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_status")
                        (list '*)))))
    (lambda (region)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) region))))))

;; extern void cairo_region_get_extents(const cairo_region_t *region, 
;;     cairo_rectangle_int_t *extents);
(define-public cairo_region_get_extents
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_region_get_extents")
                        (list '* '*)))))
    (lambda (region extents)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*))
            (extents
              (cdata-arg->pointer
                extents
                cairo_rectangle_int_t*)))
        ((force ~proc) region extents)))))

;; extern int cairo_region_num_rectangles(const cairo_region_t *region);
(define-public cairo_region_num_rectangles
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_num_rectangles")
                        (list '*)))))
    (lambda (region)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*)))
        ((force ~proc) region)))))

;; extern void cairo_region_get_rectangle(const cairo_region_t *region, int nth
;;     , cairo_rectangle_int_t *rectangle);
(define-public cairo_region_get_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_region_get_rectangle")
                        (list '* ffi:int '*)))))
    (lambda (region nth rectangle)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*))
            (nth (cdata-arg->number nth))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((force ~proc) region nth rectangle)))))

;; extern cairo_bool_t cairo_region_is_empty(const cairo_region_t *region);
(define-public cairo_region_is_empty
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_is_empty")
                        (list '*)))))
    (lambda (region)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*)))
        ((force ~proc) region)))))

;; extern cairo_region_overlap_t cairo_region_contains_rectangle(const 
;;     cairo_region_t *region, const cairo_rectangle_int_t *rectangle);
(define-public cairo_region_contains_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_contains_rectangle")
                        (list '* '*)))))
    (lambda (region rectangle)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret)
           (wrap-cairo_region_overlap_t ~ret))
         ((force ~proc) region rectangle))))))

;; extern cairo_bool_t cairo_region_contains_point(const cairo_region_t *region
;;     , int x, int y);
(define-public cairo_region_contains_point
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_contains_point")
                        (list '* ffi:int ffi:int)))))
    (lambda (region x y)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*))
            (x (cdata-arg->number x))
            (y (cdata-arg->number y)))
        ((force ~proc) region x y)))))

;; extern void cairo_region_translate(cairo_region_t *region, int dx, int dy);
(define-public cairo_region_translate
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search "cairo_region_translate")
                        (list '* ffi:int ffi:int)))))
    (lambda (region dx dy)
      (let ((region
              (cdata-arg->pointer region cairo_region_t*))
            (dx (cdata-arg->number dx))
            (dy (cdata-arg->number dy)))
        ((force ~proc) region dx dy)))))

;; extern cairo_status_t cairo_region_subtract(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define-public cairo_region_subtract
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_subtract")
                        (list '* '*)))))
    (lambda (dst other)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (other (cdata-arg->pointer other cairo_region_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst other))))))

;; extern cairo_status_t cairo_region_subtract_rectangle(cairo_region_t *dst, 
;;     const cairo_rectangle_int_t *rectangle);
(define-public cairo_region_subtract_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_subtract_rectangle")
                        (list '* '*)))))
    (lambda (dst rectangle)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst rectangle))))))

;; extern cairo_status_t cairo_region_intersect(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define-public cairo_region_intersect
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_intersect")
                        (list '* '*)))))
    (lambda (dst other)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (other (cdata-arg->pointer other cairo_region_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst other))))))

;; extern cairo_status_t cairo_region_intersect_rectangle(cairo_region_t *dst, 
;;     const cairo_rectangle_int_t *rectangle);
(define-public cairo_region_intersect_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_intersect_rectangle")
                        (list '* '*)))))
    (lambda (dst rectangle)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst rectangle))))))

;; extern cairo_status_t cairo_region_union(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define-public cairo_region_union
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_union")
                        (list '* '*)))))
    (lambda (dst other)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (other (cdata-arg->pointer other cairo_region_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst other))))))

;; extern cairo_status_t cairo_region_union_rectangle(cairo_region_t *dst, 
;;     const cairo_rectangle_int_t *rectangle);
(define-public cairo_region_union_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_union_rectangle")
                        (list '* '*)))))
    (lambda (dst rectangle)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst rectangle))))))

;; extern cairo_status_t cairo_region_xor(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define-public cairo_region_xor
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search "cairo_region_xor")
                        (list '* '*)))))
    (lambda (dst other)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (other (cdata-arg->pointer other cairo_region_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst other))))))

;; extern cairo_status_t cairo_region_xor_rectangle(cairo_region_t *dst, const 
;;     cairo_rectangle_int_t *rectangle);
(define-public cairo_region_xor_rectangle
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:int
                        (foreign-pointer-search
                          "cairo_region_xor_rectangle")
                        (list '* '*)))))
    (lambda (dst rectangle)
      (let ((dst (cdata-arg->pointer dst cairo_region_t*))
            (rectangle
              (cdata-arg->pointer
                rectangle
                cairo_rectangle_int_t*)))
        ((lambda (~ret) (wrap-cairo_status_t ~ret))
         ((force ~proc) dst rectangle))))))

;; extern void cairo_debug_reset_static_data(void);
(define-public cairo_debug_reset_static_data
  (let ((~proc (delay (ffi:pointer->procedure
                        ffi:void
                        (foreign-pointer-search
                          "cairo_debug_reset_static_data")
                        (list)))))
    (lambda () (let () ((force ~proc))))))

;; access to enum symbols and #define'd constants:
(define ffi-cairo-symbol-tab
  '((CAIRO_REGION_OVERLAP_PART . 2)
    (CAIRO_REGION_OVERLAP_OUT . 1)
    (CAIRO_REGION_OVERLAP_IN . 0)
    (CAIRO_REGION_OVERLAP_PART . 2)
    (CAIRO_REGION_OVERLAP_OUT . 1)
    (CAIRO_REGION_OVERLAP_IN . 0)
    (CAIRO_FILTER_GAUSSIAN . 5)
    (CAIRO_FILTER_BILINEAR . 4)
    (CAIRO_FILTER_NEAREST . 3)
    (CAIRO_FILTER_BEST . 2)
    (CAIRO_FILTER_GOOD . 1)
    (CAIRO_FILTER_FAST . 0)
    (CAIRO_FILTER_GAUSSIAN . 5)
    (CAIRO_FILTER_BILINEAR . 4)
    (CAIRO_FILTER_NEAREST . 3)
    (CAIRO_FILTER_BEST . 2)
    (CAIRO_FILTER_GOOD . 1)
    (CAIRO_FILTER_FAST . 0)
    (CAIRO_EXTEND_PAD . 3)
    (CAIRO_EXTEND_REFLECT . 2)
    (CAIRO_EXTEND_REPEAT . 1)
    (CAIRO_EXTEND_NONE . 0)
    (CAIRO_EXTEND_PAD . 3)
    (CAIRO_EXTEND_REFLECT . 2)
    (CAIRO_EXTEND_REPEAT . 1)
    (CAIRO_EXTEND_NONE . 0)
    (CAIRO_PATTERN_TYPE_RASTER_SOURCE . 5)
    (CAIRO_PATTERN_TYPE_MESH . 4)
    (CAIRO_PATTERN_TYPE_RADIAL . 3)
    (CAIRO_PATTERN_TYPE_LINEAR . 2)
    (CAIRO_PATTERN_TYPE_SURFACE . 1)
    (CAIRO_PATTERN_TYPE_SOLID . 0)
    (CAIRO_PATTERN_TYPE_RASTER_SOURCE . 5)
    (CAIRO_PATTERN_TYPE_MESH . 4)
    (CAIRO_PATTERN_TYPE_RADIAL . 3)
    (CAIRO_PATTERN_TYPE_LINEAR . 2)
    (CAIRO_PATTERN_TYPE_SURFACE . 1)
    (CAIRO_PATTERN_TYPE_SOLID . 0)
    (CAIRO_SURFACE_TYPE_COGL . 24)
    (CAIRO_SURFACE_TYPE_SUBSURFACE . 23)
    (CAIRO_SURFACE_TYPE_SKIA . 22)
    (CAIRO_SURFACE_TYPE_XML . 21)
    (CAIRO_SURFACE_TYPE_TEE . 20)
    (CAIRO_SURFACE_TYPE_DRM . 19)
    (CAIRO_SURFACE_TYPE_GL . 18)
    (CAIRO_SURFACE_TYPE_VG . 17)
    (CAIRO_SURFACE_TYPE_RECORDING . 16)
    (CAIRO_SURFACE_TYPE_QT . 15)
    (CAIRO_SURFACE_TYPE_SCRIPT . 14)
    (CAIRO_SURFACE_TYPE_QUARTZ_IMAGE . 13)
    (CAIRO_SURFACE_TYPE_WIN32_PRINTING . 12)
    (CAIRO_SURFACE_TYPE_OS2 . 11)
    (CAIRO_SURFACE_TYPE_SVG . 10)
    (CAIRO_SURFACE_TYPE_DIRECTFB . 9)
    (CAIRO_SURFACE_TYPE_BEOS . 8)
    (CAIRO_SURFACE_TYPE_WIN32 . 7)
    (CAIRO_SURFACE_TYPE_QUARTZ . 6)
    (CAIRO_SURFACE_TYPE_GLITZ . 5)
    (CAIRO_SURFACE_TYPE_XCB . 4)
    (CAIRO_SURFACE_TYPE_XLIB . 3)
    (CAIRO_SURFACE_TYPE_PS . 2)
    (CAIRO_SURFACE_TYPE_PDF . 1)
    (CAIRO_SURFACE_TYPE_IMAGE . 0)
    (CAIRO_SURFACE_TYPE_COGL . 24)
    (CAIRO_SURFACE_TYPE_SUBSURFACE . 23)
    (CAIRO_SURFACE_TYPE_SKIA . 22)
    (CAIRO_SURFACE_TYPE_XML . 21)
    (CAIRO_SURFACE_TYPE_TEE . 20)
    (CAIRO_SURFACE_TYPE_DRM . 19)
    (CAIRO_SURFACE_TYPE_GL . 18)
    (CAIRO_SURFACE_TYPE_VG . 17)
    (CAIRO_SURFACE_TYPE_RECORDING . 16)
    (CAIRO_SURFACE_TYPE_QT . 15)
    (CAIRO_SURFACE_TYPE_SCRIPT . 14)
    (CAIRO_SURFACE_TYPE_QUARTZ_IMAGE . 13)
    (CAIRO_SURFACE_TYPE_WIN32_PRINTING . 12)
    (CAIRO_SURFACE_TYPE_OS2 . 11)
    (CAIRO_SURFACE_TYPE_SVG . 10)
    (CAIRO_SURFACE_TYPE_DIRECTFB . 9)
    (CAIRO_SURFACE_TYPE_BEOS . 8)
    (CAIRO_SURFACE_TYPE_WIN32 . 7)
    (CAIRO_SURFACE_TYPE_QUARTZ . 6)
    (CAIRO_SURFACE_TYPE_GLITZ . 5)
    (CAIRO_SURFACE_TYPE_XCB . 4)
    (CAIRO_SURFACE_TYPE_XLIB . 3)
    (CAIRO_SURFACE_TYPE_PS . 2)
    (CAIRO_SURFACE_TYPE_PDF . 1)
    (CAIRO_SURFACE_TYPE_IMAGE . 0)
    (CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS . 1)
    (CAIRO_SURFACE_OBSERVER_NORMAL . 0)
    (CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS . 1)
    (CAIRO_SURFACE_OBSERVER_NORMAL . 0)
    (CAIRO_DEVICE_TYPE_INVALID . -1)
    (CAIRO_DEVICE_TYPE_WIN32 . 7)
    (CAIRO_DEVICE_TYPE_COGL . 6)
    (CAIRO_DEVICE_TYPE_XML . 5)
    (CAIRO_DEVICE_TYPE_XLIB . 4)
    (CAIRO_DEVICE_TYPE_XCB . 3)
    (CAIRO_DEVICE_TYPE_SCRIPT . 2)
    (CAIRO_DEVICE_TYPE_GL . 1)
    (CAIRO_DEVICE_TYPE_DRM . 0)
    (CAIRO_DEVICE_TYPE_INVALID . -1)
    (CAIRO_DEVICE_TYPE_WIN32 . 7)
    (CAIRO_DEVICE_TYPE_COGL . 6)
    (CAIRO_DEVICE_TYPE_XML . 5)
    (CAIRO_DEVICE_TYPE_XLIB . 4)
    (CAIRO_DEVICE_TYPE_XCB . 3)
    (CAIRO_DEVICE_TYPE_SCRIPT . 2)
    (CAIRO_DEVICE_TYPE_GL . 1)
    (CAIRO_DEVICE_TYPE_DRM . 0)
    (CAIRO_PATH_CLOSE_PATH . 3)
    (CAIRO_PATH_CURVE_TO . 2)
    (CAIRO_PATH_LINE_TO . 1)
    (CAIRO_PATH_MOVE_TO . 0)
    (CAIRO_PATH_CLOSE_PATH . 3)
    (CAIRO_PATH_CURVE_TO . 2)
    (CAIRO_PATH_LINE_TO . 1)
    (CAIRO_PATH_MOVE_TO . 0)
    (CAIRO_FONT_TYPE_DWRITE . 5)
    (CAIRO_FONT_TYPE_USER . 4)
    (CAIRO_FONT_TYPE_QUARTZ . 3)
    (CAIRO_FONT_TYPE_WIN32 . 2)
    (CAIRO_FONT_TYPE_FT . 1)
    (CAIRO_FONT_TYPE_TOY . 0)
    (CAIRO_FONT_TYPE_DWRITE . 5)
    (CAIRO_FONT_TYPE_USER . 4)
    (CAIRO_FONT_TYPE_QUARTZ . 3)
    (CAIRO_FONT_TYPE_WIN32 . 2)
    (CAIRO_FONT_TYPE_FT . 1)
    (CAIRO_FONT_TYPE_TOY . 0)
    (CAIRO_COLOR_MODE_COLOR . 2)
    (CAIRO_COLOR_MODE_NO_COLOR . 1)
    (CAIRO_COLOR_MODE_DEFAULT . 0)
    (CAIRO_COLOR_MODE_COLOR . 2)
    (CAIRO_COLOR_MODE_NO_COLOR . 1)
    (CAIRO_COLOR_MODE_DEFAULT . 0)
    (CAIRO_HINT_METRICS_ON . 2)
    (CAIRO_HINT_METRICS_OFF . 1)
    (CAIRO_HINT_METRICS_DEFAULT . 0)
    (CAIRO_HINT_METRICS_ON . 2)
    (CAIRO_HINT_METRICS_OFF . 1)
    (CAIRO_HINT_METRICS_DEFAULT . 0)
    (CAIRO_HINT_STYLE_FULL . 4)
    (CAIRO_HINT_STYLE_MEDIUM . 3)
    (CAIRO_HINT_STYLE_SLIGHT . 2)
    (CAIRO_HINT_STYLE_NONE . 1)
    (CAIRO_HINT_STYLE_DEFAULT . 0)
    (CAIRO_HINT_STYLE_FULL . 4)
    (CAIRO_HINT_STYLE_MEDIUM . 3)
    (CAIRO_HINT_STYLE_SLIGHT . 2)
    (CAIRO_HINT_STYLE_NONE . 1)
    (CAIRO_HINT_STYLE_DEFAULT . 0)
    (CAIRO_SUBPIXEL_ORDER_VBGR . 4)
    (CAIRO_SUBPIXEL_ORDER_VRGB . 3)
    (CAIRO_SUBPIXEL_ORDER_BGR . 2)
    (CAIRO_SUBPIXEL_ORDER_RGB . 1)
    (CAIRO_SUBPIXEL_ORDER_DEFAULT . 0)
    (CAIRO_SUBPIXEL_ORDER_VBGR . 4)
    (CAIRO_SUBPIXEL_ORDER_VRGB . 3)
    (CAIRO_SUBPIXEL_ORDER_BGR . 2)
    (CAIRO_SUBPIXEL_ORDER_RGB . 1)
    (CAIRO_SUBPIXEL_ORDER_DEFAULT . 0)
    (CAIRO_FONT_WEIGHT_BOLD . 1)
    (CAIRO_FONT_WEIGHT_NORMAL . 0)
    (CAIRO_FONT_WEIGHT_BOLD . 1)
    (CAIRO_FONT_WEIGHT_NORMAL . 0)
    (CAIRO_FONT_SLANT_OBLIQUE . 2)
    (CAIRO_FONT_SLANT_ITALIC . 1)
    (CAIRO_FONT_SLANT_NORMAL . 0)
    (CAIRO_FONT_SLANT_OBLIQUE . 2)
    (CAIRO_FONT_SLANT_ITALIC . 1)
    (CAIRO_FONT_SLANT_NORMAL . 0)
    (CAIRO_TEXT_CLUSTER_FLAG_BACKWARD . 1)
    (CAIRO_TEXT_CLUSTER_FLAG_BACKWARD . 1)
    (CAIRO_LINE_JOIN_BEVEL . 2)
    (CAIRO_LINE_JOIN_ROUND . 1)
    (CAIRO_LINE_JOIN_MITER . 0)
    (CAIRO_LINE_JOIN_BEVEL . 2)
    (CAIRO_LINE_JOIN_ROUND . 1)
    (CAIRO_LINE_JOIN_MITER . 0)
    (CAIRO_LINE_CAP_SQUARE . 2)
    (CAIRO_LINE_CAP_ROUND . 1)
    (CAIRO_LINE_CAP_BUTT . 0)
    (CAIRO_LINE_CAP_SQUARE . 2)
    (CAIRO_LINE_CAP_ROUND . 1)
    (CAIRO_LINE_CAP_BUTT . 0)
    (CAIRO_FILL_RULE_EVEN_ODD . 1)
    (CAIRO_FILL_RULE_WINDING . 0)
    (CAIRO_FILL_RULE_EVEN_ODD . 1)
    (CAIRO_FILL_RULE_WINDING . 0)
    (CAIRO_ANTIALIAS_BEST . 6)
    (CAIRO_ANTIALIAS_GOOD . 5)
    (CAIRO_ANTIALIAS_FAST . 4)
    (CAIRO_ANTIALIAS_SUBPIXEL . 3)
    (CAIRO_ANTIALIAS_GRAY . 2)
    (CAIRO_ANTIALIAS_NONE . 1)
    (CAIRO_ANTIALIAS_DEFAULT . 0)
    (CAIRO_ANTIALIAS_BEST . 6)
    (CAIRO_ANTIALIAS_GOOD . 5)
    (CAIRO_ANTIALIAS_FAST . 4)
    (CAIRO_ANTIALIAS_SUBPIXEL . 3)
    (CAIRO_ANTIALIAS_GRAY . 2)
    (CAIRO_ANTIALIAS_NONE . 1)
    (CAIRO_ANTIALIAS_DEFAULT . 0)
    (CAIRO_OPERATOR_HSL_LUMINOSITY . 28)
    (CAIRO_OPERATOR_HSL_COLOR . 27)
    (CAIRO_OPERATOR_HSL_SATURATION . 26)
    (CAIRO_OPERATOR_HSL_HUE . 25)
    (CAIRO_OPERATOR_EXCLUSION . 24)
    (CAIRO_OPERATOR_DIFFERENCE . 23)
    (CAIRO_OPERATOR_SOFT_LIGHT . 22)
    (CAIRO_OPERATOR_HARD_LIGHT . 21)
    (CAIRO_OPERATOR_COLOR_BURN . 20)
    (CAIRO_OPERATOR_COLOR_DODGE . 19)
    (CAIRO_OPERATOR_LIGHTEN . 18)
    (CAIRO_OPERATOR_DARKEN . 17)
    (CAIRO_OPERATOR_OVERLAY . 16)
    (CAIRO_OPERATOR_SCREEN . 15)
    (CAIRO_OPERATOR_MULTIPLY . 14)
    (CAIRO_OPERATOR_SATURATE . 13)
    (CAIRO_OPERATOR_ADD . 12)
    (CAIRO_OPERATOR_XOR . 11)
    (CAIRO_OPERATOR_DEST_ATOP . 10)
    (CAIRO_OPERATOR_DEST_OUT . 9)
    (CAIRO_OPERATOR_DEST_IN . 8)
    (CAIRO_OPERATOR_DEST_OVER . 7)
    (CAIRO_OPERATOR_DEST . 6)
    (CAIRO_OPERATOR_ATOP . 5)
    (CAIRO_OPERATOR_OUT . 4)
    (CAIRO_OPERATOR_IN . 3)
    (CAIRO_OPERATOR_OVER . 2)
    (CAIRO_OPERATOR_SOURCE . 1)
    (CAIRO_OPERATOR_CLEAR . 0)
    (CAIRO_OPERATOR_HSL_LUMINOSITY . 28)
    (CAIRO_OPERATOR_HSL_COLOR . 27)
    (CAIRO_OPERATOR_HSL_SATURATION . 26)
    (CAIRO_OPERATOR_HSL_HUE . 25)
    (CAIRO_OPERATOR_EXCLUSION . 24)
    (CAIRO_OPERATOR_DIFFERENCE . 23)
    (CAIRO_OPERATOR_SOFT_LIGHT . 22)
    (CAIRO_OPERATOR_HARD_LIGHT . 21)
    (CAIRO_OPERATOR_COLOR_BURN . 20)
    (CAIRO_OPERATOR_COLOR_DODGE . 19)
    (CAIRO_OPERATOR_LIGHTEN . 18)
    (CAIRO_OPERATOR_DARKEN . 17)
    (CAIRO_OPERATOR_OVERLAY . 16)
    (CAIRO_OPERATOR_SCREEN . 15)
    (CAIRO_OPERATOR_MULTIPLY . 14)
    (CAIRO_OPERATOR_SATURATE . 13)
    (CAIRO_OPERATOR_ADD . 12)
    (CAIRO_OPERATOR_XOR . 11)
    (CAIRO_OPERATOR_DEST_ATOP . 10)
    (CAIRO_OPERATOR_DEST_OUT . 9)
    (CAIRO_OPERATOR_DEST_IN . 8)
    (CAIRO_OPERATOR_DEST_OVER . 7)
    (CAIRO_OPERATOR_DEST . 6)
    (CAIRO_OPERATOR_ATOP . 5)
    (CAIRO_OPERATOR_OUT . 4)
    (CAIRO_OPERATOR_IN . 3)
    (CAIRO_OPERATOR_OVER . 2)
    (CAIRO_OPERATOR_SOURCE . 1)
    (CAIRO_OPERATOR_CLEAR . 0)
    (CAIRO_DITHER_BEST . 4)
    (CAIRO_DITHER_GOOD . 3)
    (CAIRO_DITHER_FAST . 2)
    (CAIRO_DITHER_DEFAULT . 1)
    (CAIRO_DITHER_NONE . 0)
    (CAIRO_DITHER_BEST . 4)
    (CAIRO_DITHER_GOOD . 3)
    (CAIRO_DITHER_FAST . 2)
    (CAIRO_DITHER_DEFAULT . 1)
    (CAIRO_DITHER_NONE . 0)
    (CAIRO_FORMAT_RGBA128F . 7)
    (CAIRO_FORMAT_RGB96F . 6)
    (CAIRO_FORMAT_RGB30 . 5)
    (CAIRO_FORMAT_RGB16_565 . 4)
    (CAIRO_FORMAT_A1 . 3)
    (CAIRO_FORMAT_A8 . 2)
    (CAIRO_FORMAT_RGB24 . 1)
    (CAIRO_FORMAT_ARGB32 . 0)
    (CAIRO_FORMAT_INVALID . -1)
    (CAIRO_FORMAT_RGBA128F . 7)
    (CAIRO_FORMAT_RGB96F . 6)
    (CAIRO_FORMAT_RGB30 . 5)
    (CAIRO_FORMAT_RGB16_565 . 4)
    (CAIRO_FORMAT_A1 . 3)
    (CAIRO_FORMAT_A8 . 2)
    (CAIRO_FORMAT_RGB24 . 1)
    (CAIRO_FORMAT_ARGB32 . 0)
    (CAIRO_FORMAT_INVALID . -1)
    (CAIRO_CONTENT_COLOR_ALPHA . 12288)
    (CAIRO_CONTENT_ALPHA . 8192)
    (CAIRO_CONTENT_COLOR . 4096)
    (CAIRO_CONTENT_COLOR_ALPHA . 12288)
    (CAIRO_CONTENT_ALPHA . 8192)
    (CAIRO_CONTENT_COLOR . 4096)
    (CAIRO_STATUS_LAST_STATUS . 45)
    (CAIRO_STATUS_SVG_FONT_ERROR . 44)
    (CAIRO_STATUS_DWRITE_ERROR . 43)
    (CAIRO_STATUS_TAG_ERROR . 42)
    (CAIRO_STATUS_WIN32_GDI_ERROR . 41)
    (CAIRO_STATUS_FREETYPE_ERROR . 40)
    (CAIRO_STATUS_PNG_ERROR . 39)
    (CAIRO_STATUS_JBIG2_GLOBAL_MISSING . 38)
    (CAIRO_STATUS_DEVICE_FINISHED . 37)
    (CAIRO_STATUS_INVALID_MESH_CONSTRUCTION . 36)
    (CAIRO_STATUS_DEVICE_ERROR . 35)
    (CAIRO_STATUS_DEVICE_TYPE_MISMATCH . 34)
    (CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED . 33)
    (CAIRO_STATUS_INVALID_SIZE . 32)
    (CAIRO_STATUS_INVALID_WEIGHT . 31)
    (CAIRO_STATUS_INVALID_SLANT . 30)
    (CAIRO_STATUS_INVALID_CLUSTERS . 29)
    (CAIRO_STATUS_NEGATIVE_COUNT . 28)
    (CAIRO_STATUS_USER_FONT_ERROR . 27)
    (CAIRO_STATUS_USER_FONT_IMMUTABLE . 26)
    (CAIRO_STATUS_FONT_TYPE_MISMATCH . 25)
    (CAIRO_STATUS_INVALID_STRIDE . 24)
    (CAIRO_STATUS_TEMP_FILE_ERROR . 23)
    (CAIRO_STATUS_CLIP_NOT_REPRESENTABLE . 22)
    (CAIRO_STATUS_INVALID_INDEX . 21)
    (CAIRO_STATUS_INVALID_DSC_COMMENT . 20)
    (CAIRO_STATUS_INVALID_DASH . 19)
    (CAIRO_STATUS_FILE_NOT_FOUND . 18)
    (CAIRO_STATUS_INVALID_VISUAL . 17)
    (CAIRO_STATUS_INVALID_FORMAT . 16)
    (CAIRO_STATUS_INVALID_CONTENT . 15)
    (CAIRO_STATUS_PATTERN_TYPE_MISMATCH . 14)
    (CAIRO_STATUS_SURFACE_TYPE_MISMATCH . 13)
    (CAIRO_STATUS_SURFACE_FINISHED . 12)
    (CAIRO_STATUS_WRITE_ERROR . 11)
    (CAIRO_STATUS_READ_ERROR . 10)
    (CAIRO_STATUS_INVALID_PATH_DATA . 9)
    (CAIRO_STATUS_INVALID_STRING . 8)
    (CAIRO_STATUS_NULL_POINTER . 7)
    (CAIRO_STATUS_INVALID_STATUS . 6)
    (CAIRO_STATUS_INVALID_MATRIX . 5)
    (CAIRO_STATUS_NO_CURRENT_POINT . 4)
    (CAIRO_STATUS_INVALID_POP_GROUP . 3)
    (CAIRO_STATUS_INVALID_RESTORE . 2)
    (CAIRO_STATUS_NO_MEMORY . 1)
    (CAIRO_STATUS_SUCCESS . 0)
    (CAIRO_STATUS_LAST_STATUS . 45)
    (CAIRO_STATUS_SVG_FONT_ERROR . 44)
    (CAIRO_STATUS_DWRITE_ERROR . 43)
    (CAIRO_STATUS_TAG_ERROR . 42)
    (CAIRO_STATUS_WIN32_GDI_ERROR . 41)
    (CAIRO_STATUS_FREETYPE_ERROR . 40)
    (CAIRO_STATUS_PNG_ERROR . 39)
    (CAIRO_STATUS_JBIG2_GLOBAL_MISSING . 38)
    (CAIRO_STATUS_DEVICE_FINISHED . 37)
    (CAIRO_STATUS_INVALID_MESH_CONSTRUCTION . 36)
    (CAIRO_STATUS_DEVICE_ERROR . 35)
    (CAIRO_STATUS_DEVICE_TYPE_MISMATCH . 34)
    (CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED . 33)
    (CAIRO_STATUS_INVALID_SIZE . 32)
    (CAIRO_STATUS_INVALID_WEIGHT . 31)
    (CAIRO_STATUS_INVALID_SLANT . 30)
    (CAIRO_STATUS_INVALID_CLUSTERS . 29)
    (CAIRO_STATUS_NEGATIVE_COUNT . 28)
    (CAIRO_STATUS_USER_FONT_ERROR . 27)
    (CAIRO_STATUS_USER_FONT_IMMUTABLE . 26)
    (CAIRO_STATUS_FONT_TYPE_MISMATCH . 25)
    (CAIRO_STATUS_INVALID_STRIDE . 24)
    (CAIRO_STATUS_TEMP_FILE_ERROR . 23)
    (CAIRO_STATUS_CLIP_NOT_REPRESENTABLE . 22)
    (CAIRO_STATUS_INVALID_INDEX . 21)
    (CAIRO_STATUS_INVALID_DSC_COMMENT . 20)
    (CAIRO_STATUS_INVALID_DASH . 19)
    (CAIRO_STATUS_FILE_NOT_FOUND . 18)
    (CAIRO_STATUS_INVALID_VISUAL . 17)
    (CAIRO_STATUS_INVALID_FORMAT . 16)
    (CAIRO_STATUS_INVALID_CONTENT . 15)
    (CAIRO_STATUS_PATTERN_TYPE_MISMATCH . 14)
    (CAIRO_STATUS_SURFACE_TYPE_MISMATCH . 13)
    (CAIRO_STATUS_SURFACE_FINISHED . 12)
    (CAIRO_STATUS_WRITE_ERROR . 11)
    (CAIRO_STATUS_READ_ERROR . 10)
    (CAIRO_STATUS_INVALID_PATH_DATA . 9)
    (CAIRO_STATUS_INVALID_STRING . 8)
    (CAIRO_STATUS_NULL_POINTER . 7)
    (CAIRO_STATUS_INVALID_STATUS . 6)
    (CAIRO_STATUS_INVALID_MATRIX . 5)
    (CAIRO_STATUS_NO_CURRENT_POINT . 4)
    (CAIRO_STATUS_INVALID_POP_GROUP . 3)
    (CAIRO_STATUS_INVALID_RESTORE . 2)
    (CAIRO_STATUS_NO_MEMORY . 1)
    (CAIRO_STATUS_SUCCESS . 0)
    (CAIRO_MIME_TYPE_EPS_PARAMS
      .
      "application/x-cairo.eps.params")
    (CAIRO_MIME_TYPE_EPS . "application/postscript")
    (CAIRO_MIME_TYPE_CCITT_FAX_PARAMS
      .
      "application/x-cairo.ccitt.params")
    (CAIRO_MIME_TYPE_CCITT_FAX . "image/g3fax")
    (CAIRO_MIME_TYPE_JBIG2_GLOBAL_ID
      .
      "application/x-cairo.jbig2-global-id")
    (CAIRO_MIME_TYPE_JBIG2_GLOBAL
      .
      "application/x-cairo.jbig2-global")
    (CAIRO_MIME_TYPE_JBIG2
      .
      "application/x-cairo.jbig2")
    (CAIRO_MIME_TYPE_UNIQUE_ID
      .
      "application/x-cairo.uuid")
    (CAIRO_MIME_TYPE_URI . "text/x-uri")
    (CAIRO_MIME_TYPE_JP2 . "image/jp2")
    (CAIRO_MIME_TYPE_PNG . "image/png")
    (CAIRO_MIME_TYPE_JPEG . "image/jpeg")
    (CAIRO_COLOR_PALETTE_DEFAULT . 0)
    (CAIRO_TAG_CONTENT_REF . "cairo.content_ref")
    (CAIRO_TAG_CONTENT . "cairo.content")
    (CAIRO_TAG_LINK . "Link")
    (CAIRO_TAG_DEST . "cairo.dest")
    (CAIRO_VERSION_STRING . "1.18.4")
    (CAIRO_VERSION . 11804)))
(export ffi-cairo-symbol-tab)

(define ffi-cairo-symbol-val
  (lambda (k)
    (or (assq-ref ffi-cairo-symbol-tab k))))
(export ffi-cairo-symbol-val)

(define (unwrap~enum arg)
  (cond ((number? arg) arg)
        ((symbol? arg) (ffi-cairo-symbol-val arg))
        ((cdata? arg) (cdata-ref arg))
        (else (error "type mismatch"))))

(define ffi-cairo-types
  '("cairo_bool_t" (pointer . "cairo_t") "cairo_t" (pointer . 
    "cairo_surface_t") "cairo_surface_t" (pointer . "cairo_device_t") 
    "cairo_device_t" (struct-pointer . "_cairo_matrix") (struct . 
    "_cairo_matrix") (pointer . "cairo_matrix_t") "cairo_matrix_t" (pointer . 
    "cairo_pattern_t") "cairo_pattern_t" "cairo_destroy_func_t" (
    struct-pointer . "_cairo_user_data_key") (struct . "_cairo_user_data_key")
    (pointer . "cairo_user_data_key_t") "cairo_user_data_key_t" (enum . 
    "_cairo_status") "cairo_status_t" (enum . "_cairo_content") 
    "cairo_content_t" (enum . "_cairo_format") "cairo_format_t" (enum . 
    "_cairo_dither") "cairo_dither_t" "cairo_write_func_t" "cairo_read_func_t"
    (struct-pointer . "_cairo_rectangle_int") (struct . "_cairo_rectangle_int"
    ) (pointer . "cairo_rectangle_int_t") "cairo_rectangle_int_t" (enum . 
    "_cairo_operator") "cairo_operator_t" (enum . "_cairo_antialias") 
    "cairo_antialias_t" (enum . "_cairo_fill_rule") "cairo_fill_rule_t" 
    (enum . "_cairo_line_cap") "cairo_line_cap_t" (enum . "_cairo_line_join") 
    "cairo_line_join_t" (struct-pointer . "_cairo_rectangle") (struct . 
    "_cairo_rectangle") (pointer . "cairo_rectangle_t") "cairo_rectangle_t" 
    (struct-pointer . "_cairo_rectangle_list") (struct . 
    "_cairo_rectangle_list") (pointer . "cairo_rectangle_list_t") 
    "cairo_rectangle_list_t" (pointer . "cairo_scaled_font_t") 
    "cairo_scaled_font_t" (pointer . "cairo_font_face_t") "cairo_font_face_t" 
    (pointer . "cairo_glyph_t") "cairo_glyph_t" (pointer . 
    "cairo_text_cluster_t") "cairo_text_cluster_t" (enum . 
    "_cairo_text_cluster_flags") "cairo_text_cluster_flags_t" (pointer . 
    "cairo_text_extents_t") "cairo_text_extents_t" (pointer . 
    "cairo_font_extents_t") "cairo_font_extents_t" (enum . "_cairo_font_slant"
    ) "cairo_font_slant_t" (enum . "_cairo_font_weight") "cairo_font_weight_t"
    (enum . "_cairo_subpixel_order") "cairo_subpixel_order_t" (enum . 
    "_cairo_hint_style") "cairo_hint_style_t" (enum . "_cairo_hint_metrics") 
    "cairo_hint_metrics_t" (enum . "_cairo_color_mode") "cairo_color_mode_t" 
    (pointer . "cairo_font_options_t") "cairo_font_options_t" (enum . 
    "_cairo_font_type") "cairo_font_type_t" 
    "cairo_user_scaled_font_init_func_t" 
    "cairo_user_scaled_font_render_glyph_func_t" 
    "cairo_user_scaled_font_text_to_glyphs_func_t" 
    "cairo_user_scaled_font_unicode_to_glyph_func_t" (enum . 
    "_cairo_path_data_type") "cairo_path_data_type_t" (pointer . 
    "cairo_path_data_t") "cairo_path_data_t" (union . "_cairo_path_data_t") 
    "cairo_path_data_t" (struct-pointer . "cairo_path") (struct . "cairo_path"
    ) (pointer . "cairo_path_t") "cairo_path_t" (enum . "_cairo_device_type") 
    "cairo_device_type_t" "cairo_surface_observer_mode_t" 
    "cairo_surface_observer_callback_t" (enum . "_cairo_surface_type") 
    "cairo_surface_type_t" "cairo_raster_source_acquire_func_t" 
    "cairo_raster_source_release_func_t" "cairo_raster_source_snapshot_func_t"
    "cairo_raster_source_copy_func_t" "cairo_raster_source_finish_func_t" 
    (enum . "_cairo_pattern_type") "cairo_pattern_type_t" (enum . 
    "_cairo_extend") "cairo_extend_t" (enum . "_cairo_filter") 
    "cairo_filter_t" (pointer . "cairo_region_t") "cairo_region_t" (enum . 
    "_cairo_region_overlap") "cairo_region_overlap_t"))
(export ffi-cairo-types)

(define-public cairo_raster_source_acquire_func_t*
  (cpointer cairo_raster_source_acquire_func_t))

(define-public cairo_raster_source_release_func_t*
  (cpointer cairo_raster_source_release_func_t))

(define (make-cairo-unit-matrix)
  (make-cdata
    cairo_matrix_t
    `((xx 1.0)
      (yx 0.0)
      (xy 0.0)
      (yy 1.0)
      (x0 0.0)
      (y0 0.0))))

(define M_PI 3.141592653589793)

(define M_2PI 6.283185307179586)

;; --- last line ---
