;; generated with `guild compile-ffi ffi/cairo.ffi'

(define-module (ffi cairo)
  #:export (M_PI M_2PI make-cairo-unit-matrix)
  #:use-module (ffi ffi-help-rt)
  #:use-module ((system foreign) #:prefix ffi:)
  #:use-module (bytestructures guile))

(define ffi-cairo-llibs
  (delay (list (dynamic-link "libcairo"))))


;; int cairo_version(void );
(define cairo_version
  (let ((~cairo_version
          (delay (fh-link-proc
                   ffi:int
                   "cairo_version"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda () (let () ((force ~cairo_version))))))
(export cairo_version)

;; const char *cairo_version_string(void );
(define cairo_version_string
  (let ((~cairo_version_string
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_version_string"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let () ((force ~cairo_version_string))))))
(export cairo_version_string)

;; typedef int cairo_bool_t;
(define-public cairo_bool_t-desc int)

;; typedef struct _cairo cairo_t;
(define-public cairo_t-desc 'void)
(define-fh-type-alias cairo_t fh-void)
(define-public cairo_t? fh-void?)
(define-public make-cairo_t make-fh-void)
(define-public cairo_t*-desc (fh:pointer cairo_t-desc))
(define-fh-pointer-type cairo_t* cairo_t*-desc cairo_t*? make-cairo_t*)
(export cairo_t* cairo_t*? make-cairo_t*)

;; typedef struct _cairo_surface cairo_surface_t;
(define-public cairo_surface_t-desc 'void)
(define-fh-type-alias cairo_surface_t fh-void)
(define-public cairo_surface_t? fh-void?)
(define-public make-cairo_surface_t make-fh-void)
(define-public cairo_surface_t*-desc (fh:pointer cairo_surface_t-desc))
(define-fh-pointer-type cairo_surface_t* cairo_surface_t*-desc 
 cairo_surface_t*? make-cairo_surface_t*)
(export cairo_surface_t* cairo_surface_t*? make-cairo_surface_t*)

;; typedef struct _cairo_device cairo_device_t;
(define-public cairo_device_t-desc 'void)
(define-fh-type-alias cairo_device_t fh-void)
(define-public cairo_device_t? fh-void?)
(define-public make-cairo_device_t make-fh-void)
(define-public cairo_device_t*-desc (fh:pointer cairo_device_t-desc))
(define-fh-pointer-type cairo_device_t* cairo_device_t*-desc cairo_device_t*? 
 make-cairo_device_t*)
(export cairo_device_t* cairo_device_t*? make-cairo_device_t*)

;; typedef struct _cairo_matrix {
;;   double xx;
;;   double yx;
;;   double xy;
;;   double yy;
;;   double x0;
;;   double y0;
;; } cairo_matrix_t;
(define-public cairo_matrix_t-desc
  (bs:struct
    (list `(xx ,double)
          `(yx ,double)
          `(xy ,double)
          `(yy ,double)
          `(x0 ,double)
          `(y0 ,double))))
(define-fh-compound-type cairo_matrix_t cairo_matrix_t-desc cairo_matrix_t? 
 make-cairo_matrix_t)
(export cairo_matrix_t cairo_matrix_t? make-cairo_matrix_t)
(define-public cairo_matrix_t*-desc
  (fh:pointer cairo_matrix_t-desc))
(define-fh-pointer-type cairo_matrix_t* cairo_matrix_t*-desc cairo_matrix_t*? 
 make-cairo_matrix_t*)
(export cairo_matrix_t* cairo_matrix_t*? make-cairo_matrix_t*)
(fh-ref<=>deref!
  cairo_matrix_t*
  make-cairo_matrix_t*
  cairo_matrix_t
  make-cairo_matrix_t)
(define-public struct-_cairo_matrix-desc
  cairo_matrix_t-desc)
(define-fh-compound-type struct-_cairo_matrix struct-_cairo_matrix-desc 
 struct-_cairo_matrix? make-struct-_cairo_matrix)
(export struct-_cairo_matrix struct-_cairo_matrix? make-struct-_cairo_matrix)
(define-public struct-_cairo_matrix*-desc
  cairo_matrix_t*-desc)
(define-fh-pointer-type struct-_cairo_matrix* struct-_cairo_matrix*-desc 
 struct-_cairo_matrix*? make-struct-_cairo_matrix*)
(export struct-_cairo_matrix* struct-_cairo_matrix*? 
 make-struct-_cairo_matrix*)
(fh-ref<=>deref!
  struct-_cairo_matrix*
  make-struct-_cairo_matrix*
  struct-_cairo_matrix
  make-struct-_cairo_matrix)

;; typedef struct _cairo_pattern cairo_pattern_t;
(define-public cairo_pattern_t-desc 'void)
(define-fh-type-alias cairo_pattern_t fh-void)
(define-public cairo_pattern_t? fh-void?)
(define-public make-cairo_pattern_t make-fh-void)
(define-public cairo_pattern_t*-desc (fh:pointer cairo_pattern_t-desc))
(define-fh-pointer-type cairo_pattern_t* cairo_pattern_t*-desc 
 cairo_pattern_t*? make-cairo_pattern_t*)
(export cairo_pattern_t* cairo_pattern_t*? make-cairo_pattern_t*)

;; typedef void (*cairo_destroy_func_t)(void *data);
(define-public cairo_destroy_func_t-desc
  (fh:pointer
    (delay (fh:function 'void (list (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_destroy_func_t
  cairo_destroy_func_t-desc
  cairo_destroy_func_t?
  make-cairo_destroy_func_t)
(export cairo_destroy_func_t cairo_destroy_func_t? make-cairo_destroy_func_t)

;; typedef struct _cairo_user_data_key {
;;   int unused;
;; } cairo_user_data_key_t;
(define-public cairo_user_data_key_t-desc
  (bs:struct (list `(unused ,int))))
(define-fh-compound-type cairo_user_data_key_t cairo_user_data_key_t-desc 
 cairo_user_data_key_t? make-cairo_user_data_key_t)
(export cairo_user_data_key_t cairo_user_data_key_t? 
 make-cairo_user_data_key_t)
(define-public cairo_user_data_key_t*-desc
  (fh:pointer cairo_user_data_key_t-desc))
(define-fh-pointer-type cairo_user_data_key_t* cairo_user_data_key_t*-desc 
 cairo_user_data_key_t*? make-cairo_user_data_key_t*)
(export cairo_user_data_key_t* cairo_user_data_key_t*? 
 make-cairo_user_data_key_t*)
(fh-ref<=>deref!
  cairo_user_data_key_t*
  make-cairo_user_data_key_t*
  cairo_user_data_key_t
  make-cairo_user_data_key_t)
(define-public struct-_cairo_user_data_key-desc
  cairo_user_data_key_t-desc)
(define-fh-compound-type struct-_cairo_user_data_key 
 struct-_cairo_user_data_key-desc struct-_cairo_user_data_key? 
 make-struct-_cairo_user_data_key)
(export struct-_cairo_user_data_key struct-_cairo_user_data_key? 
 make-struct-_cairo_user_data_key)
(define-public struct-_cairo_user_data_key*-desc
  cairo_user_data_key_t*-desc)
(define-fh-pointer-type struct-_cairo_user_data_key* 
 struct-_cairo_user_data_key*-desc struct-_cairo_user_data_key*? 
 make-struct-_cairo_user_data_key*)
(export struct-_cairo_user_data_key* struct-_cairo_user_data_key*? 
 make-struct-_cairo_user_data_key*)
(fh-ref<=>deref!
  struct-_cairo_user_data_key*
  make-struct-_cairo_user_data_key*
  struct-_cairo_user_data_key
  make-struct-_cairo_user_data_key)

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
;;   CAIRO_STATUS_LAST_STATUS,
;; } cairo_status_t;
(define cairo_status_t-enum-nvl
  '((CAIRO_STATUS_SUCCESS . 0)
    (CAIRO_STATUS_NO_MEMORY . 1)
    (CAIRO_STATUS_INVALID_RESTORE . 2)
    (CAIRO_STATUS_INVALID_POP_GROUP . 3)
    (CAIRO_STATUS_NO_CURRENT_POINT . 4)
    (CAIRO_STATUS_INVALID_MATRIX . 5)
    (CAIRO_STATUS_INVALID_STATUS . 6)
    (CAIRO_STATUS_NULL_POINTER . 7)
    (CAIRO_STATUS_INVALID_STRING . 8)
    (CAIRO_STATUS_INVALID_PATH_DATA . 9)
    (CAIRO_STATUS_READ_ERROR . 10)
    (CAIRO_STATUS_WRITE_ERROR . 11)
    (CAIRO_STATUS_SURFACE_FINISHED . 12)
    (CAIRO_STATUS_SURFACE_TYPE_MISMATCH . 13)
    (CAIRO_STATUS_PATTERN_TYPE_MISMATCH . 14)
    (CAIRO_STATUS_INVALID_CONTENT . 15)
    (CAIRO_STATUS_INVALID_FORMAT . 16)
    (CAIRO_STATUS_INVALID_VISUAL . 17)
    (CAIRO_STATUS_FILE_NOT_FOUND . 18)
    (CAIRO_STATUS_INVALID_DASH . 19)
    (CAIRO_STATUS_INVALID_DSC_COMMENT . 20)
    (CAIRO_STATUS_INVALID_INDEX . 21)
    (CAIRO_STATUS_CLIP_NOT_REPRESENTABLE . 22)
    (CAIRO_STATUS_TEMP_FILE_ERROR . 23)
    (CAIRO_STATUS_INVALID_STRIDE . 24)
    (CAIRO_STATUS_FONT_TYPE_MISMATCH . 25)
    (CAIRO_STATUS_USER_FONT_IMMUTABLE . 26)
    (CAIRO_STATUS_USER_FONT_ERROR . 27)
    (CAIRO_STATUS_NEGATIVE_COUNT . 28)
    (CAIRO_STATUS_INVALID_CLUSTERS . 29)
    (CAIRO_STATUS_INVALID_SLANT . 30)
    (CAIRO_STATUS_INVALID_WEIGHT . 31)
    (CAIRO_STATUS_INVALID_SIZE . 32)
    (CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED . 33)
    (CAIRO_STATUS_DEVICE_TYPE_MISMATCH . 34)
    (CAIRO_STATUS_DEVICE_ERROR . 35)
    (CAIRO_STATUS_INVALID_MESH_CONSTRUCTION . 36)
    (CAIRO_STATUS_DEVICE_FINISHED . 37)
    (CAIRO_STATUS_JBIG2_GLOBAL_MISSING . 38)
    (CAIRO_STATUS_PNG_ERROR . 39)
    (CAIRO_STATUS_FREETYPE_ERROR . 40)
    (CAIRO_STATUS_WIN32_GDI_ERROR . 41)
    (CAIRO_STATUS_TAG_ERROR . 42)
    (CAIRO_STATUS_LAST_STATUS . 43))
  )
(define cairo_status_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_status_t-enum-nvl))
(define-public (unwrap-cairo_status_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_status_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_status_t v)
  (assq-ref cairo_status_t-enum-vnl v))
(define-public unwrap-enum-_cairo_status unwrap-cairo_status_t)
(define-public wrap-enum-_cairo_status wrap-cairo_status_t)

;; enum _cairo_status {
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
;;   CAIRO_STATUS_LAST_STATUS,
;; };

;; typedef enum _cairo_content {
;;   CAIRO_CONTENT_COLOR = 0x1000,
;;   CAIRO_CONTENT_ALPHA = 0x2000,
;;   CAIRO_CONTENT_COLOR_ALPHA = 0x3000,
;; } cairo_content_t;
(define cairo_content_t-enum-nvl
  '((CAIRO_CONTENT_COLOR . 4096)
    (CAIRO_CONTENT_ALPHA . 8192)
    (CAIRO_CONTENT_COLOR_ALPHA . 12288))
  )
(define cairo_content_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_content_t-enum-nvl))
(define-public (unwrap-cairo_content_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_content_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_content_t v)
  (assq-ref cairo_content_t-enum-vnl v))
(define-public unwrap-enum-_cairo_content unwrap-cairo_content_t)
(define-public wrap-enum-_cairo_content wrap-cairo_content_t)

;; enum _cairo_content {
;;   CAIRO_CONTENT_COLOR = 0x1000,
;;   CAIRO_CONTENT_ALPHA = 0x2000,
;;   CAIRO_CONTENT_COLOR_ALPHA = 0x3000,
;; };

;; typedef enum _cairo_format {
;;   CAIRO_FORMAT_INVALID = -1,
;;   CAIRO_FORMAT_ARGB32 = 0,
;;   CAIRO_FORMAT_RGB24 = 1,
;;   CAIRO_FORMAT_A8 = 2,
;;   CAIRO_FORMAT_A1 = 3,
;;   CAIRO_FORMAT_RGB16_565 = 4,
;;   CAIRO_FORMAT_RGB30 = 5,
;; } cairo_format_t;
(define cairo_format_t-enum-nvl
  '((CAIRO_FORMAT_INVALID . -1)
    (CAIRO_FORMAT_ARGB32 . 0)
    (CAIRO_FORMAT_RGB24 . 1)
    (CAIRO_FORMAT_A8 . 2)
    (CAIRO_FORMAT_A1 . 3)
    (CAIRO_FORMAT_RGB16_565 . 4)
    (CAIRO_FORMAT_RGB30 . 5))
  )
(define cairo_format_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_format_t-enum-nvl))
(define-public (unwrap-cairo_format_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_format_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_format_t v)
  (assq-ref cairo_format_t-enum-vnl v))
(define-public unwrap-enum-_cairo_format unwrap-cairo_format_t)
(define-public wrap-enum-_cairo_format wrap-cairo_format_t)

;; enum _cairo_format {
;;   CAIRO_FORMAT_INVALID = -1,
;;   CAIRO_FORMAT_ARGB32 = 0,
;;   CAIRO_FORMAT_RGB24 = 1,
;;   CAIRO_FORMAT_A8 = 2,
;;   CAIRO_FORMAT_A1 = 3,
;;   CAIRO_FORMAT_RGB16_565 = 4,
;;   CAIRO_FORMAT_RGB30 = 5,
;; };

;; typedef cairo_status_t (*cairo_write_func_t)(void *closure, const 
;;     unsigned char *data, unsigned int length);
(define-public cairo_write_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   (fh:pointer uint8)
                   unsigned-int))))
  )
(define-fh-function*-type
  cairo_write_func_t
  cairo_write_func_t-desc
  cairo_write_func_t?
  make-cairo_write_func_t)
(export cairo_write_func_t cairo_write_func_t? make-cairo_write_func_t)

;; typedef cairo_status_t (*cairo_read_func_t)(void *closure, unsigned char *
;;     data, unsigned int length);
(define-public cairo_read_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   (fh:pointer uint8)
                   unsigned-int))))
  )
(define-fh-function*-type
  cairo_read_func_t
  cairo_read_func_t-desc
  cairo_read_func_t?
  make-cairo_read_func_t)
(export cairo_read_func_t cairo_read_func_t? make-cairo_read_func_t)

;; typedef struct _cairo_rectangle_int {
;;   int x, y;
;;   int width, height;
;; } cairo_rectangle_int_t;
(define-public cairo_rectangle_int_t-desc
  (bs:struct
    (list `(x ,int)
          `(y ,int)
          `(width ,int)
          `(height ,int))))
(define-fh-compound-type cairo_rectangle_int_t cairo_rectangle_int_t-desc 
 cairo_rectangle_int_t? make-cairo_rectangle_int_t)
(export cairo_rectangle_int_t cairo_rectangle_int_t? 
 make-cairo_rectangle_int_t)
(define-public cairo_rectangle_int_t*-desc
  (fh:pointer cairo_rectangle_int_t-desc))
(define-fh-pointer-type cairo_rectangle_int_t* cairo_rectangle_int_t*-desc 
 cairo_rectangle_int_t*? make-cairo_rectangle_int_t*)
(export cairo_rectangle_int_t* cairo_rectangle_int_t*? 
 make-cairo_rectangle_int_t*)
(fh-ref<=>deref!
  cairo_rectangle_int_t*
  make-cairo_rectangle_int_t*
  cairo_rectangle_int_t
  make-cairo_rectangle_int_t)
(define-public struct-_cairo_rectangle_int-desc
  cairo_rectangle_int_t-desc)
(define-fh-compound-type struct-_cairo_rectangle_int 
 struct-_cairo_rectangle_int-desc struct-_cairo_rectangle_int? 
 make-struct-_cairo_rectangle_int)
(export struct-_cairo_rectangle_int struct-_cairo_rectangle_int? 
 make-struct-_cairo_rectangle_int)
(define-public struct-_cairo_rectangle_int*-desc
  cairo_rectangle_int_t*-desc)
(define-fh-pointer-type struct-_cairo_rectangle_int* 
 struct-_cairo_rectangle_int*-desc struct-_cairo_rectangle_int*? 
 make-struct-_cairo_rectangle_int*)
(export struct-_cairo_rectangle_int* struct-_cairo_rectangle_int*? 
 make-struct-_cairo_rectangle_int*)
(fh-ref<=>deref!
  struct-_cairo_rectangle_int*
  make-struct-_cairo_rectangle_int*
  struct-_cairo_rectangle_int
  make-struct-_cairo_rectangle_int)

;; cairo_t *cairo_create(cairo_surface_t *target);
(define cairo_create
  (let ((~cairo_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_create"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (target)
      (let ((~target ((fht-unwrap cairo_surface_t*) target)))
        ((fht-wrap cairo_t*)
         ((force ~cairo_create) ~target))))))
(export cairo_create)

;; cairo_t *cairo_reference(cairo_t *cr);
(define cairo_reference
  (let ((~cairo_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_t*)
         ((force ~cairo_reference) ~cr))))))
(export cairo_reference)

;; void cairo_destroy(cairo_t *cr);
(define cairo_destroy
  (let ((~cairo_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_destroy) ~cr)))))
(export cairo_destroy)

;; unsigned int cairo_get_reference_count(cairo_t *cr);
(define cairo_get_reference_count
  (let ((~cairo_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_get_reference_count) ~cr)))))
(export cairo_get_reference_count)

;; void *cairo_get_user_data(cairo_t *cr, const cairo_user_data_key_t *key);
(define cairo_get_user_data
  (let ((~cairo_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr key)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_get_user_data) ~cr ~key)))))
(export cairo_get_user_data)

;; cairo_status_t cairo_set_user_data(cairo_t *cr, const cairo_user_data_key_t 
;;     *key, void *user_data, cairo_destroy_func_t destroy);
(define cairo_set_user_data
  (let ((~cairo_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr key user_data destroy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_set_user_data)
           ~cr
           ~key
           ~user_data
           ~destroy))))))
(export cairo_set_user_data)

;; void cairo_save(cairo_t *cr);
(define cairo_save
  (let ((~cairo_save
          (delay (fh-link-proc
                   ffi:void
                   "cairo_save"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_save) ~cr)))))
(export cairo_save)

;; void cairo_restore(cairo_t *cr);
(define cairo_restore
  (let ((~cairo_restore
          (delay (fh-link-proc
                   ffi:void
                   "cairo_restore"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_restore) ~cr)))))
(export cairo_restore)

;; void cairo_push_group(cairo_t *cr);
(define cairo_push_group
  (let ((~cairo_push_group
          (delay (fh-link-proc
                   ffi:void
                   "cairo_push_group"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_push_group) ~cr)))))
(export cairo_push_group)

;; void cairo_push_group_with_content(cairo_t *cr, cairo_content_t content);
(define cairo_push_group_with_content
  (let ((~cairo_push_group_with_content
          (delay (fh-link-proc
                   ffi:void
                   "cairo_push_group_with_content"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr content)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~content (unwrap-cairo_content_t content)))
        ((force ~cairo_push_group_with_content)
         ~cr
         ~content)))))
(export cairo_push_group_with_content)

;; cairo_pattern_t *cairo_pop_group(cairo_t *cr);
(define cairo_pop_group
  (let ((~cairo_pop_group
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pop_group"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pop_group) ~cr))))))
(export cairo_pop_group)

;; void cairo_pop_group_to_source(cairo_t *cr);
(define cairo_pop_group_to_source
  (let ((~cairo_pop_group_to_source
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pop_group_to_source"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_pop_group_to_source) ~cr)))))
(export cairo_pop_group_to_source)

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
(define cairo_operator_t-enum-nvl
  '((CAIRO_OPERATOR_CLEAR . 0)
    (CAIRO_OPERATOR_SOURCE . 1)
    (CAIRO_OPERATOR_OVER . 2)
    (CAIRO_OPERATOR_IN . 3)
    (CAIRO_OPERATOR_OUT . 4)
    (CAIRO_OPERATOR_ATOP . 5)
    (CAIRO_OPERATOR_DEST . 6)
    (CAIRO_OPERATOR_DEST_OVER . 7)
    (CAIRO_OPERATOR_DEST_IN . 8)
    (CAIRO_OPERATOR_DEST_OUT . 9)
    (CAIRO_OPERATOR_DEST_ATOP . 10)
    (CAIRO_OPERATOR_XOR . 11)
    (CAIRO_OPERATOR_ADD . 12)
    (CAIRO_OPERATOR_SATURATE . 13)
    (CAIRO_OPERATOR_MULTIPLY . 14)
    (CAIRO_OPERATOR_SCREEN . 15)
    (CAIRO_OPERATOR_OVERLAY . 16)
    (CAIRO_OPERATOR_DARKEN . 17)
    (CAIRO_OPERATOR_LIGHTEN . 18)
    (CAIRO_OPERATOR_COLOR_DODGE . 19)
    (CAIRO_OPERATOR_COLOR_BURN . 20)
    (CAIRO_OPERATOR_HARD_LIGHT . 21)
    (CAIRO_OPERATOR_SOFT_LIGHT . 22)
    (CAIRO_OPERATOR_DIFFERENCE . 23)
    (CAIRO_OPERATOR_EXCLUSION . 24)
    (CAIRO_OPERATOR_HSL_HUE . 25)
    (CAIRO_OPERATOR_HSL_SATURATION . 26)
    (CAIRO_OPERATOR_HSL_COLOR . 27)
    (CAIRO_OPERATOR_HSL_LUMINOSITY . 28))
  )
(define cairo_operator_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_operator_t-enum-nvl))
(define-public (unwrap-cairo_operator_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_operator_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_operator_t v)
  (assq-ref cairo_operator_t-enum-vnl v))
(define-public unwrap-enum-_cairo_operator unwrap-cairo_operator_t)
(define-public wrap-enum-_cairo_operator wrap-cairo_operator_t)

;; enum _cairo_operator {
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
;; };

;; void cairo_set_operator(cairo_t *cr, cairo_operator_t op);
(define cairo_set_operator
  (let ((~cairo_set_operator
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_operator"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr op)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~op (unwrap-cairo_operator_t op)))
        ((force ~cairo_set_operator) ~cr ~op)))))
(export cairo_set_operator)

;; void cairo_set_source(cairo_t *cr, cairo_pattern_t *source);
(define cairo_set_source
  (let ((~cairo_set_source
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_source"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr source)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~source ((fht-unwrap cairo_pattern_t*) source)))
        ((force ~cairo_set_source) ~cr ~source)))))
(export cairo_set_source)

;; void cairo_set_source_rgb(cairo_t *cr, double red, double green, double blue
;;     );
(define cairo_set_source_rgb
  (let ((~cairo_set_source_rgb
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_source_rgb"
                   (list ffi-void* ffi:double ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr red green blue)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue)))
        ((force ~cairo_set_source_rgb)
         ~cr
         ~red
         ~green
         ~blue)))))
(export cairo_set_source_rgb)

;; void cairo_set_source_rgba(cairo_t *cr, double red, double green, double 
;;     blue, double alpha);
(define cairo_set_source_rgba
  (let ((~cairo_set_source_rgba
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_source_rgba"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr red green blue alpha)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue))
            (~alpha (unwrap~float alpha)))
        ((force ~cairo_set_source_rgba)
         ~cr
         ~red
         ~green
         ~blue
         ~alpha)))))
(export cairo_set_source_rgba)

;; void cairo_set_source_surface(cairo_t *cr, cairo_surface_t *surface, double 
;;     x, double y);
(define cairo_set_source_surface
  (let ((~cairo_set_source_surface
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_source_surface"
                   (list ffi-void* ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr surface x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_set_source_surface)
         ~cr
         ~surface
         ~x
         ~y)))))
(export cairo_set_source_surface)

;; void cairo_set_tolerance(cairo_t *cr, double tolerance);
(define cairo_set_tolerance
  (let ((~cairo_set_tolerance
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_tolerance"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr tolerance)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~tolerance (unwrap~float tolerance)))
        ((force ~cairo_set_tolerance) ~cr ~tolerance)))))
(export cairo_set_tolerance)

;; typedef enum _cairo_antialias {
;;   CAIRO_ANTIALIAS_DEFAULT,
;;   CAIRO_ANTIALIAS_NONE,
;;   CAIRO_ANTIALIAS_GRAY,
;;   CAIRO_ANTIALIAS_SUBPIXEL,
;;   CAIRO_ANTIALIAS_FAST,
;;   CAIRO_ANTIALIAS_GOOD,
;;   CAIRO_ANTIALIAS_BEST,
;; } cairo_antialias_t;
(define cairo_antialias_t-enum-nvl
  '((CAIRO_ANTIALIAS_DEFAULT . 0)
    (CAIRO_ANTIALIAS_NONE . 1)
    (CAIRO_ANTIALIAS_GRAY . 2)
    (CAIRO_ANTIALIAS_SUBPIXEL . 3)
    (CAIRO_ANTIALIAS_FAST . 4)
    (CAIRO_ANTIALIAS_GOOD . 5)
    (CAIRO_ANTIALIAS_BEST . 6))
  )
(define cairo_antialias_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_antialias_t-enum-nvl))
(define-public (unwrap-cairo_antialias_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_antialias_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_antialias_t v)
  (assq-ref cairo_antialias_t-enum-vnl v))
(define-public unwrap-enum-_cairo_antialias unwrap-cairo_antialias_t)
(define-public wrap-enum-_cairo_antialias wrap-cairo_antialias_t)

;; enum _cairo_antialias {
;;   CAIRO_ANTIALIAS_DEFAULT,
;;   CAIRO_ANTIALIAS_NONE,
;;   CAIRO_ANTIALIAS_GRAY,
;;   CAIRO_ANTIALIAS_SUBPIXEL,
;;   CAIRO_ANTIALIAS_FAST,
;;   CAIRO_ANTIALIAS_GOOD,
;;   CAIRO_ANTIALIAS_BEST,
;; };

;; void cairo_set_antialias(cairo_t *cr, cairo_antialias_t antialias);
(define cairo_set_antialias
  (let ((~cairo_set_antialias
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_antialias"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr antialias)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~antialias (unwrap-cairo_antialias_t antialias)))
        ((force ~cairo_set_antialias) ~cr ~antialias)))))
(export cairo_set_antialias)

;; typedef enum _cairo_fill_rule {
;;   CAIRO_FILL_RULE_WINDING,
;;   CAIRO_FILL_RULE_EVEN_ODD,
;; } cairo_fill_rule_t;
(define cairo_fill_rule_t-enum-nvl
  '((CAIRO_FILL_RULE_WINDING . 0)
    (CAIRO_FILL_RULE_EVEN_ODD . 1))
  )
(define cairo_fill_rule_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_fill_rule_t-enum-nvl))
(define-public (unwrap-cairo_fill_rule_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_fill_rule_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_fill_rule_t v)
  (assq-ref cairo_fill_rule_t-enum-vnl v))
(define-public unwrap-enum-_cairo_fill_rule unwrap-cairo_fill_rule_t)
(define-public wrap-enum-_cairo_fill_rule wrap-cairo_fill_rule_t)

;; enum _cairo_fill_rule {
;;   CAIRO_FILL_RULE_WINDING,
;;   CAIRO_FILL_RULE_EVEN_ODD,
;; };

;; void cairo_set_fill_rule(cairo_t *cr, cairo_fill_rule_t fill_rule);
(define cairo_set_fill_rule
  (let ((~cairo_set_fill_rule
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_fill_rule"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr fill_rule)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~fill_rule (unwrap-cairo_fill_rule_t fill_rule)))
        ((force ~cairo_set_fill_rule) ~cr ~fill_rule)))))
(export cairo_set_fill_rule)

;; void cairo_set_line_width(cairo_t *cr, double width);
(define cairo_set_line_width
  (let ((~cairo_set_line_width
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_line_width"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr width)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~width (unwrap~float width)))
        ((force ~cairo_set_line_width) ~cr ~width)))))
(export cairo_set_line_width)

;; typedef enum _cairo_line_cap {
;;   CAIRO_LINE_CAP_BUTT,
;;   CAIRO_LINE_CAP_ROUND,
;;   CAIRO_LINE_CAP_SQUARE,
;; } cairo_line_cap_t;
(define cairo_line_cap_t-enum-nvl
  '((CAIRO_LINE_CAP_BUTT . 0)
    (CAIRO_LINE_CAP_ROUND . 1)
    (CAIRO_LINE_CAP_SQUARE . 2))
  )
(define cairo_line_cap_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_line_cap_t-enum-nvl))
(define-public (unwrap-cairo_line_cap_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_line_cap_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_line_cap_t v)
  (assq-ref cairo_line_cap_t-enum-vnl v))
(define-public unwrap-enum-_cairo_line_cap unwrap-cairo_line_cap_t)
(define-public wrap-enum-_cairo_line_cap wrap-cairo_line_cap_t)

;; enum _cairo_line_cap {
;;   CAIRO_LINE_CAP_BUTT,
;;   CAIRO_LINE_CAP_ROUND,
;;   CAIRO_LINE_CAP_SQUARE,
;; };

;; void cairo_set_line_cap(cairo_t *cr, cairo_line_cap_t line_cap);
(define cairo_set_line_cap
  (let ((~cairo_set_line_cap
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_line_cap"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr line_cap)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~line_cap (unwrap-cairo_line_cap_t line_cap)))
        ((force ~cairo_set_line_cap) ~cr ~line_cap)))))
(export cairo_set_line_cap)

;; typedef enum _cairo_line_join {
;;   CAIRO_LINE_JOIN_MITER,
;;   CAIRO_LINE_JOIN_ROUND,
;;   CAIRO_LINE_JOIN_BEVEL,
;; } cairo_line_join_t;
(define cairo_line_join_t-enum-nvl
  '((CAIRO_LINE_JOIN_MITER . 0)
    (CAIRO_LINE_JOIN_ROUND . 1)
    (CAIRO_LINE_JOIN_BEVEL . 2))
  )
(define cairo_line_join_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_line_join_t-enum-nvl))
(define-public (unwrap-cairo_line_join_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_line_join_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_line_join_t v)
  (assq-ref cairo_line_join_t-enum-vnl v))
(define-public unwrap-enum-_cairo_line_join unwrap-cairo_line_join_t)
(define-public wrap-enum-_cairo_line_join wrap-cairo_line_join_t)

;; enum _cairo_line_join {
;;   CAIRO_LINE_JOIN_MITER,
;;   CAIRO_LINE_JOIN_ROUND,
;;   CAIRO_LINE_JOIN_BEVEL,
;; };

;; void cairo_set_line_join(cairo_t *cr, cairo_line_join_t line_join);
(define cairo_set_line_join
  (let ((~cairo_set_line_join
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_line_join"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr line_join)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~line_join (unwrap-cairo_line_join_t line_join)))
        ((force ~cairo_set_line_join) ~cr ~line_join)))))
(export cairo_set_line_join)

;; void cairo_set_dash(cairo_t *cr, const double *dashes, int num_dashes, 
;;     double offset);
(define cairo_set_dash
  (let ((~cairo_set_dash
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_dash"
                   (list ffi-void* ffi-void* ffi:int ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dashes num_dashes offset)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dashes (unwrap~pointer dashes))
            (~num_dashes (unwrap~fixed num_dashes))
            (~offset (unwrap~float offset)))
        ((force ~cairo_set_dash)
         ~cr
         ~dashes
         ~num_dashes
         ~offset)))))
(export cairo_set_dash)

;; void cairo_set_miter_limit(cairo_t *cr, double limit);
(define cairo_set_miter_limit
  (let ((~cairo_set_miter_limit
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_miter_limit"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr limit)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~limit (unwrap~float limit)))
        ((force ~cairo_set_miter_limit) ~cr ~limit)))))
(export cairo_set_miter_limit)

;; void cairo_translate(cairo_t *cr, double tx, double ty);
(define cairo_translate
  (let ((~cairo_translate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_translate"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr tx ty)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~tx (unwrap~float tx))
            (~ty (unwrap~float ty)))
        ((force ~cairo_translate) ~cr ~tx ~ty)))))
(export cairo_translate)

;; void cairo_scale(cairo_t *cr, double sx, double sy);
(define cairo_scale
  (let ((~cairo_scale
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scale"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr sx sy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~sx (unwrap~float sx))
            (~sy (unwrap~float sy)))
        ((force ~cairo_scale) ~cr ~sx ~sy)))))
(export cairo_scale)

;; void cairo_rotate(cairo_t *cr, double angle);
(define cairo_rotate
  (let ((~cairo_rotate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rotate"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr angle)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~angle (unwrap~float angle)))
        ((force ~cairo_rotate) ~cr ~angle)))))
(export cairo_rotate)

;; void cairo_transform(cairo_t *cr, const cairo_matrix_t *matrix);
(define cairo_transform
  (let ((~cairo_transform
          (delay (fh-link-proc
                   ffi:void
                   "cairo_transform"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr matrix)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_transform) ~cr ~matrix)))))
(export cairo_transform)

;; void cairo_set_matrix(cairo_t *cr, const cairo_matrix_t *matrix);
(define cairo_set_matrix
  (let ((~cairo_set_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr matrix)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_set_matrix) ~cr ~matrix)))))
(export cairo_set_matrix)

;; void cairo_identity_matrix(cairo_t *cr);
(define cairo_identity_matrix
  (let ((~cairo_identity_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_identity_matrix"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_identity_matrix) ~cr)))))
(export cairo_identity_matrix)

;; void cairo_user_to_device(cairo_t *cr, double *x, double *y);
(define cairo_user_to_device
  (let ((~cairo_user_to_device
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_to_device"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~pointer x))
            (~y (unwrap~pointer y)))
        ((force ~cairo_user_to_device) ~cr ~x ~y)))))
(export cairo_user_to_device)

;; void cairo_user_to_device_distance(cairo_t *cr, double *dx, double *dy);
(define cairo_user_to_device_distance
  (let ((~cairo_user_to_device_distance
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_to_device_distance"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dx dy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dx (unwrap~pointer dx))
            (~dy (unwrap~pointer dy)))
        ((force ~cairo_user_to_device_distance)
         ~cr
         ~dx
         ~dy)))))
(export cairo_user_to_device_distance)

;; void cairo_device_to_user(cairo_t *cr, double *x, double *y);
(define cairo_device_to_user
  (let ((~cairo_device_to_user
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_to_user"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~pointer x))
            (~y (unwrap~pointer y)))
        ((force ~cairo_device_to_user) ~cr ~x ~y)))))
(export cairo_device_to_user)

;; void cairo_device_to_user_distance(cairo_t *cr, double *dx, double *dy);
(define cairo_device_to_user_distance
  (let ((~cairo_device_to_user_distance
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_to_user_distance"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dx dy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dx (unwrap~pointer dx))
            (~dy (unwrap~pointer dy)))
        ((force ~cairo_device_to_user_distance)
         ~cr
         ~dx
         ~dy)))))
(export cairo_device_to_user_distance)

;; void cairo_new_path(cairo_t *cr);
(define cairo_new_path
  (let ((~cairo_new_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_new_path"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_new_path) ~cr)))))
(export cairo_new_path)

;; void cairo_move_to(cairo_t *cr, double x, double y);
(define cairo_move_to
  (let ((~cairo_move_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_move_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_move_to) ~cr ~x ~y)))))
(export cairo_move_to)

;; void cairo_new_sub_path(cairo_t *cr);
(define cairo_new_sub_path
  (let ((~cairo_new_sub_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_new_sub_path"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_new_sub_path) ~cr)))))
(export cairo_new_sub_path)

;; void cairo_line_to(cairo_t *cr, double x, double y);
(define cairo_line_to
  (let ((~cairo_line_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_line_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_line_to) ~cr ~x ~y)))))
(export cairo_line_to)

;; void cairo_curve_to(cairo_t *cr, double x1, double y1, double x2, double y2
;;     , double x3, double y3);
(define cairo_curve_to
  (let ((~cairo_curve_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_curve_to"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x1 y1 x2 y2 x3 y3)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x1 (unwrap~float x1))
            (~y1 (unwrap~float y1))
            (~x2 (unwrap~float x2))
            (~y2 (unwrap~float y2))
            (~x3 (unwrap~float x3))
            (~y3 (unwrap~float y3)))
        ((force ~cairo_curve_to)
         ~cr
         ~x1
         ~y1
         ~x2
         ~y2
         ~x3
         ~y3)))))
(export cairo_curve_to)

;; void cairo_arc(cairo_t *cr, double xc, double yc, double radius, double 
;;     angle1, double angle2);
(define cairo_arc
  (let ((~cairo_arc
          (delay (fh-link-proc
                   ffi:void
                   "cairo_arc"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr xc yc radius angle1 angle2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~xc (unwrap~float xc))
            (~yc (unwrap~float yc))
            (~radius (unwrap~float radius))
            (~angle1 (unwrap~float angle1))
            (~angle2 (unwrap~float angle2)))
        ((force ~cairo_arc)
         ~cr
         ~xc
         ~yc
         ~radius
         ~angle1
         ~angle2)))))
(export cairo_arc)

;; void cairo_arc_negative(cairo_t *cr, double xc, double yc, double radius, 
;;     double angle1, double angle2);
(define cairo_arc_negative
  (let ((~cairo_arc_negative
          (delay (fh-link-proc
                   ffi:void
                   "cairo_arc_negative"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr xc yc radius angle1 angle2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~xc (unwrap~float xc))
            (~yc (unwrap~float yc))
            (~radius (unwrap~float radius))
            (~angle1 (unwrap~float angle1))
            (~angle2 (unwrap~float angle2)))
        ((force ~cairo_arc_negative)
         ~cr
         ~xc
         ~yc
         ~radius
         ~angle1
         ~angle2)))))
(export cairo_arc_negative)

;; void cairo_rel_move_to(cairo_t *cr, double dx, double dy);
(define cairo_rel_move_to
  (let ((~cairo_rel_move_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rel_move_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dx dy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dx (unwrap~float dx))
            (~dy (unwrap~float dy)))
        ((force ~cairo_rel_move_to) ~cr ~dx ~dy)))))
(export cairo_rel_move_to)

;; void cairo_rel_line_to(cairo_t *cr, double dx, double dy);
(define cairo_rel_line_to
  (let ((~cairo_rel_line_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rel_line_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dx dy)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dx (unwrap~float dx))
            (~dy (unwrap~float dy)))
        ((force ~cairo_rel_line_to) ~cr ~dx ~dy)))))
(export cairo_rel_line_to)

;; void cairo_rel_curve_to(cairo_t *cr, double dx1, double dy1, double dx2, 
;;     double dy2, double dx3, double dy3);
(define cairo_rel_curve_to
  (let ((~cairo_rel_curve_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rel_curve_to"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dx1 dy1 dx2 dy2 dx3 dy3)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dx1 (unwrap~float dx1))
            (~dy1 (unwrap~float dy1))
            (~dx2 (unwrap~float dx2))
            (~dy2 (unwrap~float dy2))
            (~dx3 (unwrap~float dx3))
            (~dy3 (unwrap~float dy3)))
        ((force ~cairo_rel_curve_to)
         ~cr
         ~dx1
         ~dy1
         ~dx2
         ~dy2
         ~dx3
         ~dy3)))))
(export cairo_rel_curve_to)

;; void cairo_rectangle(cairo_t *cr, double x, double y, double width, double 
;;     height);
(define cairo_rectangle
  (let ((~cairo_rectangle
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rectangle"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y width height)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y))
            (~width (unwrap~float width))
            (~height (unwrap~float height)))
        ((force ~cairo_rectangle)
         ~cr
         ~x
         ~y
         ~width
         ~height)))))
(export cairo_rectangle)

;; void cairo_close_path(cairo_t *cr);
(define cairo_close_path
  (let ((~cairo_close_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_close_path"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_close_path) ~cr)))))
(export cairo_close_path)

;; void cairo_path_extents(cairo_t *cr, double *x1, double *y1, double *x2, 
;;     double *y2);
(define cairo_path_extents
  (let ((~cairo_path_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_path_extents"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1))
            (~x2 (unwrap~pointer x2))
            (~y2 (unwrap~pointer y2)))
        ((force ~cairo_path_extents) ~cr ~x1 ~y1 ~x2 ~y2)))))
(export cairo_path_extents)

;; void cairo_paint(cairo_t *cr);
(define cairo_paint
  (let ((~cairo_paint
          (delay (fh-link-proc
                   ffi:void
                   "cairo_paint"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_paint) ~cr)))))
(export cairo_paint)

;; void cairo_paint_with_alpha(cairo_t *cr, double alpha);
(define cairo_paint_with_alpha
  (let ((~cairo_paint_with_alpha
          (delay (fh-link-proc
                   ffi:void
                   "cairo_paint_with_alpha"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr alpha)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~alpha (unwrap~float alpha)))
        ((force ~cairo_paint_with_alpha) ~cr ~alpha)))))
(export cairo_paint_with_alpha)

;; void cairo_mask(cairo_t *cr, cairo_pattern_t *pattern);
(define cairo_mask
  (let ((~cairo_mask
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mask"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr pattern)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_mask) ~cr ~pattern)))))
(export cairo_mask)

;; void cairo_mask_surface(cairo_t *cr, cairo_surface_t *surface, double 
;;     surface_x, double surface_y);
(define cairo_mask_surface
  (let ((~cairo_mask_surface
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mask_surface"
                   (list ffi-void* ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr surface surface_x surface_y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~surface_x (unwrap~float surface_x))
            (~surface_y (unwrap~float surface_y)))
        ((force ~cairo_mask_surface)
         ~cr
         ~surface
         ~surface_x
         ~surface_y)))))
(export cairo_mask_surface)

;; void cairo_stroke(cairo_t *cr);
(define cairo_stroke
  (let ((~cairo_stroke
          (delay (fh-link-proc
                   ffi:void
                   "cairo_stroke"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_stroke) ~cr)))))
(export cairo_stroke)

;; void cairo_stroke_preserve(cairo_t *cr);
(define cairo_stroke_preserve
  (let ((~cairo_stroke_preserve
          (delay (fh-link-proc
                   ffi:void
                   "cairo_stroke_preserve"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_stroke_preserve) ~cr)))))
(export cairo_stroke_preserve)

;; void cairo_fill(cairo_t *cr);
(define cairo_fill
  (let ((~cairo_fill
          (delay (fh-link-proc
                   ffi:void
                   "cairo_fill"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_fill) ~cr)))))
(export cairo_fill)

;; void cairo_fill_preserve(cairo_t *cr);
(define cairo_fill_preserve
  (let ((~cairo_fill_preserve
          (delay (fh-link-proc
                   ffi:void
                   "cairo_fill_preserve"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_fill_preserve) ~cr)))))
(export cairo_fill_preserve)

;; void cairo_copy_page(cairo_t *cr);
(define cairo_copy_page
  (let ((~cairo_copy_page
          (delay (fh-link-proc
                   ffi:void
                   "cairo_copy_page"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_copy_page) ~cr)))))
(export cairo_copy_page)

;; void cairo_show_page(cairo_t *cr);
(define cairo_show_page
  (let ((~cairo_show_page
          (delay (fh-link-proc
                   ffi:void
                   "cairo_show_page"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_show_page) ~cr)))))
(export cairo_show_page)

;; cairo_bool_t cairo_in_stroke(cairo_t *cr, double x, double y);
(define cairo_in_stroke
  (let ((~cairo_in_stroke
          (delay (fh-link-proc
                   ffi:int
                   "cairo_in_stroke"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_in_stroke) ~cr ~x ~y)))))
(export cairo_in_stroke)

;; cairo_bool_t cairo_in_fill(cairo_t *cr, double x, double y);
(define cairo_in_fill
  (let ((~cairo_in_fill
          (delay (fh-link-proc
                   ffi:int
                   "cairo_in_fill"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_in_fill) ~cr ~x ~y)))))
(export cairo_in_fill)

;; cairo_bool_t cairo_in_clip(cairo_t *cr, double x, double y);
(define cairo_in_clip
  (let ((~cairo_in_clip
          (delay (fh-link-proc
                   ffi:int
                   "cairo_in_clip"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_in_clip) ~cr ~x ~y)))))
(export cairo_in_clip)

;; void cairo_stroke_extents(cairo_t *cr, double *x1, double *y1, double *x2, 
;;     double *y2);
(define cairo_stroke_extents
  (let ((~cairo_stroke_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_stroke_extents"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1))
            (~x2 (unwrap~pointer x2))
            (~y2 (unwrap~pointer y2)))
        ((force ~cairo_stroke_extents)
         ~cr
         ~x1
         ~y1
         ~x2
         ~y2)))))
(export cairo_stroke_extents)

;; void cairo_fill_extents(cairo_t *cr, double *x1, double *y1, double *x2, 
;;     double *y2);
(define cairo_fill_extents
  (let ((~cairo_fill_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_fill_extents"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1))
            (~x2 (unwrap~pointer x2))
            (~y2 (unwrap~pointer y2)))
        ((force ~cairo_fill_extents) ~cr ~x1 ~y1 ~x2 ~y2)))))
(export cairo_fill_extents)

;; void cairo_reset_clip(cairo_t *cr);
(define cairo_reset_clip
  (let ((~cairo_reset_clip
          (delay (fh-link-proc
                   ffi:void
                   "cairo_reset_clip"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_reset_clip) ~cr)))))
(export cairo_reset_clip)

;; void cairo_clip(cairo_t *cr);
(define cairo_clip
  (let ((~cairo_clip
          (delay (fh-link-proc
                   ffi:void
                   "cairo_clip"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_clip) ~cr)))))
(export cairo_clip)

;; void cairo_clip_preserve(cairo_t *cr);
(define cairo_clip_preserve
  (let ((~cairo_clip_preserve
          (delay (fh-link-proc
                   ffi:void
                   "cairo_clip_preserve"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_clip_preserve) ~cr)))))
(export cairo_clip_preserve)

;; void cairo_clip_extents(cairo_t *cr, double *x1, double *y1, double *x2, 
;;     double *y2);
(define cairo_clip_extents
  (let ((~cairo_clip_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_clip_extents"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x1 y1 x2 y2)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1))
            (~x2 (unwrap~pointer x2))
            (~y2 (unwrap~pointer y2)))
        ((force ~cairo_clip_extents) ~cr ~x1 ~y1 ~x2 ~y2)))))
(export cairo_clip_extents)

;; typedef struct _cairo_rectangle {
;;   double x, y, width, height;
;; } cairo_rectangle_t;
(define-public cairo_rectangle_t-desc
  (bs:struct
    (list `(x ,double)
          `(y ,double)
          `(width ,double)
          `(height ,double))))
(define-fh-compound-type cairo_rectangle_t cairo_rectangle_t-desc 
 cairo_rectangle_t? make-cairo_rectangle_t)
(export cairo_rectangle_t cairo_rectangle_t? make-cairo_rectangle_t)
(define-public cairo_rectangle_t*-desc
  (fh:pointer cairo_rectangle_t-desc))
(define-fh-pointer-type cairo_rectangle_t* cairo_rectangle_t*-desc 
 cairo_rectangle_t*? make-cairo_rectangle_t*)
(export cairo_rectangle_t* cairo_rectangle_t*? make-cairo_rectangle_t*)
(fh-ref<=>deref!
  cairo_rectangle_t*
  make-cairo_rectangle_t*
  cairo_rectangle_t
  make-cairo_rectangle_t)
(define-public struct-_cairo_rectangle-desc
  cairo_rectangle_t-desc)
(define-fh-compound-type struct-_cairo_rectangle struct-_cairo_rectangle-desc 
 struct-_cairo_rectangle? make-struct-_cairo_rectangle)
(export struct-_cairo_rectangle struct-_cairo_rectangle? 
 make-struct-_cairo_rectangle)
(define-public struct-_cairo_rectangle*-desc
  cairo_rectangle_t*-desc)
(define-fh-pointer-type struct-_cairo_rectangle* struct-_cairo_rectangle*-desc
 struct-_cairo_rectangle*? make-struct-_cairo_rectangle*)
(export struct-_cairo_rectangle* struct-_cairo_rectangle*? 
 make-struct-_cairo_rectangle*)
(fh-ref<=>deref!
  struct-_cairo_rectangle*
  make-struct-_cairo_rectangle*
  struct-_cairo_rectangle
  make-struct-_cairo_rectangle)

;; typedef struct _cairo_rectangle_list {
;;   cairo_status_t status;
;;   cairo_rectangle_t *rectangles;
;;   int num_rectangles;
;; } cairo_rectangle_list_t;
(define-public cairo_rectangle_list_t-desc
  (bs:struct
    (list `(status ,int)
          `(rectangles ,cairo_rectangle_t*-desc)
          `(num_rectangles ,int))))
(define-fh-compound-type cairo_rectangle_list_t cairo_rectangle_list_t-desc 
 cairo_rectangle_list_t? make-cairo_rectangle_list_t)
(export cairo_rectangle_list_t cairo_rectangle_list_t? 
 make-cairo_rectangle_list_t)
(define-public cairo_rectangle_list_t*-desc
  (fh:pointer cairo_rectangle_list_t-desc))
(define-fh-pointer-type cairo_rectangle_list_t* cairo_rectangle_list_t*-desc 
 cairo_rectangle_list_t*? make-cairo_rectangle_list_t*)
(export cairo_rectangle_list_t* cairo_rectangle_list_t*? 
 make-cairo_rectangle_list_t*)
(fh-ref<=>deref!
  cairo_rectangle_list_t*
  make-cairo_rectangle_list_t*
  cairo_rectangle_list_t
  make-cairo_rectangle_list_t)
(define-public struct-_cairo_rectangle_list-desc
  cairo_rectangle_list_t-desc)
(define-fh-compound-type struct-_cairo_rectangle_list 
 struct-_cairo_rectangle_list-desc struct-_cairo_rectangle_list? 
 make-struct-_cairo_rectangle_list)
(export struct-_cairo_rectangle_list struct-_cairo_rectangle_list? 
 make-struct-_cairo_rectangle_list)
(define-public struct-_cairo_rectangle_list*-desc
  cairo_rectangle_list_t*-desc)
(define-fh-pointer-type struct-_cairo_rectangle_list* 
 struct-_cairo_rectangle_list*-desc struct-_cairo_rectangle_list*? 
 make-struct-_cairo_rectangle_list*)
(export struct-_cairo_rectangle_list* struct-_cairo_rectangle_list*? 
 make-struct-_cairo_rectangle_list*)
(fh-ref<=>deref!
  struct-_cairo_rectangle_list*
  make-struct-_cairo_rectangle_list*
  struct-_cairo_rectangle_list
  make-struct-_cairo_rectangle_list)

;; cairo_rectangle_list_t *cairo_copy_clip_rectangle_list(cairo_t *cr);
(define cairo_copy_clip_rectangle_list
  (let ((~cairo_copy_clip_rectangle_list
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_copy_clip_rectangle_list"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_rectangle_list_t*)
         ((force ~cairo_copy_clip_rectangle_list) ~cr))))))
(export cairo_copy_clip_rectangle_list)

;; void cairo_rectangle_list_destroy(cairo_rectangle_list_t *rectangle_list);
(define cairo_rectangle_list_destroy
  (let ((~cairo_rectangle_list_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_rectangle_list_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (rectangle_list)
      (let ((~rectangle_list
              ((fht-unwrap cairo_rectangle_list_t*)
               rectangle_list)))
        ((force ~cairo_rectangle_list_destroy)
         ~rectangle_list)))))
(export cairo_rectangle_list_destroy)

;; void cairo_tag_begin(cairo_t *cr, const char *tag_name, const char *
;;     attributes);
(define cairo_tag_begin
  (let ((~cairo_tag_begin
          (delay (fh-link-proc
                   ffi:void
                   "cairo_tag_begin"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr tag_name attributes)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~tag_name (unwrap~pointer tag_name))
            (~attributes (unwrap~pointer attributes)))
        ((force ~cairo_tag_begin)
         ~cr
         ~tag_name
         ~attributes)))))
(export cairo_tag_begin)

;; void cairo_tag_end(cairo_t *cr, const char *tag_name);
(define cairo_tag_end
  (let ((~cairo_tag_end
          (delay (fh-link-proc
                   ffi:void
                   "cairo_tag_end"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr tag_name)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~tag_name (unwrap~pointer tag_name)))
        ((force ~cairo_tag_end) ~cr ~tag_name)))))
(export cairo_tag_end)

;; typedef struct _cairo_scaled_font cairo_scaled_font_t;
(define-public cairo_scaled_font_t-desc 'void)
(define-fh-type-alias cairo_scaled_font_t fh-void)
(define-public cairo_scaled_font_t? fh-void?)
(define-public make-cairo_scaled_font_t make-fh-void)
(define-public cairo_scaled_font_t*-desc (fh:pointer cairo_scaled_font_t-desc))
(define-fh-pointer-type cairo_scaled_font_t* cairo_scaled_font_t*-desc 
 cairo_scaled_font_t*? make-cairo_scaled_font_t*)
(export cairo_scaled_font_t* cairo_scaled_font_t*? make-cairo_scaled_font_t*)

;; typedef struct _cairo_font_face cairo_font_face_t;
(define-public cairo_font_face_t-desc 'void)
(define-fh-type-alias cairo_font_face_t fh-void)
(define-public cairo_font_face_t? fh-void?)
(define-public make-cairo_font_face_t make-fh-void)
(define-public cairo_font_face_t*-desc (fh:pointer cairo_font_face_t-desc))
(define-fh-pointer-type cairo_font_face_t* cairo_font_face_t*-desc 
 cairo_font_face_t*? make-cairo_font_face_t*)
(export cairo_font_face_t* cairo_font_face_t*? make-cairo_font_face_t*)

;; typedef struct {
;;   unsigned long index;
;;   double x;
;;   double y;
;; } cairo_glyph_t;
(define-public cairo_glyph_t-desc
  (bs:struct
    (list `(index ,unsigned-long)
          `(x ,double)
          `(y ,double))))
(define-fh-compound-type cairo_glyph_t cairo_glyph_t-desc cairo_glyph_t? 
 make-cairo_glyph_t)
(export cairo_glyph_t cairo_glyph_t? make-cairo_glyph_t)
(define-public cairo_glyph_t*-desc
  (fh:pointer cairo_glyph_t-desc))
(define-fh-pointer-type cairo_glyph_t* cairo_glyph_t*-desc cairo_glyph_t*? 
 make-cairo_glyph_t*)
(export cairo_glyph_t* cairo_glyph_t*? make-cairo_glyph_t*)
(fh-ref<=>deref!
  cairo_glyph_t*
  make-cairo_glyph_t*
  cairo_glyph_t
  make-cairo_glyph_t)

;; cairo_glyph_t *cairo_glyph_allocate(int num_glyphs);
(define cairo_glyph_allocate
  (let ((~cairo_glyph_allocate
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_glyph_allocate"
                   (list ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (num_glyphs)
      (let ((~num_glyphs (unwrap~fixed num_glyphs)))
        ((fht-wrap cairo_glyph_t*)
         ((force ~cairo_glyph_allocate) ~num_glyphs))))))
(export cairo_glyph_allocate)

;; void cairo_glyph_free(cairo_glyph_t *glyphs);
(define cairo_glyph_free
  (let ((~cairo_glyph_free
          (delay (fh-link-proc
                   ffi:void
                   "cairo_glyph_free"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (glyphs)
      (let ((~glyphs ((fht-unwrap cairo_glyph_t*) glyphs)))
        ((force ~cairo_glyph_free) ~glyphs)))))
(export cairo_glyph_free)

;; typedef struct {
;;   int num_bytes;
;;   int num_glyphs;
;; } cairo_text_cluster_t;
(define-public cairo_text_cluster_t-desc
  (bs:struct
    (list `(num_bytes ,int) `(num_glyphs ,int))))
(define-fh-compound-type cairo_text_cluster_t cairo_text_cluster_t-desc 
 cairo_text_cluster_t? make-cairo_text_cluster_t)
(export cairo_text_cluster_t cairo_text_cluster_t? make-cairo_text_cluster_t)
(define-public cairo_text_cluster_t*-desc
  (fh:pointer cairo_text_cluster_t-desc))
(define-fh-pointer-type cairo_text_cluster_t* cairo_text_cluster_t*-desc 
 cairo_text_cluster_t*? make-cairo_text_cluster_t*)
(export cairo_text_cluster_t* cairo_text_cluster_t*? 
 make-cairo_text_cluster_t*)
(fh-ref<=>deref!
  cairo_text_cluster_t*
  make-cairo_text_cluster_t*
  cairo_text_cluster_t
  make-cairo_text_cluster_t)

;; cairo_text_cluster_t *cairo_text_cluster_allocate(int num_clusters);
(define cairo_text_cluster_allocate
  (let ((~cairo_text_cluster_allocate
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_text_cluster_allocate"
                   (list ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (num_clusters)
      (let ((~num_clusters (unwrap~fixed num_clusters)))
        ((fht-wrap cairo_text_cluster_t*)
         ((force ~cairo_text_cluster_allocate)
          ~num_clusters))))))
(export cairo_text_cluster_allocate)

;; void cairo_text_cluster_free(cairo_text_cluster_t *clusters);
(define cairo_text_cluster_free
  (let ((~cairo_text_cluster_free
          (delay (fh-link-proc
                   ffi:void
                   "cairo_text_cluster_free"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (clusters)
      (let ((~clusters
              ((fht-unwrap cairo_text_cluster_t*) clusters)))
        ((force ~cairo_text_cluster_free) ~clusters)))))
(export cairo_text_cluster_free)

;; typedef enum _cairo_text_cluster_flags {
;;   CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = 0x00000001,
;; } cairo_text_cluster_flags_t;
(define cairo_text_cluster_flags_t-enum-nvl
  '((CAIRO_TEXT_CLUSTER_FLAG_BACKWARD . 1))
  )
(define cairo_text_cluster_flags_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_text_cluster_flags_t-enum-nvl))
(define-public (unwrap-cairo_text_cluster_flags_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_text_cluster_flags_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_text_cluster_flags_t v)
  (assq-ref cairo_text_cluster_flags_t-enum-vnl v))
(define-public unwrap-enum-_cairo_text_cluster_flags unwrap-cairo_text_cluster_flags_t)
(define-public wrap-enum-_cairo_text_cluster_flags wrap-cairo_text_cluster_flags_t)

;; enum _cairo_text_cluster_flags {
;;   CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = 0x00000001,
;; };

;; typedef struct {
;;   double x_bearing;
;;   double y_bearing;
;;   double width;
;;   double height;
;;   double x_advance;
;;   double y_advance;
;; } cairo_text_extents_t;
(define-public cairo_text_extents_t-desc
  (bs:struct
    (list `(x_bearing ,double)
          `(y_bearing ,double)
          `(width ,double)
          `(height ,double)
          `(x_advance ,double)
          `(y_advance ,double))))
(define-fh-compound-type cairo_text_extents_t cairo_text_extents_t-desc 
 cairo_text_extents_t? make-cairo_text_extents_t)
(export cairo_text_extents_t cairo_text_extents_t? make-cairo_text_extents_t)
(define-public cairo_text_extents_t*-desc
  (fh:pointer cairo_text_extents_t-desc))
(define-fh-pointer-type cairo_text_extents_t* cairo_text_extents_t*-desc 
 cairo_text_extents_t*? make-cairo_text_extents_t*)
(export cairo_text_extents_t* cairo_text_extents_t*? 
 make-cairo_text_extents_t*)
(fh-ref<=>deref!
  cairo_text_extents_t*
  make-cairo_text_extents_t*
  cairo_text_extents_t
  make-cairo_text_extents_t)

;; typedef struct {
;;   double ascent;
;;   double descent;
;;   double height;
;;   double max_x_advance;
;;   double max_y_advance;
;; } cairo_font_extents_t;
(define-public cairo_font_extents_t-desc
  (bs:struct
    (list `(ascent ,double)
          `(descent ,double)
          `(height ,double)
          `(max_x_advance ,double)
          `(max_y_advance ,double))))
(define-fh-compound-type cairo_font_extents_t cairo_font_extents_t-desc 
 cairo_font_extents_t? make-cairo_font_extents_t)
(export cairo_font_extents_t cairo_font_extents_t? make-cairo_font_extents_t)
(define-public cairo_font_extents_t*-desc
  (fh:pointer cairo_font_extents_t-desc))
(define-fh-pointer-type cairo_font_extents_t* cairo_font_extents_t*-desc 
 cairo_font_extents_t*? make-cairo_font_extents_t*)
(export cairo_font_extents_t* cairo_font_extents_t*? 
 make-cairo_font_extents_t*)
(fh-ref<=>deref!
  cairo_font_extents_t*
  make-cairo_font_extents_t*
  cairo_font_extents_t
  make-cairo_font_extents_t)

;; typedef enum _cairo_font_slant {
;;   CAIRO_FONT_SLANT_NORMAL,
;;   CAIRO_FONT_SLANT_ITALIC,
;;   CAIRO_FONT_SLANT_OBLIQUE,
;; } cairo_font_slant_t;
(define cairo_font_slant_t-enum-nvl
  '((CAIRO_FONT_SLANT_NORMAL . 0)
    (CAIRO_FONT_SLANT_ITALIC . 1)
    (CAIRO_FONT_SLANT_OBLIQUE . 2))
  )
(define cairo_font_slant_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_font_slant_t-enum-nvl))
(define-public (unwrap-cairo_font_slant_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_font_slant_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_font_slant_t v)
  (assq-ref cairo_font_slant_t-enum-vnl v))
(define-public unwrap-enum-_cairo_font_slant unwrap-cairo_font_slant_t)
(define-public wrap-enum-_cairo_font_slant wrap-cairo_font_slant_t)

;; enum _cairo_font_slant {
;;   CAIRO_FONT_SLANT_NORMAL,
;;   CAIRO_FONT_SLANT_ITALIC,
;;   CAIRO_FONT_SLANT_OBLIQUE,
;; };

;; typedef enum _cairo_font_weight {
;;   CAIRO_FONT_WEIGHT_NORMAL,
;;   CAIRO_FONT_WEIGHT_BOLD,
;; } cairo_font_weight_t;
(define cairo_font_weight_t-enum-nvl
  '((CAIRO_FONT_WEIGHT_NORMAL . 0)
    (CAIRO_FONT_WEIGHT_BOLD . 1))
  )
(define cairo_font_weight_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_font_weight_t-enum-nvl))
(define-public (unwrap-cairo_font_weight_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_font_weight_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_font_weight_t v)
  (assq-ref cairo_font_weight_t-enum-vnl v))
(define-public unwrap-enum-_cairo_font_weight unwrap-cairo_font_weight_t)
(define-public wrap-enum-_cairo_font_weight wrap-cairo_font_weight_t)

;; enum _cairo_font_weight {
;;   CAIRO_FONT_WEIGHT_NORMAL,
;;   CAIRO_FONT_WEIGHT_BOLD,
;; };

;; typedef enum _cairo_subpixel_order {
;;   CAIRO_SUBPIXEL_ORDER_DEFAULT,
;;   CAIRO_SUBPIXEL_ORDER_RGB,
;;   CAIRO_SUBPIXEL_ORDER_BGR,
;;   CAIRO_SUBPIXEL_ORDER_VRGB,
;;   CAIRO_SUBPIXEL_ORDER_VBGR,
;; } cairo_subpixel_order_t;
(define cairo_subpixel_order_t-enum-nvl
  '((CAIRO_SUBPIXEL_ORDER_DEFAULT . 0)
    (CAIRO_SUBPIXEL_ORDER_RGB . 1)
    (CAIRO_SUBPIXEL_ORDER_BGR . 2)
    (CAIRO_SUBPIXEL_ORDER_VRGB . 3)
    (CAIRO_SUBPIXEL_ORDER_VBGR . 4))
  )
(define cairo_subpixel_order_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_subpixel_order_t-enum-nvl))
(define-public (unwrap-cairo_subpixel_order_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_subpixel_order_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_subpixel_order_t v)
  (assq-ref cairo_subpixel_order_t-enum-vnl v))
(define-public unwrap-enum-_cairo_subpixel_order unwrap-cairo_subpixel_order_t)
(define-public wrap-enum-_cairo_subpixel_order wrap-cairo_subpixel_order_t)

;; enum _cairo_subpixel_order {
;;   CAIRO_SUBPIXEL_ORDER_DEFAULT,
;;   CAIRO_SUBPIXEL_ORDER_RGB,
;;   CAIRO_SUBPIXEL_ORDER_BGR,
;;   CAIRO_SUBPIXEL_ORDER_VRGB,
;;   CAIRO_SUBPIXEL_ORDER_VBGR,
;; };

;; typedef enum _cairo_hint_style {
;;   CAIRO_HINT_STYLE_DEFAULT,
;;   CAIRO_HINT_STYLE_NONE,
;;   CAIRO_HINT_STYLE_SLIGHT,
;;   CAIRO_HINT_STYLE_MEDIUM,
;;   CAIRO_HINT_STYLE_FULL,
;; } cairo_hint_style_t;
(define cairo_hint_style_t-enum-nvl
  '((CAIRO_HINT_STYLE_DEFAULT . 0)
    (CAIRO_HINT_STYLE_NONE . 1)
    (CAIRO_HINT_STYLE_SLIGHT . 2)
    (CAIRO_HINT_STYLE_MEDIUM . 3)
    (CAIRO_HINT_STYLE_FULL . 4))
  )
(define cairo_hint_style_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_hint_style_t-enum-nvl))
(define-public (unwrap-cairo_hint_style_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_hint_style_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_hint_style_t v)
  (assq-ref cairo_hint_style_t-enum-vnl v))
(define-public unwrap-enum-_cairo_hint_style unwrap-cairo_hint_style_t)
(define-public wrap-enum-_cairo_hint_style wrap-cairo_hint_style_t)

;; enum _cairo_hint_style {
;;   CAIRO_HINT_STYLE_DEFAULT,
;;   CAIRO_HINT_STYLE_NONE,
;;   CAIRO_HINT_STYLE_SLIGHT,
;;   CAIRO_HINT_STYLE_MEDIUM,
;;   CAIRO_HINT_STYLE_FULL,
;; };

;; typedef enum _cairo_hint_metrics {
;;   CAIRO_HINT_METRICS_DEFAULT,
;;   CAIRO_HINT_METRICS_OFF,
;;   CAIRO_HINT_METRICS_ON,
;; } cairo_hint_metrics_t;
(define cairo_hint_metrics_t-enum-nvl
  '((CAIRO_HINT_METRICS_DEFAULT . 0)
    (CAIRO_HINT_METRICS_OFF . 1)
    (CAIRO_HINT_METRICS_ON . 2))
  )
(define cairo_hint_metrics_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_hint_metrics_t-enum-nvl))
(define-public (unwrap-cairo_hint_metrics_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_hint_metrics_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_hint_metrics_t v)
  (assq-ref cairo_hint_metrics_t-enum-vnl v))
(define-public unwrap-enum-_cairo_hint_metrics unwrap-cairo_hint_metrics_t)
(define-public wrap-enum-_cairo_hint_metrics wrap-cairo_hint_metrics_t)

;; enum _cairo_hint_metrics {
;;   CAIRO_HINT_METRICS_DEFAULT,
;;   CAIRO_HINT_METRICS_OFF,
;;   CAIRO_HINT_METRICS_ON,
;; };

;; typedef struct _cairo_font_options cairo_font_options_t;
(define-public cairo_font_options_t-desc 'void)
(define-fh-type-alias cairo_font_options_t fh-void)
(define-public cairo_font_options_t? fh-void?)
(define-public make-cairo_font_options_t make-fh-void)
(define-public cairo_font_options_t*-desc (fh:pointer cairo_font_options_t-desc))
(define-fh-pointer-type cairo_font_options_t* cairo_font_options_t*-desc 
 cairo_font_options_t*? make-cairo_font_options_t*)
(export cairo_font_options_t* cairo_font_options_t*? 
 make-cairo_font_options_t*)

;; cairo_font_options_t *cairo_font_options_create(void );
(define cairo_font_options_create
  (let ((~cairo_font_options_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_font_options_create"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let ()
        ((fht-wrap cairo_font_options_t*)
         ((force ~cairo_font_options_create)))))))
(export cairo_font_options_create)

;; cairo_font_options_t *cairo_font_options_copy(const cairo_font_options_t *
;;     original);
(define cairo_font_options_copy
  (let ((~cairo_font_options_copy
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_font_options_copy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (original)
      (let ((~original
              ((fht-unwrap cairo_font_options_t*) original)))
        ((fht-wrap cairo_font_options_t*)
         ((force ~cairo_font_options_copy) ~original))))))
(export cairo_font_options_copy)

;; void cairo_font_options_destroy(cairo_font_options_t *options);
(define cairo_font_options_destroy
  (let ((~cairo_font_options_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_font_options_destroy) ~options)))))
(export cairo_font_options_destroy)

;; cairo_status_t cairo_font_options_status(cairo_font_options_t *options);
(define cairo_font_options_status
  (let ((~cairo_font_options_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        (wrap-cairo_status_t
          ((force ~cairo_font_options_status) ~options))))))
(export cairo_font_options_status)

;; void cairo_font_options_merge(cairo_font_options_t *options, const 
;;     cairo_font_options_t *other);
(define cairo_font_options_merge
  (let ((~cairo_font_options_merge
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_merge"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options other)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~other
              ((fht-unwrap cairo_font_options_t*) other)))
        ((force ~cairo_font_options_merge)
         ~options
         ~other)))))
(export cairo_font_options_merge)

;; cairo_bool_t cairo_font_options_equal(const cairo_font_options_t *options, 
;;     const cairo_font_options_t *other);
(define cairo_font_options_equal
  (let ((~cairo_font_options_equal
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_equal"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options other)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~other
              ((fht-unwrap cairo_font_options_t*) other)))
        ((force ~cairo_font_options_equal)
         ~options
         ~other)))))
(export cairo_font_options_equal)

;; unsigned long cairo_font_options_hash(const cairo_font_options_t *options);
(define cairo_font_options_hash
  (let ((~cairo_font_options_hash
          (delay (fh-link-proc
                   ffi:unsigned-long
                   "cairo_font_options_hash"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_font_options_hash) ~options)))))
(export cairo_font_options_hash)

;; void cairo_font_options_set_antialias(cairo_font_options_t *options, 
;;     cairo_antialias_t antialias);
(define cairo_font_options_set_antialias
  (let ((~cairo_font_options_set_antialias
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_set_antialias"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (options antialias)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~antialias (unwrap-cairo_antialias_t antialias)))
        ((force ~cairo_font_options_set_antialias)
         ~options
         ~antialias)))))
(export cairo_font_options_set_antialias)

;; cairo_antialias_t cairo_font_options_get_antialias(const 
;;     cairo_font_options_t *options);
(define cairo_font_options_get_antialias
  (let ((~cairo_font_options_get_antialias
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_get_antialias"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        (wrap-cairo_antialias_t
          ((force ~cairo_font_options_get_antialias)
           ~options))))))
(export cairo_font_options_get_antialias)

;; void cairo_font_options_set_subpixel_order(cairo_font_options_t *options, 
;;     cairo_subpixel_order_t subpixel_order);
(define cairo_font_options_set_subpixel_order
  (let ((~cairo_font_options_set_subpixel_order
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_set_subpixel_order"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (options subpixel_order)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~subpixel_order
              (unwrap-cairo_subpixel_order_t subpixel_order)))
        ((force ~cairo_font_options_set_subpixel_order)
         ~options
         ~subpixel_order)))))
(export cairo_font_options_set_subpixel_order)

;; cairo_subpixel_order_t cairo_font_options_get_subpixel_order(const 
;;     cairo_font_options_t *options);
(define cairo_font_options_get_subpixel_order
  (let ((~cairo_font_options_get_subpixel_order
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_get_subpixel_order"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        (wrap-cairo_subpixel_order_t
          ((force ~cairo_font_options_get_subpixel_order)
           ~options))))))
(export cairo_font_options_get_subpixel_order)

;; void cairo_font_options_set_hint_style(cairo_font_options_t *options, 
;;     cairo_hint_style_t hint_style);
(define cairo_font_options_set_hint_style
  (let ((~cairo_font_options_set_hint_style
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_set_hint_style"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (options hint_style)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~hint_style
              (unwrap-cairo_hint_style_t hint_style)))
        ((force ~cairo_font_options_set_hint_style)
         ~options
         ~hint_style)))))
(export cairo_font_options_set_hint_style)

;; cairo_hint_style_t cairo_font_options_get_hint_style(const 
;;     cairo_font_options_t *options);
(define cairo_font_options_get_hint_style
  (let ((~cairo_font_options_get_hint_style
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_get_hint_style"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        (wrap-cairo_hint_style_t
          ((force ~cairo_font_options_get_hint_style)
           ~options))))))
(export cairo_font_options_get_hint_style)

;; void cairo_font_options_set_hint_metrics(cairo_font_options_t *options, 
;;     cairo_hint_metrics_t hint_metrics);
(define cairo_font_options_set_hint_metrics
  (let ((~cairo_font_options_set_hint_metrics
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_set_hint_metrics"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (options hint_metrics)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~hint_metrics
              (unwrap-cairo_hint_metrics_t hint_metrics)))
        ((force ~cairo_font_options_set_hint_metrics)
         ~options
         ~hint_metrics)))))
(export cairo_font_options_set_hint_metrics)

;; cairo_hint_metrics_t cairo_font_options_get_hint_metrics(const 
;;     cairo_font_options_t *options);
(define cairo_font_options_get_hint_metrics
  (let ((~cairo_font_options_get_hint_metrics
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_options_get_hint_metrics"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        (wrap-cairo_hint_metrics_t
          ((force ~cairo_font_options_get_hint_metrics)
           ~options))))))
(export cairo_font_options_get_hint_metrics)

;; const char *cairo_font_options_get_variations(cairo_font_options_t *options)
;;     ;
(define cairo_font_options_get_variations
  (let ((~cairo_font_options_get_variations
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_font_options_get_variations"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_font_options_get_variations)
         ~options)))))
(export cairo_font_options_get_variations)

;; void cairo_font_options_set_variations(cairo_font_options_t *options, const 
;;     char *variations);
(define cairo_font_options_set_variations
  (let ((~cairo_font_options_set_variations
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_options_set_variations"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (options variations)
      (let ((~options
              ((fht-unwrap cairo_font_options_t*) options))
            (~variations (unwrap~pointer variations)))
        ((force ~cairo_font_options_set_variations)
         ~options
         ~variations)))))
(export cairo_font_options_set_variations)

;; void cairo_select_font_face(cairo_t *cr, const char *family, 
;;     cairo_font_slant_t slant, cairo_font_weight_t weight);
(define cairo_select_font_face
  (let ((~cairo_select_font_face
          (delay (fh-link-proc
                   ffi:void
                   "cairo_select_font_face"
                   (list ffi-void* ffi-void* ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr family slant weight)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~family (unwrap~pointer family))
            (~slant (unwrap-cairo_font_slant_t slant))
            (~weight (unwrap-cairo_font_weight_t weight)))
        ((force ~cairo_select_font_face)
         ~cr
         ~family
         ~slant
         ~weight)))))
(export cairo_select_font_face)

;; void cairo_set_font_size(cairo_t *cr, double size);
(define cairo_set_font_size
  (let ((~cairo_set_font_size
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_font_size"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cr size)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~size (unwrap~float size)))
        ((force ~cairo_set_font_size) ~cr ~size)))))
(export cairo_set_font_size)

;; void cairo_set_font_matrix(cairo_t *cr, const cairo_matrix_t *matrix);
(define cairo_set_font_matrix
  (let ((~cairo_set_font_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_font_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr matrix)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_set_font_matrix) ~cr ~matrix)))))
(export cairo_set_font_matrix)

;; void cairo_get_font_matrix(cairo_t *cr, cairo_matrix_t *matrix);
(define cairo_get_font_matrix
  (let ((~cairo_get_font_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_get_font_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr matrix)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_get_font_matrix) ~cr ~matrix)))))
(export cairo_get_font_matrix)

;; void cairo_set_font_options(cairo_t *cr, const cairo_font_options_t *options
;;     );
(define cairo_set_font_options
  (let ((~cairo_set_font_options
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_font_options"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr options)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_set_font_options) ~cr ~options)))))
(export cairo_set_font_options)

;; void cairo_get_font_options(cairo_t *cr, cairo_font_options_t *options);
(define cairo_get_font_options
  (let ((~cairo_get_font_options
          (delay (fh-link-proc
                   ffi:void
                   "cairo_get_font_options"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr options)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_get_font_options) ~cr ~options)))))
(export cairo_get_font_options)

;; void cairo_set_font_face(cairo_t *cr, cairo_font_face_t *font_face);
(define cairo_set_font_face
  (let ((~cairo_set_font_face
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_font_face"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr font_face)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((force ~cairo_set_font_face) ~cr ~font_face)))))
(export cairo_set_font_face)

;; cairo_font_face_t *cairo_get_font_face(cairo_t *cr);
(define cairo_get_font_face
  (let ((~cairo_get_font_face
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_font_face"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_font_face_t*)
         ((force ~cairo_get_font_face) ~cr))))))
(export cairo_get_font_face)

;; void cairo_set_scaled_font(cairo_t *cr, const cairo_scaled_font_t *
;;     scaled_font);
(define cairo_set_scaled_font
  (let ((~cairo_set_scaled_font
          (delay (fh-link-proc
                   ffi:void
                   "cairo_set_scaled_font"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr scaled_font)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        ((force ~cairo_set_scaled_font) ~cr ~scaled_font)))))
(export cairo_set_scaled_font)

;; cairo_scaled_font_t *cairo_get_scaled_font(cairo_t *cr);
(define cairo_get_scaled_font
  (let ((~cairo_get_scaled_font
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_scaled_font"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_scaled_font_t*)
         ((force ~cairo_get_scaled_font) ~cr))))))
(export cairo_get_scaled_font)

;; void cairo_show_text(cairo_t *cr, const char *utf8);
(define cairo_show_text
  (let ((~cairo_show_text
          (delay (fh-link-proc
                   ffi:void
                   "cairo_show_text"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr utf8)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~utf8 (unwrap~pointer utf8)))
        ((force ~cairo_show_text) ~cr ~utf8)))))
(export cairo_show_text)

;; void cairo_show_glyphs(cairo_t *cr, const cairo_glyph_t *glyphs, int 
;;     num_glyphs);
(define cairo_show_glyphs
  (let ((~cairo_show_glyphs
          (delay (fh-link-proc
                   ffi:void
                   "cairo_show_glyphs"
                   (list ffi-void* ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr glyphs num_glyphs)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~glyphs ((fht-unwrap cairo_glyph_t*) glyphs))
            (~num_glyphs (unwrap~fixed num_glyphs)))
        ((force ~cairo_show_glyphs)
         ~cr
         ~glyphs
         ~num_glyphs)))))
(export cairo_show_glyphs)

;; void cairo_show_text_glyphs(cairo_t *cr, const char *utf8, int utf8_len, 
;;     const cairo_glyph_t *glyphs, int num_glyphs, const cairo_text_cluster_t 
;;     *clusters, int num_clusters, cairo_text_cluster_flags_t cluster_flags);
(define cairo_show_text_glyphs
  (let ((~cairo_show_text_glyphs
          (delay (fh-link-proc
                   ffi:void
                   "cairo_show_text_glyphs"
                   (list ffi-void*
                         ffi-void*
                         ffi:int
                         ffi-void*
                         ffi:int
                         ffi-void*
                         ffi:int
                         ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr
             utf8
             utf8_len
             glyphs
             num_glyphs
             clusters
             num_clusters
             cluster_flags)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~utf8 (unwrap~pointer utf8))
            (~utf8_len (unwrap~fixed utf8_len))
            (~glyphs ((fht-unwrap cairo_glyph_t*) glyphs))
            (~num_glyphs (unwrap~fixed num_glyphs))
            (~clusters
              ((fht-unwrap cairo_text_cluster_t*) clusters))
            (~num_clusters (unwrap~fixed num_clusters))
            (~cluster_flags
              (unwrap-cairo_text_cluster_flags_t cluster_flags)))
        ((force ~cairo_show_text_glyphs)
         ~cr
         ~utf8
         ~utf8_len
         ~glyphs
         ~num_glyphs
         ~clusters
         ~num_clusters
         ~cluster_flags)))))
(export cairo_show_text_glyphs)

;; void cairo_text_path(cairo_t *cr, const char *utf8);
(define cairo_text_path
  (let ((~cairo_text_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_text_path"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr utf8)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~utf8 (unwrap~pointer utf8)))
        ((force ~cairo_text_path) ~cr ~utf8)))))
(export cairo_text_path)

;; void cairo_glyph_path(cairo_t *cr, const cairo_glyph_t *glyphs, int 
;;     num_glyphs);
(define cairo_glyph_path
  (let ((~cairo_glyph_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_glyph_path"
                   (list ffi-void* ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (cr glyphs num_glyphs)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~glyphs ((fht-unwrap cairo_glyph_t*) glyphs))
            (~num_glyphs (unwrap~fixed num_glyphs)))
        ((force ~cairo_glyph_path)
         ~cr
         ~glyphs
         ~num_glyphs)))))
(export cairo_glyph_path)

;; void cairo_text_extents(cairo_t *cr, const char *utf8, cairo_text_extents_t 
;;     *extents);
(define cairo_text_extents
  (let ((~cairo_text_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_text_extents"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr utf8 extents)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~utf8 (unwrap~pointer utf8))
            (~extents
              ((fht-unwrap cairo_text_extents_t*) extents)))
        ((force ~cairo_text_extents) ~cr ~utf8 ~extents)))))
(export cairo_text_extents)

;; void cairo_glyph_extents(cairo_t *cr, const cairo_glyph_t *glyphs, int 
;;     num_glyphs, cairo_text_extents_t *extents);
(define cairo_glyph_extents
  (let ((~cairo_glyph_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_glyph_extents"
                   (list ffi-void* ffi-void* ffi:int ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr glyphs num_glyphs extents)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~glyphs ((fht-unwrap cairo_glyph_t*) glyphs))
            (~num_glyphs (unwrap~fixed num_glyphs))
            (~extents
              ((fht-unwrap cairo_text_extents_t*) extents)))
        ((force ~cairo_glyph_extents)
         ~cr
         ~glyphs
         ~num_glyphs
         ~extents)))))
(export cairo_glyph_extents)

;; void cairo_font_extents(cairo_t *cr, cairo_font_extents_t *extents);
(define cairo_font_extents
  (let ((~cairo_font_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_extents"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr extents)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~extents
              ((fht-unwrap cairo_font_extents_t*) extents)))
        ((force ~cairo_font_extents) ~cr ~extents)))))
(export cairo_font_extents)

;; cairo_font_face_t *cairo_font_face_reference(cairo_font_face_t *font_face);
(define cairo_font_face_reference
  (let ((~cairo_font_face_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_font_face_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((fht-wrap cairo_font_face_t*)
         ((force ~cairo_font_face_reference) ~font_face))))))
(export cairo_font_face_reference)

;; void cairo_font_face_destroy(cairo_font_face_t *font_face);
(define cairo_font_face_destroy
  (let ((~cairo_font_face_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_font_face_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((force ~cairo_font_face_destroy) ~font_face)))))
(export cairo_font_face_destroy)

;; unsigned int cairo_font_face_get_reference_count(cairo_font_face_t *
;;     font_face);
(define cairo_font_face_get_reference_count
  (let ((~cairo_font_face_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_font_face_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((force ~cairo_font_face_get_reference_count)
         ~font_face)))))
(export cairo_font_face_get_reference_count)

;; cairo_status_t cairo_font_face_status(cairo_font_face_t *font_face);
(define cairo_font_face_status
  (let ((~cairo_font_face_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_face_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        (wrap-cairo_status_t
          ((force ~cairo_font_face_status) ~font_face))))))
(export cairo_font_face_status)

;; typedef enum _cairo_font_type {
;;   CAIRO_FONT_TYPE_TOY,
;;   CAIRO_FONT_TYPE_FT,
;;   CAIRO_FONT_TYPE_WIN32,
;;   CAIRO_FONT_TYPE_QUARTZ,
;;   CAIRO_FONT_TYPE_USER,
;; } cairo_font_type_t;
(define cairo_font_type_t-enum-nvl
  '((CAIRO_FONT_TYPE_TOY . 0)
    (CAIRO_FONT_TYPE_FT . 1)
    (CAIRO_FONT_TYPE_WIN32 . 2)
    (CAIRO_FONT_TYPE_QUARTZ . 3)
    (CAIRO_FONT_TYPE_USER . 4))
  )
(define cairo_font_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_font_type_t-enum-nvl))
(define-public (unwrap-cairo_font_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_font_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_font_type_t v)
  (assq-ref cairo_font_type_t-enum-vnl v))
(define-public unwrap-enum-_cairo_font_type unwrap-cairo_font_type_t)
(define-public wrap-enum-_cairo_font_type wrap-cairo_font_type_t)

;; enum _cairo_font_type {
;;   CAIRO_FONT_TYPE_TOY,
;;   CAIRO_FONT_TYPE_FT,
;;   CAIRO_FONT_TYPE_WIN32,
;;   CAIRO_FONT_TYPE_QUARTZ,
;;   CAIRO_FONT_TYPE_USER,
;; };

;; cairo_font_type_t cairo_font_face_get_type(cairo_font_face_t *font_face);
(define cairo_font_face_get_type
  (let ((~cairo_font_face_get_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_face_get_type"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        (wrap-cairo_font_type_t
          ((force ~cairo_font_face_get_type) ~font_face))))))
(export cairo_font_face_get_type)

;; void *cairo_font_face_get_user_data(cairo_font_face_t *font_face, const 
;;     cairo_user_data_key_t *key);
(define cairo_font_face_get_user_data
  (let ((~cairo_font_face_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_font_face_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face key)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_font_face_get_user_data)
         ~font_face
         ~key)))))
(export cairo_font_face_get_user_data)

;; cairo_status_t cairo_font_face_set_user_data(cairo_font_face_t *font_face, 
;;     const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define cairo_font_face_set_user_data
  (let ((~cairo_font_face_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_font_face_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face key user_data destroy)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_font_face_set_user_data)
           ~font_face
           ~key
           ~user_data
           ~destroy))))))
(export cairo_font_face_set_user_data)

;; cairo_scaled_font_t *cairo_scaled_font_create(cairo_font_face_t *font_face, 
;;     const cairo_matrix_t *font_matrix, const cairo_matrix_t *ctm, const 
;;     cairo_font_options_t *options);
(define cairo_scaled_font_create
  (let ((~cairo_scaled_font_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_scaled_font_create"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face font_matrix ctm options)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~font_matrix
              ((fht-unwrap cairo_matrix_t*) font_matrix))
            (~ctm ((fht-unwrap cairo_matrix_t*) ctm))
            (~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((fht-wrap cairo_scaled_font_t*)
         ((force ~cairo_scaled_font_create)
          ~font_face
          ~font_matrix
          ~ctm
          ~options))))))
(export cairo_scaled_font_create)

;; cairo_scaled_font_t *cairo_scaled_font_reference(cairo_scaled_font_t *
;;     scaled_font);
(define cairo_scaled_font_reference
  (let ((~cairo_scaled_font_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_scaled_font_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        ((fht-wrap cairo_scaled_font_t*)
         ((force ~cairo_scaled_font_reference)
          ~scaled_font))))))
(export cairo_scaled_font_reference)

;; void cairo_scaled_font_destroy(cairo_scaled_font_t *scaled_font);
(define cairo_scaled_font_destroy
  (let ((~cairo_scaled_font_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        ((force ~cairo_scaled_font_destroy) ~scaled_font)))))
(export cairo_scaled_font_destroy)

;; unsigned int cairo_scaled_font_get_reference_count(cairo_scaled_font_t *
;;     scaled_font);
(define cairo_scaled_font_get_reference_count
  (let ((~cairo_scaled_font_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_scaled_font_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        ((force ~cairo_scaled_font_get_reference_count)
         ~scaled_font)))))
(export cairo_scaled_font_get_reference_count)

;; cairo_status_t cairo_scaled_font_status(cairo_scaled_font_t *scaled_font);
(define cairo_scaled_font_status
  (let ((~cairo_scaled_font_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_scaled_font_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        (wrap-cairo_status_t
          ((force ~cairo_scaled_font_status) ~scaled_font))))))
(export cairo_scaled_font_status)

;; cairo_font_type_t cairo_scaled_font_get_type(cairo_scaled_font_t *
;;     scaled_font);
(define cairo_scaled_font_get_type
  (let ((~cairo_scaled_font_get_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_scaled_font_get_type"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        (wrap-cairo_font_type_t
          ((force ~cairo_scaled_font_get_type)
           ~scaled_font))))))
(export cairo_scaled_font_get_type)

;; void *cairo_scaled_font_get_user_data(cairo_scaled_font_t *scaled_font, 
;;     const cairo_user_data_key_t *key);
(define cairo_scaled_font_get_user_data
  (let ((~cairo_scaled_font_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_scaled_font_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font key)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_scaled_font_get_user_data)
         ~scaled_font
         ~key)))))
(export cairo_scaled_font_get_user_data)

;; cairo_status_t cairo_scaled_font_set_user_data(cairo_scaled_font_t *
;;     scaled_font, const cairo_user_data_key_t *key, void *user_data, 
;;     cairo_destroy_func_t destroy);
(define cairo_scaled_font_set_user_data
  (let ((~cairo_scaled_font_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_scaled_font_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font key user_data destroy)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_scaled_font_set_user_data)
           ~scaled_font
           ~key
           ~user_data
           ~destroy))))))
(export cairo_scaled_font_set_user_data)

;; void cairo_scaled_font_extents(cairo_scaled_font_t *scaled_font, 
;;     cairo_font_extents_t *extents);
(define cairo_scaled_font_extents
  (let ((~cairo_scaled_font_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_extents"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font extents)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~extents
              ((fht-unwrap cairo_font_extents_t*) extents)))
        ((force ~cairo_scaled_font_extents)
         ~scaled_font
         ~extents)))))
(export cairo_scaled_font_extents)

;; void cairo_scaled_font_text_extents(cairo_scaled_font_t *scaled_font, const 
;;     char *utf8, cairo_text_extents_t *extents);
(define cairo_scaled_font_text_extents
  (let ((~cairo_scaled_font_text_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_text_extents"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font utf8 extents)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~utf8 (unwrap~pointer utf8))
            (~extents
              ((fht-unwrap cairo_text_extents_t*) extents)))
        ((force ~cairo_scaled_font_text_extents)
         ~scaled_font
         ~utf8
         ~extents)))))
(export cairo_scaled_font_text_extents)

;; void cairo_scaled_font_glyph_extents(cairo_scaled_font_t *scaled_font, const
;;      cairo_glyph_t *glyphs, int num_glyphs, cairo_text_extents_t *extents);
(define cairo_scaled_font_glyph_extents
  (let ((~cairo_scaled_font_glyph_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_glyph_extents"
                   (list ffi-void* ffi-void* ffi:int ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font glyphs num_glyphs extents)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~glyphs ((fht-unwrap cairo_glyph_t*) glyphs))
            (~num_glyphs (unwrap~fixed num_glyphs))
            (~extents
              ((fht-unwrap cairo_text_extents_t*) extents)))
        ((force ~cairo_scaled_font_glyph_extents)
         ~scaled_font
         ~glyphs
         ~num_glyphs
         ~extents)))))
(export cairo_scaled_font_glyph_extents)

;; cairo_status_t cairo_scaled_font_text_to_glyphs(cairo_scaled_font_t *
;;     scaled_font, double x, double y, const char *utf8, int utf8_len, 
;;     cairo_glyph_t **glyphs, int *num_glyphs, cairo_text_cluster_t **clusters
;;     , int *num_clusters, cairo_text_cluster_flags_t *cluster_flags);
(define cairo_scaled_font_text_to_glyphs
  (let ((~cairo_scaled_font_text_to_glyphs
          (delay (fh-link-proc
                   ffi:int
                   "cairo_scaled_font_text_to_glyphs"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi-void*
                         ffi:int
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
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
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~x (unwrap~float x))
            (~y (unwrap~float y))
            (~utf8 (unwrap~pointer utf8))
            (~utf8_len (unwrap~fixed utf8_len))
            (~glyphs (unwrap~pointer glyphs))
            (~num_glyphs (unwrap~pointer num_glyphs))
            (~clusters (unwrap~pointer clusters))
            (~num_clusters (unwrap~pointer num_clusters)))
        (wrap-cairo_status_t
          ((force ~cairo_scaled_font_text_to_glyphs)
           ~scaled_font
           ~x
           ~y
           ~utf8
           ~utf8_len
           ~glyphs
           ~num_glyphs
           ~clusters
           ~num_clusters
           cluster_flags))))))
(export cairo_scaled_font_text_to_glyphs)

;; cairo_font_face_t *cairo_scaled_font_get_font_face(cairo_scaled_font_t *
;;     scaled_font);
(define cairo_scaled_font_get_font_face
  (let ((~cairo_scaled_font_get_font_face
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_scaled_font_get_font_face"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font)))
        ((fht-wrap cairo_font_face_t*)
         ((force ~cairo_scaled_font_get_font_face)
          ~scaled_font))))))
(export cairo_scaled_font_get_font_face)

;; void cairo_scaled_font_get_font_matrix(cairo_scaled_font_t *scaled_font, 
;;     cairo_matrix_t *font_matrix);
(define cairo_scaled_font_get_font_matrix
  (let ((~cairo_scaled_font_get_font_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_get_font_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font font_matrix)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~font_matrix
              ((fht-unwrap cairo_matrix_t*) font_matrix)))
        ((force ~cairo_scaled_font_get_font_matrix)
         ~scaled_font
         ~font_matrix)))))
(export cairo_scaled_font_get_font_matrix)

;; void cairo_scaled_font_get_ctm(cairo_scaled_font_t *scaled_font, 
;;     cairo_matrix_t *ctm);
(define cairo_scaled_font_get_ctm
  (let ((~cairo_scaled_font_get_ctm
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_get_ctm"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font ctm)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~ctm ((fht-unwrap cairo_matrix_t*) ctm)))
        ((force ~cairo_scaled_font_get_ctm)
         ~scaled_font
         ~ctm)))))
(export cairo_scaled_font_get_ctm)

;; void cairo_scaled_font_get_scale_matrix(cairo_scaled_font_t *scaled_font, 
;;     cairo_matrix_t *scale_matrix);
(define cairo_scaled_font_get_scale_matrix
  (let ((~cairo_scaled_font_get_scale_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_get_scale_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font scale_matrix)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~scale_matrix
              ((fht-unwrap cairo_matrix_t*) scale_matrix)))
        ((force ~cairo_scaled_font_get_scale_matrix)
         ~scaled_font
         ~scale_matrix)))))
(export cairo_scaled_font_get_scale_matrix)

;; void cairo_scaled_font_get_font_options(cairo_scaled_font_t *scaled_font, 
;;     cairo_font_options_t *options);
(define cairo_scaled_font_get_font_options
  (let ((~cairo_scaled_font_get_font_options
          (delay (fh-link-proc
                   ffi:void
                   "cairo_scaled_font_get_font_options"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (scaled_font options)
      (let ((~scaled_font
              ((fht-unwrap cairo_scaled_font_t*) scaled_font))
            (~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_scaled_font_get_font_options)
         ~scaled_font
         ~options)))))
(export cairo_scaled_font_get_font_options)

;; cairo_font_face_t *cairo_toy_font_face_create(const char *family, 
;;     cairo_font_slant_t slant, cairo_font_weight_t weight);
(define cairo_toy_font_face_create
  (let ((~cairo_toy_font_face_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_toy_font_face_create"
                   (list ffi-void* ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (family slant weight)
      (let ((~family (unwrap~pointer family))
            (~slant (unwrap-cairo_font_slant_t slant))
            (~weight (unwrap-cairo_font_weight_t weight)))
        ((fht-wrap cairo_font_face_t*)
         ((force ~cairo_toy_font_face_create)
          ~family
          ~slant
          ~weight))))))
(export cairo_toy_font_face_create)

;; const char *cairo_toy_font_face_get_family(cairo_font_face_t *font_face);
(define cairo_toy_font_face_get_family
  (let ((~cairo_toy_font_face_get_family
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_toy_font_face_get_family"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((force ~cairo_toy_font_face_get_family)
         ~font_face)))))
(export cairo_toy_font_face_get_family)

;; cairo_font_slant_t cairo_toy_font_face_get_slant(cairo_font_face_t *
;;     font_face);
(define cairo_toy_font_face_get_slant
  (let ((~cairo_toy_font_face_get_slant
          (delay (fh-link-proc
                   ffi:int
                   "cairo_toy_font_face_get_slant"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        (wrap-cairo_font_slant_t
          ((force ~cairo_toy_font_face_get_slant)
           ~font_face))))))
(export cairo_toy_font_face_get_slant)

;; cairo_font_weight_t cairo_toy_font_face_get_weight(cairo_font_face_t *
;;     font_face);
(define cairo_toy_font_face_get_weight
  (let ((~cairo_toy_font_face_get_weight
          (delay (fh-link-proc
                   ffi:int
                   "cairo_toy_font_face_get_weight"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        (wrap-cairo_font_weight_t
          ((force ~cairo_toy_font_face_get_weight)
           ~font_face))))))
(export cairo_toy_font_face_get_weight)

;; cairo_font_face_t *cairo_user_font_face_create(void );
(define cairo_user_font_face_create
  (let ((~cairo_user_font_face_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_user_font_face_create"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let ()
        ((fht-wrap cairo_font_face_t*)
         ((force ~cairo_user_font_face_create)))))))
(export cairo_user_font_face_create)

;; typedef cairo_status_t (*cairo_user_scaled_font_init_func_t)(
;;     cairo_scaled_font_t *scaled_font, cairo_t *cr, cairo_font_extents_t *
;;     extents);
(define-public cairo_user_scaled_font_init_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   (fh:pointer 'void)
                   (fh:pointer
                     (bs:struct
                       (list `(ascent ,double)
                             `(descent ,double)
                             `(height ,double)
                             `(max_x_advance ,double)
                             `(max_y_advance ,double))))))))
  )
(define-fh-function*-type
  cairo_user_scaled_font_init_func_t
  cairo_user_scaled_font_init_func_t-desc
  cairo_user_scaled_font_init_func_t?
  make-cairo_user_scaled_font_init_func_t)
(export cairo_user_scaled_font_init_func_t cairo_user_scaled_font_init_func_t?
 make-cairo_user_scaled_font_init_func_t)

;; typedef cairo_status_t (*cairo_user_scaled_font_render_glyph_func_t)(
;;     cairo_scaled_font_t *scaled_font, unsigned long glyph, cairo_t *cr, 
;;     cairo_text_extents_t *extents);
(define-public cairo_user_scaled_font_render_glyph_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   unsigned-long
                   (fh:pointer 'void)
                   (fh:pointer
                     (bs:struct
                       (list `(x_bearing ,double)
                             `(y_bearing ,double)
                             `(width ,double)
                             `(height ,double)
                             `(x_advance ,double)
                             `(y_advance ,double))))))))
  )
(define-fh-function*-type
  cairo_user_scaled_font_render_glyph_func_t
  cairo_user_scaled_font_render_glyph_func_t-desc
  cairo_user_scaled_font_render_glyph_func_t?
  make-cairo_user_scaled_font_render_glyph_func_t)
(export cairo_user_scaled_font_render_glyph_func_t 
 cairo_user_scaled_font_render_glyph_func_t? 
 make-cairo_user_scaled_font_render_glyph_func_t)

;; typedef cairo_status_t (*cairo_user_scaled_font_text_to_glyphs_func_t)(
;;     cairo_scaled_font_t *scaled_font, const char *utf8, int utf8_len, 
;;     cairo_glyph_t **glyphs, int *num_glyphs, cairo_text_cluster_t **clusters
;;     , int *num_clusters, cairo_text_cluster_flags_t *cluster_flags);
(define-public cairo_user_scaled_font_text_to_glyphs_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   (fh:pointer int8)
                   int
                   (fh:pointer
                     (fh:pointer
                       (bs:struct
                         (list `(index ,unsigned-long)
                               `(x ,double)
                               `(y ,double)))))
                   (fh:pointer int)
                   (fh:pointer
                     (fh:pointer
                       (bs:struct
                         (list `(num_bytes ,int) `(num_glyphs ,int)))))
                   (fh:pointer int)
                   (fh:pointer int)))))
  )
(define-fh-function*-type
  cairo_user_scaled_font_text_to_glyphs_func_t
  cairo_user_scaled_font_text_to_glyphs_func_t-desc
  cairo_user_scaled_font_text_to_glyphs_func_t?
  make-cairo_user_scaled_font_text_to_glyphs_func_t)
(export cairo_user_scaled_font_text_to_glyphs_func_t 
 cairo_user_scaled_font_text_to_glyphs_func_t? 
 make-cairo_user_scaled_font_text_to_glyphs_func_t)

;; typedef cairo_status_t (*cairo_user_scaled_font_unicode_to_glyph_func_t)(
;;     cairo_scaled_font_t *scaled_font, unsigned long unicode, unsigned long *
;;     glyph_index);
(define-public cairo_user_scaled_font_unicode_to_glyph_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   unsigned-long
                   (fh:pointer unsigned-long)))))
  )
(define-fh-function*-type
  cairo_user_scaled_font_unicode_to_glyph_func_t
  cairo_user_scaled_font_unicode_to_glyph_func_t-desc
  cairo_user_scaled_font_unicode_to_glyph_func_t?
  make-cairo_user_scaled_font_unicode_to_glyph_func_t)
(export cairo_user_scaled_font_unicode_to_glyph_func_t 
 cairo_user_scaled_font_unicode_to_glyph_func_t? 
 make-cairo_user_scaled_font_unicode_to_glyph_func_t)

;; void cairo_user_font_face_set_init_func(cairo_font_face_t *font_face, 
;;     cairo_user_scaled_font_init_func_t init_func);
(define cairo_user_font_face_set_init_func
  (let ((~cairo_user_font_face_set_init_func
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_font_face_set_init_func"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face init_func)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~init_func
              ((fht-unwrap cairo_user_scaled_font_init_func_t)
               init_func)))
        ((force ~cairo_user_font_face_set_init_func)
         ~font_face
         ~init_func)))))
(export cairo_user_font_face_set_init_func)

;; void cairo_user_font_face_set_render_glyph_func(cairo_font_face_t *font_face
;;     , cairo_user_scaled_font_render_glyph_func_t render_glyph_func);
(define cairo_user_font_face_set_render_glyph_func
  (let ((~cairo_user_font_face_set_render_glyph_func
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_font_face_set_render_glyph_func"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face render_glyph_func)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~render_glyph_func
              ((fht-unwrap
                 cairo_user_scaled_font_render_glyph_func_t)
               render_glyph_func)))
        ((force ~cairo_user_font_face_set_render_glyph_func)
         ~font_face
         ~render_glyph_func)))))
(export cairo_user_font_face_set_render_glyph_func)

;; void cairo_user_font_face_set_text_to_glyphs_func(cairo_font_face_t *
;;     font_face, cairo_user_scaled_font_text_to_glyphs_func_t 
;;     text_to_glyphs_func);
(define cairo_user_font_face_set_text_to_glyphs_func
  (let ((~cairo_user_font_face_set_text_to_glyphs_func
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_font_face_set_text_to_glyphs_func"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face text_to_glyphs_func)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~text_to_glyphs_func
              ((fht-unwrap
                 cairo_user_scaled_font_text_to_glyphs_func_t)
               text_to_glyphs_func)))
        ((force ~cairo_user_font_face_set_text_to_glyphs_func)
         ~font_face
         ~text_to_glyphs_func)))))
(export cairo_user_font_face_set_text_to_glyphs_func)

;; void cairo_user_font_face_set_unicode_to_glyph_func(cairo_font_face_t *
;;     font_face, cairo_user_scaled_font_unicode_to_glyph_func_t 
;;     unicode_to_glyph_func);
(define cairo_user_font_face_set_unicode_to_glyph_func
  (let ((~cairo_user_font_face_set_unicode_to_glyph_func
          (delay (fh-link-proc
                   ffi:void
                   "cairo_user_font_face_set_unicode_to_glyph_func"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face unicode_to_glyph_func)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face))
            (~unicode_to_glyph_func
              ((fht-unwrap
                 cairo_user_scaled_font_unicode_to_glyph_func_t)
               unicode_to_glyph_func)))
        ((force ~cairo_user_font_face_set_unicode_to_glyph_func)
         ~font_face
         ~unicode_to_glyph_func)))))
(export cairo_user_font_face_set_unicode_to_glyph_func)

;; cairo_user_scaled_font_init_func_t cairo_user_font_face_get_init_func(
;;     cairo_font_face_t *font_face);
(define cairo_user_font_face_get_init_func
  (let ((~cairo_user_font_face_get_init_func
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_user_font_face_get_init_func"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((fht-wrap cairo_user_scaled_font_init_func_t)
         ((force ~cairo_user_font_face_get_init_func)
          ~font_face))))))
(export cairo_user_font_face_get_init_func)

;; cairo_user_scaled_font_render_glyph_func_t 
;;     cairo_user_font_face_get_render_glyph_func(cairo_font_face_t *font_face)
;;     ;
(define cairo_user_font_face_get_render_glyph_func
  (let ((~cairo_user_font_face_get_render_glyph_func
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_user_font_face_get_render_glyph_func"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((fht-wrap
           cairo_user_scaled_font_render_glyph_func_t)
         ((force ~cairo_user_font_face_get_render_glyph_func)
          ~font_face))))))
(export cairo_user_font_face_get_render_glyph_func)

;; cairo_user_scaled_font_text_to_glyphs_func_t 
;;     cairo_user_font_face_get_text_to_glyphs_func(cairo_font_face_t *
;;     font_face);
(define cairo_user_font_face_get_text_to_glyphs_func
  (let ((~cairo_user_font_face_get_text_to_glyphs_func
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_user_font_face_get_text_to_glyphs_func"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((fht-wrap
           cairo_user_scaled_font_text_to_glyphs_func_t)
         ((force ~cairo_user_font_face_get_text_to_glyphs_func)
          ~font_face))))))
(export cairo_user_font_face_get_text_to_glyphs_func)

;; cairo_user_scaled_font_unicode_to_glyph_func_t 
;;     cairo_user_font_face_get_unicode_to_glyph_func(cairo_font_face_t *
;;     font_face);
(define cairo_user_font_face_get_unicode_to_glyph_func
  (let ((~cairo_user_font_face_get_unicode_to_glyph_func
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_user_font_face_get_unicode_to_glyph_func"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (font_face)
      (let ((~font_face
              ((fht-unwrap cairo_font_face_t*) font_face)))
        ((fht-wrap
           cairo_user_scaled_font_unicode_to_glyph_func_t)
         ((force ~cairo_user_font_face_get_unicode_to_glyph_func)
          ~font_face))))))
(export cairo_user_font_face_get_unicode_to_glyph_func)

;; cairo_operator_t cairo_get_operator(cairo_t *cr);
(define cairo_get_operator
  (let ((~cairo_get_operator
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_operator"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_operator_t
          ((force ~cairo_get_operator) ~cr))))))
(export cairo_get_operator)

;; cairo_pattern_t *cairo_get_source(cairo_t *cr);
(define cairo_get_source
  (let ((~cairo_get_source
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_source"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_get_source) ~cr))))))
(export cairo_get_source)

;; double cairo_get_tolerance(cairo_t *cr);
(define cairo_get_tolerance
  (let ((~cairo_get_tolerance
          (delay (fh-link-proc
                   ffi:double
                   "cairo_get_tolerance"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_get_tolerance) ~cr)))))
(export cairo_get_tolerance)

;; cairo_antialias_t cairo_get_antialias(cairo_t *cr);
(define cairo_get_antialias
  (let ((~cairo_get_antialias
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_antialias"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_antialias_t
          ((force ~cairo_get_antialias) ~cr))))))
(export cairo_get_antialias)

;; cairo_bool_t cairo_has_current_point(cairo_t *cr);
(define cairo_has_current_point
  (let ((~cairo_has_current_point
          (delay (fh-link-proc
                   ffi:int
                   "cairo_has_current_point"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_has_current_point) ~cr)))))
(export cairo_has_current_point)

;; void cairo_get_current_point(cairo_t *cr, double *x, double *y);
(define cairo_get_current_point
  (let ((~cairo_get_current_point
          (delay (fh-link-proc
                   ffi:void
                   "cairo_get_current_point"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr x y)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~x (unwrap~pointer x))
            (~y (unwrap~pointer y)))
        ((force ~cairo_get_current_point) ~cr ~x ~y)))))
(export cairo_get_current_point)

;; cairo_fill_rule_t cairo_get_fill_rule(cairo_t *cr);
(define cairo_get_fill_rule
  (let ((~cairo_get_fill_rule
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_fill_rule"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_fill_rule_t
          ((force ~cairo_get_fill_rule) ~cr))))))
(export cairo_get_fill_rule)

;; double cairo_get_line_width(cairo_t *cr);
(define cairo_get_line_width
  (let ((~cairo_get_line_width
          (delay (fh-link-proc
                   ffi:double
                   "cairo_get_line_width"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_get_line_width) ~cr)))))
(export cairo_get_line_width)

;; cairo_line_cap_t cairo_get_line_cap(cairo_t *cr);
(define cairo_get_line_cap
  (let ((~cairo_get_line_cap
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_line_cap"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_line_cap_t
          ((force ~cairo_get_line_cap) ~cr))))))
(export cairo_get_line_cap)

;; cairo_line_join_t cairo_get_line_join(cairo_t *cr);
(define cairo_get_line_join
  (let ((~cairo_get_line_join
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_line_join"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_line_join_t
          ((force ~cairo_get_line_join) ~cr))))))
(export cairo_get_line_join)

;; double cairo_get_miter_limit(cairo_t *cr);
(define cairo_get_miter_limit
  (let ((~cairo_get_miter_limit
          (delay (fh-link-proc
                   ffi:double
                   "cairo_get_miter_limit"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_get_miter_limit) ~cr)))))
(export cairo_get_miter_limit)

;; int cairo_get_dash_count(cairo_t *cr);
(define cairo_get_dash_count
  (let ((~cairo_get_dash_count
          (delay (fh-link-proc
                   ffi:int
                   "cairo_get_dash_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((force ~cairo_get_dash_count) ~cr)))))
(export cairo_get_dash_count)

;; void cairo_get_dash(cairo_t *cr, double *dashes, double *offset);
(define cairo_get_dash
  (let ((~cairo_get_dash
          (delay (fh-link-proc
                   ffi:void
                   "cairo_get_dash"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr dashes offset)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~dashes (unwrap~pointer dashes))
            (~offset (unwrap~pointer offset)))
        ((force ~cairo_get_dash) ~cr ~dashes ~offset)))))
(export cairo_get_dash)

;; void cairo_get_matrix(cairo_t *cr, cairo_matrix_t *matrix);
(define cairo_get_matrix
  (let ((~cairo_get_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_get_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr matrix)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_get_matrix) ~cr ~matrix)))))
(export cairo_get_matrix)

;; cairo_surface_t *cairo_get_target(cairo_t *cr);
(define cairo_get_target
  (let ((~cairo_get_target
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_target"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_get_target) ~cr))))))
(export cairo_get_target)

;; cairo_surface_t *cairo_get_group_target(cairo_t *cr);
(define cairo_get_group_target
  (let ((~cairo_get_group_target
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_get_group_target"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_get_group_target) ~cr))))))
(export cairo_get_group_target)

;; typedef enum _cairo_path_data_type {
;;   CAIRO_PATH_MOVE_TO,
;;   CAIRO_PATH_LINE_TO,
;;   CAIRO_PATH_CURVE_TO,
;;   CAIRO_PATH_CLOSE_PATH,
;; } cairo_path_data_type_t;
(define cairo_path_data_type_t-enum-nvl
  '((CAIRO_PATH_MOVE_TO . 0)
    (CAIRO_PATH_LINE_TO . 1)
    (CAIRO_PATH_CURVE_TO . 2)
    (CAIRO_PATH_CLOSE_PATH . 3))
  )
(define cairo_path_data_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_path_data_type_t-enum-nvl))
(define-public (unwrap-cairo_path_data_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_path_data_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_path_data_type_t v)
  (assq-ref cairo_path_data_type_t-enum-vnl v))
(define-public unwrap-enum-_cairo_path_data_type unwrap-cairo_path_data_type_t)
(define-public wrap-enum-_cairo_path_data_type wrap-cairo_path_data_type_t)

;; enum _cairo_path_data_type {
;;   CAIRO_PATH_MOVE_TO,
;;   CAIRO_PATH_LINE_TO,
;;   CAIRO_PATH_CURVE_TO,
;;   CAIRO_PATH_CLOSE_PATH,
;; };

;; typedef union _cairo_path_data_t cairo_path_data_t;
(define-public cairo_path_data_t-desc 'void)
(define-public cairo_path_data_t*-desc (fh:pointer (delay cairo_path_data_t-desc)))
(define-fh-pointer-type cairo_path_data_t* cairo_path_data_t*-desc 
 cairo_path_data_t*? make-cairo_path_data_t*)
(export cairo_path_data_t* cairo_path_data_t*? make-cairo_path_data_t*)

;; union _cairo_path_data_t {
;;   struct {
;;     cairo_path_data_type_t type;
;;     int length;
;;   } header;
;;   struct {
;;     double x, y;
;;   } point;
;; };
(define-public union-_cairo_path_data_t-desc
  (bs:union
    (list `(header
             ,(bs:struct (list `(type ,int) `(length ,int))))
          `(point ,(bs:struct (list `(y ,double) `(x ,double)))))))
(define-fh-compound-type union-_cairo_path_data_t 
 union-_cairo_path_data_t-desc union-_cairo_path_data_t? 
 make-union-_cairo_path_data_t)
(export union-_cairo_path_data_t union-_cairo_path_data_t? 
 make-union-_cairo_path_data_t)
(define-public union-_cairo_path_data_t*-desc
  (fh:pointer union-_cairo_path_data_t-desc))
(define-fh-pointer-type union-_cairo_path_data_t* 
 union-_cairo_path_data_t*-desc union-_cairo_path_data_t*? 
 make-union-_cairo_path_data_t*)
(export union-_cairo_path_data_t* union-_cairo_path_data_t*? 
 make-union-_cairo_path_data_t*)
(fh-ref<=>deref!
  union-_cairo_path_data_t*
  make-union-_cairo_path_data_t*
  union-_cairo_path_data_t
  make-union-_cairo_path_data_t)
(set! cairo_path_data_t-desc union-_cairo_path_data_t-desc)
(define-fh-compound-type cairo_path_data_t cairo_path_data_t-desc 
 cairo_path_data_t? make-cairo_path_data_t)
(export cairo_path_data_t cairo_path_data_t? make-cairo_path_data_t)
(fh-ref<=>deref!
  cairo_path_data_t*
  make-cairo_path_data_t*
  cairo_path_data_t
  make-cairo_path_data_t)

;; typedef struct cairo_path {
;;   cairo_status_t status;
;;   cairo_path_data_t *data;
;;   int num_data;
;; } cairo_path_t;
(define-public cairo_path_t-desc
  (bs:struct
    (list `(status ,int)
          `(data ,cairo_path_data_t*-desc)
          `(num_data ,int))))
(define-fh-compound-type cairo_path_t cairo_path_t-desc cairo_path_t? 
 make-cairo_path_t)
(export cairo_path_t cairo_path_t? make-cairo_path_t)
(define-public cairo_path_t*-desc
  (fh:pointer cairo_path_t-desc))
(define-fh-pointer-type cairo_path_t* cairo_path_t*-desc cairo_path_t*? 
 make-cairo_path_t*)
(export cairo_path_t* cairo_path_t*? make-cairo_path_t*)
(fh-ref<=>deref!
  cairo_path_t*
  make-cairo_path_t*
  cairo_path_t
  make-cairo_path_t)
(define-public struct-cairo_path-desc
  cairo_path_t-desc)
(define-fh-compound-type struct-cairo_path struct-cairo_path-desc 
 struct-cairo_path? make-struct-cairo_path)
(export struct-cairo_path struct-cairo_path? make-struct-cairo_path)
(define-public struct-cairo_path*-desc
  cairo_path_t*-desc)
(define-fh-pointer-type struct-cairo_path* struct-cairo_path*-desc 
 struct-cairo_path*? make-struct-cairo_path*)
(export struct-cairo_path* struct-cairo_path*? make-struct-cairo_path*)
(fh-ref<=>deref!
  struct-cairo_path*
  make-struct-cairo_path*
  struct-cairo_path
  make-struct-cairo_path)

;; cairo_path_t *cairo_copy_path(cairo_t *cr);
(define cairo_copy_path
  (let ((~cairo_copy_path
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_copy_path"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_path_t*)
         ((force ~cairo_copy_path) ~cr))))))
(export cairo_copy_path)

;; cairo_path_t *cairo_copy_path_flat(cairo_t *cr);
(define cairo_copy_path_flat
  (let ((~cairo_copy_path_flat
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_copy_path_flat"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        ((fht-wrap cairo_path_t*)
         ((force ~cairo_copy_path_flat) ~cr))))))
(export cairo_copy_path_flat)

;; void cairo_append_path(cairo_t *cr, const cairo_path_t *path);
(define cairo_append_path
  (let ((~cairo_append_path
          (delay (fh-link-proc
                   ffi:void
                   "cairo_append_path"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr path)
      (let ((~cr ((fht-unwrap cairo_t*) cr))
            (~path ((fht-unwrap cairo_path_t*) path)))
        ((force ~cairo_append_path) ~cr ~path)))))
(export cairo_append_path)

;; void cairo_path_destroy(cairo_path_t *path);
(define cairo_path_destroy
  (let ((~cairo_path_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_path_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (path)
      (let ((~path ((fht-unwrap cairo_path_t*) path)))
        ((force ~cairo_path_destroy) ~path)))))
(export cairo_path_destroy)

;; cairo_status_t cairo_status(cairo_t *cr);
(define cairo_status
  (let ((~cairo_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (cr)
      (let ((~cr ((fht-unwrap cairo_t*) cr)))
        (wrap-cairo_status_t ((force ~cairo_status) ~cr))))))
(export cairo_status)

;; const char *cairo_status_to_string(cairo_status_t status);
(define cairo_status_to_string
  (let ((~cairo_status_to_string
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_status_to_string"
                   (list ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (status)
      (let ((~status (unwrap-cairo_status_t status)))
        ((force ~cairo_status_to_string) ~status)))))
(export cairo_status_to_string)

;; cairo_device_t *cairo_device_reference(cairo_device_t *device);
(define cairo_device_reference
  (let ((~cairo_device_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_device_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((fht-wrap cairo_device_t*)
         ((force ~cairo_device_reference) ~device))))))
(export cairo_device_reference)

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
(define cairo_device_type_t-enum-nvl
  '((CAIRO_DEVICE_TYPE_DRM . 0)
    (CAIRO_DEVICE_TYPE_GL . 1)
    (CAIRO_DEVICE_TYPE_SCRIPT . 2)
    (CAIRO_DEVICE_TYPE_XCB . 3)
    (CAIRO_DEVICE_TYPE_XLIB . 4)
    (CAIRO_DEVICE_TYPE_XML . 5)
    (CAIRO_DEVICE_TYPE_COGL . 6)
    (CAIRO_DEVICE_TYPE_WIN32 . 7)
    (CAIRO_DEVICE_TYPE_INVALID . -1))
  )
(define cairo_device_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_device_type_t-enum-nvl))
(define-public (unwrap-cairo_device_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_device_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_device_type_t v)
  (assq-ref cairo_device_type_t-enum-vnl v))
(define-public unwrap-enum-_cairo_device_type unwrap-cairo_device_type_t)
(define-public wrap-enum-_cairo_device_type wrap-cairo_device_type_t)

;; enum _cairo_device_type {
;;   CAIRO_DEVICE_TYPE_DRM,
;;   CAIRO_DEVICE_TYPE_GL,
;;   CAIRO_DEVICE_TYPE_SCRIPT,
;;   CAIRO_DEVICE_TYPE_XCB,
;;   CAIRO_DEVICE_TYPE_XLIB,
;;   CAIRO_DEVICE_TYPE_XML,
;;   CAIRO_DEVICE_TYPE_COGL,
;;   CAIRO_DEVICE_TYPE_WIN32,
;;   CAIRO_DEVICE_TYPE_INVALID = -1,
;; };

;; cairo_device_type_t cairo_device_get_type(cairo_device_t *device);
(define cairo_device_get_type
  (let ((~cairo_device_get_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_device_get_type"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        (wrap-cairo_device_type_t
          ((force ~cairo_device_get_type) ~device))))))
(export cairo_device_get_type)

;; cairo_status_t cairo_device_status(cairo_device_t *device);
(define cairo_device_status
  (let ((~cairo_device_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_device_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        (wrap-cairo_status_t
          ((force ~cairo_device_status) ~device))))))
(export cairo_device_status)

;; cairo_status_t cairo_device_acquire(cairo_device_t *device);
(define cairo_device_acquire
  (let ((~cairo_device_acquire
          (delay (fh-link-proc
                   ffi:int
                   "cairo_device_acquire"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        (wrap-cairo_status_t
          ((force ~cairo_device_acquire) ~device))))))
(export cairo_device_acquire)

;; void cairo_device_release(cairo_device_t *device);
(define cairo_device_release
  (let ((~cairo_device_release
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_release"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_release) ~device)))))
(export cairo_device_release)

;; void cairo_device_flush(cairo_device_t *device);
(define cairo_device_flush
  (let ((~cairo_device_flush
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_flush"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_flush) ~device)))))
(export cairo_device_flush)

;; void cairo_device_finish(cairo_device_t *device);
(define cairo_device_finish
  (let ((~cairo_device_finish
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_finish"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_finish) ~device)))))
(export cairo_device_finish)

;; void cairo_device_destroy(cairo_device_t *device);
(define cairo_device_destroy
  (let ((~cairo_device_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_device_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_destroy) ~device)))))
(export cairo_device_destroy)

;; unsigned int cairo_device_get_reference_count(cairo_device_t *device);
(define cairo_device_get_reference_count
  (let ((~cairo_device_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_device_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_get_reference_count)
         ~device)))))
(export cairo_device_get_reference_count)

;; void *cairo_device_get_user_data(cairo_device_t *device, const 
;;     cairo_user_data_key_t *key);
(define cairo_device_get_user_data
  (let ((~cairo_device_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_device_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device key)
      (let ((~device ((fht-unwrap cairo_device_t*) device))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_device_get_user_data)
         ~device
         ~key)))))
(export cairo_device_get_user_data)

;; cairo_status_t cairo_device_set_user_data(cairo_device_t *device, const 
;;     cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define cairo_device_set_user_data
  (let ((~cairo_device_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_device_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device key user_data destroy)
      (let ((~device ((fht-unwrap cairo_device_t*) device))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_device_set_user_data)
           ~device
           ~key
           ~user_data
           ~destroy))))))
(export cairo_device_set_user_data)

;; cairo_surface_t *cairo_surface_create_similar(cairo_surface_t *other, 
;;     cairo_content_t content, int width, int height);
(define cairo_surface_create_similar
  (let ((~cairo_surface_create_similar
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_create_similar"
                   (list ffi-void* ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (other content width height)
      (let ((~other ((fht-unwrap cairo_surface_t*) other))
            (~content (unwrap-cairo_content_t content))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_create_similar)
          ~other
          ~content
          ~width
          ~height))))))
(export cairo_surface_create_similar)

;; cairo_surface_t *cairo_surface_create_similar_image(cairo_surface_t *other, 
;;     cairo_format_t format, int width, int height);
(define cairo_surface_create_similar_image
  (let ((~cairo_surface_create_similar_image
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_create_similar_image"
                   (list ffi-void* ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (other format width height)
      (let ((~other ((fht-unwrap cairo_surface_t*) other))
            (~format (unwrap-cairo_format_t format))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_create_similar_image)
          ~other
          ~format
          ~width
          ~height))))))
(export cairo_surface_create_similar_image)

;; cairo_surface_t *cairo_surface_map_to_image(cairo_surface_t *surface, const 
;;     cairo_rectangle_int_t *extents);
(define cairo_surface_map_to_image
  (let ((~cairo_surface_map_to_image
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_map_to_image"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface extents)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~extents
              ((fht-unwrap cairo_rectangle_int_t*) extents)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_map_to_image)
          ~surface
          ~extents))))))
(export cairo_surface_map_to_image)

;; void cairo_surface_unmap_image(cairo_surface_t *surface, cairo_surface_t *
;;     image);
(define cairo_surface_unmap_image
  (let ((~cairo_surface_unmap_image
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_unmap_image"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface image)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~image ((fht-unwrap cairo_surface_t*) image)))
        ((force ~cairo_surface_unmap_image)
         ~surface
         ~image)))))
(export cairo_surface_unmap_image)

;; cairo_surface_t *cairo_surface_create_for_rectangle(cairo_surface_t *target
;;     , double x, double y, double width, double height);
(define cairo_surface_create_for_rectangle
  (let ((~cairo_surface_create_for_rectangle
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_create_for_rectangle"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (target x y width height)
      (let ((~target ((fht-unwrap cairo_surface_t*) target))
            (~x (unwrap~float x))
            (~y (unwrap~float y))
            (~width (unwrap~float width))
            (~height (unwrap~float height)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_create_for_rectangle)
          ~target
          ~x
          ~y
          ~width
          ~height))))))
(export cairo_surface_create_for_rectangle)

;; typedef enum {
;;   CAIRO_SURFACE_OBSERVER_NORMAL = 0,
;;   CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS = 0x1,
;; } cairo_surface_observer_mode_t;
(define cairo_surface_observer_mode_t-enum-nvl
  '((CAIRO_SURFACE_OBSERVER_NORMAL . 0)
    (CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS . 1))
  )
(define cairo_surface_observer_mode_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_surface_observer_mode_t-enum-nvl))
(define-public (unwrap-cairo_surface_observer_mode_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_surface_observer_mode_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_surface_observer_mode_t v)
  (assq-ref cairo_surface_observer_mode_t-enum-vnl v))

;; cairo_surface_t *cairo_surface_create_observer(cairo_surface_t *target, 
;;     cairo_surface_observer_mode_t mode);
(define cairo_surface_create_observer
  (let ((~cairo_surface_create_observer
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_create_observer"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (target mode)
      (let ((~target ((fht-unwrap cairo_surface_t*) target))
            (~mode (unwrap-cairo_surface_observer_mode_t mode)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_create_observer)
          ~target
          ~mode))))))
(export cairo_surface_create_observer)

;; typedef void (*cairo_surface_observer_callback_t)(cairo_surface_t *observer
;;     , cairo_surface_t *target, void *data);
(define-public cairo_surface_observer_callback_t-desc
  (fh:pointer
    (delay (fh:function
             'void
             (list (fh:pointer 'void)
                   (fh:pointer 'void)
                   (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_surface_observer_callback_t
  cairo_surface_observer_callback_t-desc
  cairo_surface_observer_callback_t?
  make-cairo_surface_observer_callback_t)
(export cairo_surface_observer_callback_t cairo_surface_observer_callback_t? 
 make-cairo_surface_observer_callback_t)

;; cairo_status_t cairo_surface_observer_add_paint_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_paint_callback
  (let ((~cairo_surface_observer_add_paint_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_paint_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_paint_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_paint_callback)

;; cairo_status_t cairo_surface_observer_add_mask_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_mask_callback
  (let ((~cairo_surface_observer_add_mask_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_mask_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_mask_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_mask_callback)

;; cairo_status_t cairo_surface_observer_add_fill_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_fill_callback
  (let ((~cairo_surface_observer_add_fill_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_fill_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_fill_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_fill_callback)

;; cairo_status_t cairo_surface_observer_add_stroke_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_stroke_callback
  (let ((~cairo_surface_observer_add_stroke_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_stroke_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_stroke_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_stroke_callback)

;; cairo_status_t cairo_surface_observer_add_glyphs_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_glyphs_callback
  (let ((~cairo_surface_observer_add_glyphs_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_glyphs_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_glyphs_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_glyphs_callback)

;; cairo_status_t cairo_surface_observer_add_flush_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_flush_callback
  (let ((~cairo_surface_observer_add_flush_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_flush_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_flush_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_flush_callback)

;; cairo_status_t cairo_surface_observer_add_finish_callback(cairo_surface_t *
;;     abstract_surface, cairo_surface_observer_callback_t func, void *data);
(define cairo_surface_observer_add_finish_callback
  (let ((~cairo_surface_observer_add_finish_callback
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_add_finish_callback"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (abstract_surface func data)
      (let ((~abstract_surface
              ((fht-unwrap cairo_surface_t*) abstract_surface))
            (~func ((fht-unwrap cairo_surface_observer_callback_t)
                    func))
            (~data (unwrap~pointer data)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_add_finish_callback)
           ~abstract_surface
           ~func
           ~data))))))
(export cairo_surface_observer_add_finish_callback)

;; cairo_status_t cairo_surface_observer_print(cairo_surface_t *surface, 
;;     cairo_write_func_t write_func, void *closure);
(define cairo_surface_observer_print
  (let ((~cairo_surface_observer_print
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_observer_print"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface write_func closure)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~write_func
              ((fht-unwrap cairo_write_func_t) write_func))
            (~closure (unwrap~pointer closure)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_observer_print)
           ~surface
           ~write_func
           ~closure))))))
(export cairo_surface_observer_print)

;; double cairo_surface_observer_elapsed(cairo_surface_t *surface);
(define cairo_surface_observer_elapsed
  (let ((~cairo_surface_observer_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_surface_observer_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_observer_elapsed)
         ~surface)))))
(export cairo_surface_observer_elapsed)

;; cairo_status_t cairo_device_observer_print(cairo_device_t *device, 
;;     cairo_write_func_t write_func, void *closure);
(define cairo_device_observer_print
  (let ((~cairo_device_observer_print
          (delay (fh-link-proc
                   ffi:int
                   "cairo_device_observer_print"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device write_func closure)
      (let ((~device ((fht-unwrap cairo_device_t*) device))
            (~write_func
              ((fht-unwrap cairo_write_func_t) write_func))
            (~closure (unwrap~pointer closure)))
        (wrap-cairo_status_t
          ((force ~cairo_device_observer_print)
           ~device
           ~write_func
           ~closure))))))
(export cairo_device_observer_print)

;; double cairo_device_observer_elapsed(cairo_device_t *device);
(define cairo_device_observer_elapsed
  (let ((~cairo_device_observer_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_elapsed) ~device)))))
(export cairo_device_observer_elapsed)

;; double cairo_device_observer_paint_elapsed(cairo_device_t *device);
(define cairo_device_observer_paint_elapsed
  (let ((~cairo_device_observer_paint_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_paint_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_paint_elapsed)
         ~device)))))
(export cairo_device_observer_paint_elapsed)

;; double cairo_device_observer_mask_elapsed(cairo_device_t *device);
(define cairo_device_observer_mask_elapsed
  (let ((~cairo_device_observer_mask_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_mask_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_mask_elapsed)
         ~device)))))
(export cairo_device_observer_mask_elapsed)

;; double cairo_device_observer_fill_elapsed(cairo_device_t *device);
(define cairo_device_observer_fill_elapsed
  (let ((~cairo_device_observer_fill_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_fill_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_fill_elapsed)
         ~device)))))
(export cairo_device_observer_fill_elapsed)

;; double cairo_device_observer_stroke_elapsed(cairo_device_t *device);
(define cairo_device_observer_stroke_elapsed
  (let ((~cairo_device_observer_stroke_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_stroke_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_stroke_elapsed)
         ~device)))))
(export cairo_device_observer_stroke_elapsed)

;; double cairo_device_observer_glyphs_elapsed(cairo_device_t *device);
(define cairo_device_observer_glyphs_elapsed
  (let ((~cairo_device_observer_glyphs_elapsed
          (delay (fh-link-proc
                   ffi:double
                   "cairo_device_observer_glyphs_elapsed"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (device)
      (let ((~device ((fht-unwrap cairo_device_t*) device)))
        ((force ~cairo_device_observer_glyphs_elapsed)
         ~device)))))
(export cairo_device_observer_glyphs_elapsed)

;; cairo_surface_t *cairo_surface_reference(cairo_surface_t *surface);
(define cairo_surface_reference
  (let ((~cairo_surface_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_surface_reference) ~surface))))))
(export cairo_surface_reference)

;; void cairo_surface_finish(cairo_surface_t *surface);
(define cairo_surface_finish
  (let ((~cairo_surface_finish
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_finish"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_finish) ~surface)))))
(export cairo_surface_finish)

;; void cairo_surface_destroy(cairo_surface_t *surface);
(define cairo_surface_destroy
  (let ((~cairo_surface_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_destroy) ~surface)))))
(export cairo_surface_destroy)

;; cairo_device_t *cairo_surface_get_device(cairo_surface_t *surface);
(define cairo_surface_get_device
  (let ((~cairo_surface_get_device
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_get_device"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((fht-wrap cairo_device_t*)
         ((force ~cairo_surface_get_device) ~surface))))))
(export cairo_surface_get_device)

;; unsigned int cairo_surface_get_reference_count(cairo_surface_t *surface);
(define cairo_surface_get_reference_count
  (let ((~cairo_surface_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_surface_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_get_reference_count)
         ~surface)))))
(export cairo_surface_get_reference_count)

;; cairo_status_t cairo_surface_status(cairo_surface_t *surface);
(define cairo_surface_status
  (let ((~cairo_surface_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_status) ~surface))))))
(export cairo_surface_status)

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
(define cairo_surface_type_t-enum-nvl
  '((CAIRO_SURFACE_TYPE_IMAGE . 0)
    (CAIRO_SURFACE_TYPE_PDF . 1)
    (CAIRO_SURFACE_TYPE_PS . 2)
    (CAIRO_SURFACE_TYPE_XLIB . 3)
    (CAIRO_SURFACE_TYPE_XCB . 4)
    (CAIRO_SURFACE_TYPE_GLITZ . 5)
    (CAIRO_SURFACE_TYPE_QUARTZ . 6)
    (CAIRO_SURFACE_TYPE_WIN32 . 7)
    (CAIRO_SURFACE_TYPE_BEOS . 8)
    (CAIRO_SURFACE_TYPE_DIRECTFB . 9)
    (CAIRO_SURFACE_TYPE_SVG . 10)
    (CAIRO_SURFACE_TYPE_OS2 . 11)
    (CAIRO_SURFACE_TYPE_WIN32_PRINTING . 12)
    (CAIRO_SURFACE_TYPE_QUARTZ_IMAGE . 13)
    (CAIRO_SURFACE_TYPE_SCRIPT . 14)
    (CAIRO_SURFACE_TYPE_QT . 15)
    (CAIRO_SURFACE_TYPE_RECORDING . 16)
    (CAIRO_SURFACE_TYPE_VG . 17)
    (CAIRO_SURFACE_TYPE_GL . 18)
    (CAIRO_SURFACE_TYPE_DRM . 19)
    (CAIRO_SURFACE_TYPE_TEE . 20)
    (CAIRO_SURFACE_TYPE_XML . 21)
    (CAIRO_SURFACE_TYPE_SKIA . 22)
    (CAIRO_SURFACE_TYPE_SUBSURFACE . 23)
    (CAIRO_SURFACE_TYPE_COGL . 24))
  )
(define cairo_surface_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_surface_type_t-enum-nvl))
(define-public (unwrap-cairo_surface_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_surface_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_surface_type_t v)
  (assq-ref cairo_surface_type_t-enum-vnl v))
(define-public unwrap-enum-_cairo_surface_type unwrap-cairo_surface_type_t)
(define-public wrap-enum-_cairo_surface_type wrap-cairo_surface_type_t)

;; enum _cairo_surface_type {
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
;; };

;; cairo_surface_type_t cairo_surface_get_type(cairo_surface_t *surface);
(define cairo_surface_get_type
  (let ((~cairo_surface_get_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_get_type"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        (wrap-cairo_surface_type_t
          ((force ~cairo_surface_get_type) ~surface))))))
(export cairo_surface_get_type)

;; cairo_content_t cairo_surface_get_content(cairo_surface_t *surface);
(define cairo_surface_get_content
  (let ((~cairo_surface_get_content
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_get_content"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        (wrap-cairo_content_t
          ((force ~cairo_surface_get_content) ~surface))))))
(export cairo_surface_get_content)

;; cairo_status_t cairo_surface_write_to_png(cairo_surface_t *surface, const 
;;     char *filename);
(define cairo_surface_write_to_png
  (let ((~cairo_surface_write_to_png
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_write_to_png"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface filename)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~filename (unwrap~pointer filename)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_write_to_png)
           ~surface
           ~filename))))))
(export cairo_surface_write_to_png)

;; cairo_status_t cairo_surface_write_to_png_stream(cairo_surface_t *surface, 
;;     cairo_write_func_t write_func, void *closure);
(define cairo_surface_write_to_png_stream
  (let ((~cairo_surface_write_to_png_stream
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_write_to_png_stream"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface write_func closure)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~write_func
              ((fht-unwrap cairo_write_func_t) write_func))
            (~closure (unwrap~pointer closure)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_write_to_png_stream)
           ~surface
           ~write_func
           ~closure))))))
(export cairo_surface_write_to_png_stream)

;; void *cairo_surface_get_user_data(cairo_surface_t *surface, const 
;;     cairo_user_data_key_t *key);
(define cairo_surface_get_user_data
  (let ((~cairo_surface_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_surface_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface key)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_surface_get_user_data)
         ~surface
         ~key)))))
(export cairo_surface_get_user_data)

;; cairo_status_t cairo_surface_set_user_data(cairo_surface_t *surface, const 
;;     cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define cairo_surface_set_user_data
  (let ((~cairo_surface_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface key user_data destroy)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_set_user_data)
           ~surface
           ~key
           ~user_data
           ~destroy))))))
(export cairo_surface_set_user_data)

;; void cairo_surface_get_mime_data(cairo_surface_t *surface, const char *
;;     mime_type, const unsigned char **data, unsigned long *length);
(define cairo_surface_get_mime_data
  (let ((~cairo_surface_get_mime_data
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_get_mime_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface mime_type data length)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~mime_type (unwrap~pointer mime_type))
            (~data (unwrap~pointer data))
            (~length (unwrap~pointer length)))
        ((force ~cairo_surface_get_mime_data)
         ~surface
         ~mime_type
         ~data
         ~length)))))
(export cairo_surface_get_mime_data)

;; cairo_status_t cairo_surface_set_mime_data(cairo_surface_t *surface, const 
;;     char *mime_type, const unsigned char *data, unsigned long length, 
;;     cairo_destroy_func_t destroy, void *closure);
(define cairo_surface_set_mime_data
  (let ((~cairo_surface_set_mime_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_set_mime_data"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi:unsigned-long
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface mime_type data length destroy closure)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~mime_type (unwrap~pointer mime_type))
            (~data (unwrap~pointer data))
            (~length (unwrap~fixed length))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy))
            (~closure (unwrap~pointer closure)))
        (wrap-cairo_status_t
          ((force ~cairo_surface_set_mime_data)
           ~surface
           ~mime_type
           ~data
           ~length
           ~destroy
           ~closure))))))
(export cairo_surface_set_mime_data)

;; cairo_bool_t cairo_surface_supports_mime_type(cairo_surface_t *surface, 
;;     const char *mime_type);
(define cairo_surface_supports_mime_type
  (let ((~cairo_surface_supports_mime_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_supports_mime_type"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface mime_type)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~mime_type (unwrap~pointer mime_type)))
        ((force ~cairo_surface_supports_mime_type)
         ~surface
         ~mime_type)))))
(export cairo_surface_supports_mime_type)

;; void cairo_surface_get_font_options(cairo_surface_t *surface, 
;;     cairo_font_options_t *options);
(define cairo_surface_get_font_options
  (let ((~cairo_surface_get_font_options
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_get_font_options"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface options)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~options
              ((fht-unwrap cairo_font_options_t*) options)))
        ((force ~cairo_surface_get_font_options)
         ~surface
         ~options)))))
(export cairo_surface_get_font_options)

;; void cairo_surface_flush(cairo_surface_t *surface);
(define cairo_surface_flush
  (let ((~cairo_surface_flush
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_flush"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_flush) ~surface)))))
(export cairo_surface_flush)

;; void cairo_surface_mark_dirty(cairo_surface_t *surface);
(define cairo_surface_mark_dirty
  (let ((~cairo_surface_mark_dirty
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_mark_dirty"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_mark_dirty) ~surface)))))
(export cairo_surface_mark_dirty)

;; void cairo_surface_mark_dirty_rectangle(cairo_surface_t *surface, int x, int
;;      y, int width, int height);
(define cairo_surface_mark_dirty_rectangle
  (let ((~cairo_surface_mark_dirty_rectangle
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_mark_dirty_rectangle"
                   (list ffi-void* ffi:int ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x y width height)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x (unwrap~fixed x))
            (~y (unwrap~fixed y))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height)))
        ((force ~cairo_surface_mark_dirty_rectangle)
         ~surface
         ~x
         ~y
         ~width
         ~height)))))
(export cairo_surface_mark_dirty_rectangle)

;; void cairo_surface_set_device_scale(cairo_surface_t *surface, double x_scale
;;     , double y_scale);
(define cairo_surface_set_device_scale
  (let ((~cairo_surface_set_device_scale
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_set_device_scale"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_scale y_scale)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_scale (unwrap~float x_scale))
            (~y_scale (unwrap~float y_scale)))
        ((force ~cairo_surface_set_device_scale)
         ~surface
         ~x_scale
         ~y_scale)))))
(export cairo_surface_set_device_scale)

;; void cairo_surface_get_device_scale(cairo_surface_t *surface, double *
;;     x_scale, double *y_scale);
(define cairo_surface_get_device_scale
  (let ((~cairo_surface_get_device_scale
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_get_device_scale"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_scale y_scale)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_scale (unwrap~pointer x_scale))
            (~y_scale (unwrap~pointer y_scale)))
        ((force ~cairo_surface_get_device_scale)
         ~surface
         ~x_scale
         ~y_scale)))))
(export cairo_surface_get_device_scale)

;; void cairo_surface_set_device_offset(cairo_surface_t *surface, double 
;;     x_offset, double y_offset);
(define cairo_surface_set_device_offset
  (let ((~cairo_surface_set_device_offset
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_set_device_offset"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_offset y_offset)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_offset (unwrap~float x_offset))
            (~y_offset (unwrap~float y_offset)))
        ((force ~cairo_surface_set_device_offset)
         ~surface
         ~x_offset
         ~y_offset)))))
(export cairo_surface_set_device_offset)

;; void cairo_surface_get_device_offset(cairo_surface_t *surface, double *
;;     x_offset, double *y_offset);
(define cairo_surface_get_device_offset
  (let ((~cairo_surface_get_device_offset
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_get_device_offset"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_offset y_offset)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_offset (unwrap~pointer x_offset))
            (~y_offset (unwrap~pointer y_offset)))
        ((force ~cairo_surface_get_device_offset)
         ~surface
         ~x_offset
         ~y_offset)))))
(export cairo_surface_get_device_offset)

;; void cairo_surface_set_fallback_resolution(cairo_surface_t *surface, double 
;;     x_pixels_per_inch, double y_pixels_per_inch);
(define cairo_surface_set_fallback_resolution
  (let ((~cairo_surface_set_fallback_resolution
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_set_fallback_resolution"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_pixels_per_inch y_pixels_per_inch)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_pixels_per_inch
              (unwrap~float x_pixels_per_inch))
            (~y_pixels_per_inch
              (unwrap~float y_pixels_per_inch)))
        ((force ~cairo_surface_set_fallback_resolution)
         ~surface
         ~x_pixels_per_inch
         ~y_pixels_per_inch)))))
(export cairo_surface_set_fallback_resolution)

;; void cairo_surface_get_fallback_resolution(cairo_surface_t *surface, double 
;;     *x_pixels_per_inch, double *y_pixels_per_inch);
(define cairo_surface_get_fallback_resolution
  (let ((~cairo_surface_get_fallback_resolution
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_get_fallback_resolution"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x_pixels_per_inch y_pixels_per_inch)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x_pixels_per_inch
              (unwrap~pointer x_pixels_per_inch))
            (~y_pixels_per_inch
              (unwrap~pointer y_pixels_per_inch)))
        ((force ~cairo_surface_get_fallback_resolution)
         ~surface
         ~x_pixels_per_inch
         ~y_pixels_per_inch)))))
(export cairo_surface_get_fallback_resolution)

;; void cairo_surface_copy_page(cairo_surface_t *surface);
(define cairo_surface_copy_page
  (let ((~cairo_surface_copy_page
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_copy_page"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_copy_page) ~surface)))))
(export cairo_surface_copy_page)

;; void cairo_surface_show_page(cairo_surface_t *surface);
(define cairo_surface_show_page
  (let ((~cairo_surface_show_page
          (delay (fh-link-proc
                   ffi:void
                   "cairo_surface_show_page"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_show_page) ~surface)))))
(export cairo_surface_show_page)

;; cairo_bool_t cairo_surface_has_show_text_glyphs(cairo_surface_t *surface);
(define cairo_surface_has_show_text_glyphs
  (let ((~cairo_surface_has_show_text_glyphs
          (delay (fh-link-proc
                   ffi:int
                   "cairo_surface_has_show_text_glyphs"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_surface_has_show_text_glyphs)
         ~surface)))))
(export cairo_surface_has_show_text_glyphs)

;; cairo_surface_t *cairo_image_surface_create(cairo_format_t format, int width
;;     , int height);
(define cairo_image_surface_create
  (let ((~cairo_image_surface_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_image_surface_create"
                   (list ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (format width height)
      (let ((~format (unwrap-cairo_format_t format))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_image_surface_create)
          ~format
          ~width
          ~height))))))
(export cairo_image_surface_create)

;; int cairo_format_stride_for_width(cairo_format_t format, int width);
(define cairo_format_stride_for_width
  (let ((~cairo_format_stride_for_width
          (delay (fh-link-proc
                   ffi:int
                   "cairo_format_stride_for_width"
                   (list ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (format width)
      (let ((~format (unwrap-cairo_format_t format))
            (~width (unwrap~fixed width)))
        ((force ~cairo_format_stride_for_width)
         ~format
         ~width)))))
(export cairo_format_stride_for_width)

;; cairo_surface_t *cairo_image_surface_create_for_data(unsigned char *data, 
;;     cairo_format_t format, int width, int height, int stride);
(define cairo_image_surface_create_for_data
  (let ((~cairo_image_surface_create_for_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_image_surface_create_for_data"
                   (list ffi-void* ffi:int ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (data format width height stride)
      (let ((~data (unwrap~pointer data))
            (~format (unwrap-cairo_format_t format))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height))
            (~stride (unwrap~fixed stride)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_image_surface_create_for_data)
          ~data
          ~format
          ~width
          ~height
          ~stride))))))
(export cairo_image_surface_create_for_data)

;; unsigned char *cairo_image_surface_get_data(cairo_surface_t *surface);
(define cairo_image_surface_get_data
  (let ((~cairo_image_surface_get_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_image_surface_get_data"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_image_surface_get_data) ~surface)))))
(export cairo_image_surface_get_data)

;; cairo_format_t cairo_image_surface_get_format(cairo_surface_t *surface);
(define cairo_image_surface_get_format
  (let ((~cairo_image_surface_get_format
          (delay (fh-link-proc
                   ffi:int
                   "cairo_image_surface_get_format"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        (wrap-cairo_format_t
          ((force ~cairo_image_surface_get_format)
           ~surface))))))
(export cairo_image_surface_get_format)

;; int cairo_image_surface_get_width(cairo_surface_t *surface);
(define cairo_image_surface_get_width
  (let ((~cairo_image_surface_get_width
          (delay (fh-link-proc
                   ffi:int
                   "cairo_image_surface_get_width"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_image_surface_get_width) ~surface)))))
(export cairo_image_surface_get_width)

;; int cairo_image_surface_get_height(cairo_surface_t *surface);
(define cairo_image_surface_get_height
  (let ((~cairo_image_surface_get_height
          (delay (fh-link-proc
                   ffi:int
                   "cairo_image_surface_get_height"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_image_surface_get_height)
         ~surface)))))
(export cairo_image_surface_get_height)

;; int cairo_image_surface_get_stride(cairo_surface_t *surface);
(define cairo_image_surface_get_stride
  (let ((~cairo_image_surface_get_stride
          (delay (fh-link-proc
                   ffi:int
                   "cairo_image_surface_get_stride"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((force ~cairo_image_surface_get_stride)
         ~surface)))))
(export cairo_image_surface_get_stride)

;; cairo_surface_t *cairo_image_surface_create_from_png(const char *filename);
(define cairo_image_surface_create_from_png
  (let ((~cairo_image_surface_create_from_png
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_image_surface_create_from_png"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (filename)
      (let ((~filename (unwrap~pointer filename)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_image_surface_create_from_png)
          ~filename))))))
(export cairo_image_surface_create_from_png)

;; cairo_surface_t *cairo_image_surface_create_from_png_stream(
;;     cairo_read_func_t read_func, void *closure);
(define cairo_image_surface_create_from_png_stream
  (let ((~cairo_image_surface_create_from_png_stream
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_image_surface_create_from_png_stream"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (read_func closure)
      (let ((~read_func
              ((fht-unwrap cairo_read_func_t) read_func))
            (~closure (unwrap~pointer closure)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_image_surface_create_from_png_stream)
          ~read_func
          ~closure))))))
(export cairo_image_surface_create_from_png_stream)

;; cairo_surface_t *cairo_recording_surface_create(cairo_content_t content, 
;;     const cairo_rectangle_t *extents);
(define cairo_recording_surface_create
  (let ((~cairo_recording_surface_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_recording_surface_create"
                   (list ffi:int ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (content extents)
      (let ((~content (unwrap-cairo_content_t content))
            (~extents
              ((fht-unwrap cairo_rectangle_t*) extents)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_recording_surface_create)
          ~content
          ~extents))))))
(export cairo_recording_surface_create)

;; void cairo_recording_surface_ink_extents(cairo_surface_t *surface, double *
;;     x0, double *y0, double *width, double *height);
(define cairo_recording_surface_ink_extents
  (let ((~cairo_recording_surface_ink_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_recording_surface_ink_extents"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface x0 y0 width height)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~x0 (unwrap~pointer x0))
            (~y0 (unwrap~pointer y0))
            (~width (unwrap~pointer width))
            (~height (unwrap~pointer height)))
        ((force ~cairo_recording_surface_ink_extents)
         ~surface
         ~x0
         ~y0
         ~width
         ~height)))))
(export cairo_recording_surface_ink_extents)

;; cairo_bool_t cairo_recording_surface_get_extents(cairo_surface_t *surface, 
;;     cairo_rectangle_t *extents);
(define cairo_recording_surface_get_extents
  (let ((~cairo_recording_surface_get_extents
          (delay (fh-link-proc
                   ffi:int
                   "cairo_recording_surface_get_extents"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface extents)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~extents
              ((fht-unwrap cairo_rectangle_t*) extents)))
        ((force ~cairo_recording_surface_get_extents)
         ~surface
         ~extents)))))
(export cairo_recording_surface_get_extents)

;; typedef cairo_surface_t *(*cairo_raster_source_acquire_func_t)(
;;     cairo_pattern_t *pattern, void *callback_data, cairo_surface_t *target, 
;;     const cairo_rectangle_int_t *extents);
(define-public cairo_raster_source_acquire_func_t-desc
  (fh:pointer
    (delay (fh:function
             ffi-void*
             (list ffi-void* ffi-void* ffi-void* ffi-void*))))
  )
(define-fh-function*-type
  cairo_raster_source_acquire_func_t
  cairo_raster_source_acquire_func_t-desc
  cairo_raster_source_acquire_func_t?
  make-cairo_raster_source_acquire_func_t)
(export cairo_raster_source_acquire_func_t cairo_raster_source_acquire_func_t?
 make-cairo_raster_source_acquire_func_t)

;; typedef void (*cairo_raster_source_release_func_t)(cairo_pattern_t *pattern
;;     , void *callback_data, cairo_surface_t *surface);
(define-public cairo_raster_source_release_func_t-desc
  (fh:pointer
    (delay (fh:function
             'void
             (list (fh:pointer 'void)
                   (fh:pointer 'void)
                   (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_raster_source_release_func_t
  cairo_raster_source_release_func_t-desc
  cairo_raster_source_release_func_t?
  make-cairo_raster_source_release_func_t)
(export cairo_raster_source_release_func_t cairo_raster_source_release_func_t?
 make-cairo_raster_source_release_func_t)

;; typedef cairo_status_t (*cairo_raster_source_snapshot_func_t)(
;;     cairo_pattern_t *pattern, void *callback_data);
(define-public cairo_raster_source_snapshot_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void) (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_raster_source_snapshot_func_t
  cairo_raster_source_snapshot_func_t-desc
  cairo_raster_source_snapshot_func_t?
  make-cairo_raster_source_snapshot_func_t)
(export cairo_raster_source_snapshot_func_t 
 cairo_raster_source_snapshot_func_t? make-cairo_raster_source_snapshot_func_t
 )

;; typedef cairo_status_t (*cairo_raster_source_copy_func_t)(cairo_pattern_t *
;;     pattern, void *callback_data, const cairo_pattern_t *other);
(define-public cairo_raster_source_copy_func_t-desc
  (fh:pointer
    (delay (fh:function
             int
             (list (fh:pointer 'void)
                   (fh:pointer 'void)
                   (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_raster_source_copy_func_t
  cairo_raster_source_copy_func_t-desc
  cairo_raster_source_copy_func_t?
  make-cairo_raster_source_copy_func_t)
(export cairo_raster_source_copy_func_t cairo_raster_source_copy_func_t? 
 make-cairo_raster_source_copy_func_t)

;; typedef void (*cairo_raster_source_finish_func_t)(cairo_pattern_t *pattern, 
;;     void *callback_data);
(define-public cairo_raster_source_finish_func_t-desc
  (fh:pointer
    (delay (fh:function
             'void
             (list (fh:pointer 'void) (fh:pointer 'void)))))
  )
(define-fh-function*-type
  cairo_raster_source_finish_func_t
  cairo_raster_source_finish_func_t-desc
  cairo_raster_source_finish_func_t?
  make-cairo_raster_source_finish_func_t)
(export cairo_raster_source_finish_func_t cairo_raster_source_finish_func_t? 
 make-cairo_raster_source_finish_func_t)

;; cairo_pattern_t *cairo_pattern_create_raster_source(void *user_data, 
;;     cairo_content_t content, int width, int height);
(define cairo_pattern_create_raster_source
  (let ((~cairo_pattern_create_raster_source
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_raster_source"
                   (list ffi-void* ffi:int ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (user_data content width height)
      (let ((~user_data (unwrap~pointer user_data))
            (~content (unwrap-cairo_content_t content))
            (~width (unwrap~fixed width))
            (~height (unwrap~fixed height)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_raster_source)
          ~user_data
          ~content
          ~width
          ~height))))))
(export cairo_pattern_create_raster_source)

;; void cairo_raster_source_pattern_set_callback_data(cairo_pattern_t *pattern
;;     , void *data);
(define cairo_raster_source_pattern_set_callback_data
  (let ((~cairo_raster_source_pattern_set_callback_data
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_set_callback_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern data)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~data (unwrap~pointer data)))
        ((force ~cairo_raster_source_pattern_set_callback_data)
         ~pattern
         ~data)))))
(export cairo_raster_source_pattern_set_callback_data)

;; void *cairo_raster_source_pattern_get_callback_data(cairo_pattern_t *pattern
;;     );
(define cairo_raster_source_pattern_get_callback_data
  (let ((~cairo_raster_source_pattern_get_callback_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_raster_source_pattern_get_callback_data"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_raster_source_pattern_get_callback_data)
         ~pattern)))))
(export cairo_raster_source_pattern_get_callback_data)

;; void cairo_raster_source_pattern_set_acquire(cairo_pattern_t *pattern, 
;;     cairo_raster_source_acquire_func_t acquire, 
;;     cairo_raster_source_release_func_t release);
(define cairo_raster_source_pattern_set_acquire
  (let ((~cairo_raster_source_pattern_set_acquire
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_set_acquire"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern acquire release)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~acquire
              ((fht-unwrap cairo_raster_source_acquire_func_t)
               acquire))
            (~release
              ((fht-unwrap cairo_raster_source_release_func_t)
               release)))
        ((force ~cairo_raster_source_pattern_set_acquire)
         ~pattern
         ~acquire
         ~release)))))
(export cairo_raster_source_pattern_set_acquire)

;; void cairo_raster_source_pattern_get_acquire(cairo_pattern_t *pattern, 
;;     cairo_raster_source_acquire_func_t *acquire, 
;;     cairo_raster_source_release_func_t *release);
(define cairo_raster_source_pattern_get_acquire
  (let ((~cairo_raster_source_pattern_get_acquire
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_get_acquire"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern acquire release)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~acquire
              ((fht-unwrap cairo_raster_source_acquire_func_t*)
               acquire))
            (~release
              ((fht-unwrap cairo_raster_source_release_func_t*)
               release)))
        ((force ~cairo_raster_source_pattern_get_acquire)
         ~pattern
         ~acquire
         ~release)))))
(export cairo_raster_source_pattern_get_acquire)

;; void cairo_raster_source_pattern_set_snapshot(cairo_pattern_t *pattern, 
;;     cairo_raster_source_snapshot_func_t snapshot);
(define cairo_raster_source_pattern_set_snapshot
  (let ((~cairo_raster_source_pattern_set_snapshot
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_set_snapshot"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern snapshot)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~snapshot
              ((fht-unwrap cairo_raster_source_snapshot_func_t)
               snapshot)))
        ((force ~cairo_raster_source_pattern_set_snapshot)
         ~pattern
         ~snapshot)))))
(export cairo_raster_source_pattern_set_snapshot)

;; cairo_raster_source_snapshot_func_t cairo_raster_source_pattern_get_snapshot
;;     (cairo_pattern_t *pattern);
(define cairo_raster_source_pattern_get_snapshot
  (let ((~cairo_raster_source_pattern_get_snapshot
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_raster_source_pattern_get_snapshot"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((fht-wrap cairo_raster_source_snapshot_func_t)
         ((force ~cairo_raster_source_pattern_get_snapshot)
          ~pattern))))))
(export cairo_raster_source_pattern_get_snapshot)

;; void cairo_raster_source_pattern_set_copy(cairo_pattern_t *pattern, 
;;     cairo_raster_source_copy_func_t copy);
(define cairo_raster_source_pattern_set_copy
  (let ((~cairo_raster_source_pattern_set_copy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_set_copy"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern copy)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~copy ((fht-unwrap cairo_raster_source_copy_func_t)
                    copy)))
        ((force ~cairo_raster_source_pattern_set_copy)
         ~pattern
         ~copy)))))
(export cairo_raster_source_pattern_set_copy)

;; cairo_raster_source_copy_func_t cairo_raster_source_pattern_get_copy(
;;     cairo_pattern_t *pattern);
(define cairo_raster_source_pattern_get_copy
  (let ((~cairo_raster_source_pattern_get_copy
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_raster_source_pattern_get_copy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((fht-wrap cairo_raster_source_copy_func_t)
         ((force ~cairo_raster_source_pattern_get_copy)
          ~pattern))))))
(export cairo_raster_source_pattern_get_copy)

;; void cairo_raster_source_pattern_set_finish(cairo_pattern_t *pattern, 
;;     cairo_raster_source_finish_func_t finish);
(define cairo_raster_source_pattern_set_finish
  (let ((~cairo_raster_source_pattern_set_finish
          (delay (fh-link-proc
                   ffi:void
                   "cairo_raster_source_pattern_set_finish"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern finish)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~finish
              ((fht-unwrap cairo_raster_source_finish_func_t)
               finish)))
        ((force ~cairo_raster_source_pattern_set_finish)
         ~pattern
         ~finish)))))
(export cairo_raster_source_pattern_set_finish)

;; cairo_raster_source_finish_func_t cairo_raster_source_pattern_get_finish(
;;     cairo_pattern_t *pattern);
(define cairo_raster_source_pattern_get_finish
  (let ((~cairo_raster_source_pattern_get_finish
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_raster_source_pattern_get_finish"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((fht-wrap cairo_raster_source_finish_func_t)
         ((force ~cairo_raster_source_pattern_get_finish)
          ~pattern))))))
(export cairo_raster_source_pattern_get_finish)

;; cairo_pattern_t *cairo_pattern_create_rgb(double red, double green, double 
;;     blue);
(define cairo_pattern_create_rgb
  (let ((~cairo_pattern_create_rgb
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_rgb"
                   (list ffi:double ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (red green blue)
      (let ((~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_rgb)
          ~red
          ~green
          ~blue))))))
(export cairo_pattern_create_rgb)

;; cairo_pattern_t *cairo_pattern_create_rgba(double red, double green, double 
;;     blue, double alpha);
(define cairo_pattern_create_rgba
  (let ((~cairo_pattern_create_rgba
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_rgba"
                   (list ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (red green blue alpha)
      (let ((~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue))
            (~alpha (unwrap~float alpha)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_rgba)
          ~red
          ~green
          ~blue
          ~alpha))))))
(export cairo_pattern_create_rgba)

;; cairo_pattern_t *cairo_pattern_create_for_surface(cairo_surface_t *surface);
;;     
(define cairo_pattern_create_for_surface
  (let ((~cairo_pattern_create_for_surface
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_for_surface"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_for_surface)
          ~surface))))))
(export cairo_pattern_create_for_surface)

;; cairo_pattern_t *cairo_pattern_create_linear(double x0, double y0, double x1
;;     , double y1);
(define cairo_pattern_create_linear
  (let ((~cairo_pattern_create_linear
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_linear"
                   (list ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (x0 y0 x1 y1)
      (let ((~x0 (unwrap~float x0))
            (~y0 (unwrap~float y0))
            (~x1 (unwrap~float x1))
            (~y1 (unwrap~float y1)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_linear)
          ~x0
          ~y0
          ~x1
          ~y1))))))
(export cairo_pattern_create_linear)

;; cairo_pattern_t *cairo_pattern_create_radial(double cx0, double cy0, double 
;;     radius0, double cx1, double cy1, double radius1);
(define cairo_pattern_create_radial
  (let ((~cairo_pattern_create_radial
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_radial"
                   (list ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (cx0 cy0 radius0 cx1 cy1 radius1)
      (let ((~cx0 (unwrap~float cx0))
            (~cy0 (unwrap~float cy0))
            (~radius0 (unwrap~float radius0))
            (~cx1 (unwrap~float cx1))
            (~cy1 (unwrap~float cy1))
            (~radius1 (unwrap~float radius1)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_radial)
          ~cx0
          ~cy0
          ~radius0
          ~cx1
          ~cy1
          ~radius1))))))
(export cairo_pattern_create_radial)

;; cairo_pattern_t *cairo_pattern_create_mesh(void );
(define cairo_pattern_create_mesh
  (let ((~cairo_pattern_create_mesh
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_create_mesh"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let ()
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_create_mesh)))))))
(export cairo_pattern_create_mesh)

;; cairo_pattern_t *cairo_pattern_reference(cairo_pattern_t *pattern);
(define cairo_pattern_reference
  (let ((~cairo_pattern_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((fht-wrap cairo_pattern_t*)
         ((force ~cairo_pattern_reference) ~pattern))))))
(export cairo_pattern_reference)

;; void cairo_pattern_destroy(cairo_pattern_t *pattern);
(define cairo_pattern_destroy
  (let ((~cairo_pattern_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_pattern_destroy) ~pattern)))))
(export cairo_pattern_destroy)

;; unsigned int cairo_pattern_get_reference_count(cairo_pattern_t *pattern);
(define cairo_pattern_get_reference_count
  (let ((~cairo_pattern_get_reference_count
          (delay (fh-link-proc
                   ffi:unsigned-int
                   "cairo_pattern_get_reference_count"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_pattern_get_reference_count)
         ~pattern)))))
(export cairo_pattern_get_reference_count)

;; cairo_status_t cairo_pattern_status(cairo_pattern_t *pattern);
(define cairo_pattern_status
  (let ((~cairo_pattern_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_status) ~pattern))))))
(export cairo_pattern_status)

;; void *cairo_pattern_get_user_data(cairo_pattern_t *pattern, const 
;;     cairo_user_data_key_t *key);
(define cairo_pattern_get_user_data
  (let ((~cairo_pattern_get_user_data
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_pattern_get_user_data"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern key)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~key ((fht-unwrap cairo_user_data_key_t*) key)))
        ((force ~cairo_pattern_get_user_data)
         ~pattern
         ~key)))))
(export cairo_pattern_get_user_data)

;; cairo_status_t cairo_pattern_set_user_data(cairo_pattern_t *pattern, const 
;;     cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t 
;;     destroy);
(define cairo_pattern_set_user_data
  (let ((~cairo_pattern_set_user_data
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_set_user_data"
                   (list ffi-void* ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern key user_data destroy)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~key ((fht-unwrap cairo_user_data_key_t*) key))
            (~user_data (unwrap~pointer user_data))
            (~destroy
              ((fht-unwrap cairo_destroy_func_t) destroy)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_set_user_data)
           ~pattern
           ~key
           ~user_data
           ~destroy))))))
(export cairo_pattern_set_user_data)

;; typedef enum _cairo_pattern_type {
;;   CAIRO_PATTERN_TYPE_SOLID,
;;   CAIRO_PATTERN_TYPE_SURFACE,
;;   CAIRO_PATTERN_TYPE_LINEAR,
;;   CAIRO_PATTERN_TYPE_RADIAL,
;;   CAIRO_PATTERN_TYPE_MESH,
;;   CAIRO_PATTERN_TYPE_RASTER_SOURCE,
;; } cairo_pattern_type_t;
(define cairo_pattern_type_t-enum-nvl
  '((CAIRO_PATTERN_TYPE_SOLID . 0)
    (CAIRO_PATTERN_TYPE_SURFACE . 1)
    (CAIRO_PATTERN_TYPE_LINEAR . 2)
    (CAIRO_PATTERN_TYPE_RADIAL . 3)
    (CAIRO_PATTERN_TYPE_MESH . 4)
    (CAIRO_PATTERN_TYPE_RASTER_SOURCE . 5))
  )
(define cairo_pattern_type_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_pattern_type_t-enum-nvl))
(define-public (unwrap-cairo_pattern_type_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_pattern_type_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_pattern_type_t v)
  (assq-ref cairo_pattern_type_t-enum-vnl v))
(define-public unwrap-enum-_cairo_pattern_type unwrap-cairo_pattern_type_t)
(define-public wrap-enum-_cairo_pattern_type wrap-cairo_pattern_type_t)

;; enum _cairo_pattern_type {
;;   CAIRO_PATTERN_TYPE_SOLID,
;;   CAIRO_PATTERN_TYPE_SURFACE,
;;   CAIRO_PATTERN_TYPE_LINEAR,
;;   CAIRO_PATTERN_TYPE_RADIAL,
;;   CAIRO_PATTERN_TYPE_MESH,
;;   CAIRO_PATTERN_TYPE_RASTER_SOURCE,
;; };

;; cairo_pattern_type_t cairo_pattern_get_type(cairo_pattern_t *pattern);
(define cairo_pattern_get_type
  (let ((~cairo_pattern_get_type
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_type"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        (wrap-cairo_pattern_type_t
          ((force ~cairo_pattern_get_type) ~pattern))))))
(export cairo_pattern_get_type)

;; void cairo_pattern_add_color_stop_rgb(cairo_pattern_t *pattern, double 
;;     offset, double red, double green, double blue);
(define cairo_pattern_add_color_stop_rgb
  (let ((~cairo_pattern_add_color_stop_rgb
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_add_color_stop_rgb"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern offset red green blue)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~offset (unwrap~float offset))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue)))
        ((force ~cairo_pattern_add_color_stop_rgb)
         ~pattern
         ~offset
         ~red
         ~green
         ~blue)))))
(export cairo_pattern_add_color_stop_rgb)

;; void cairo_pattern_add_color_stop_rgba(cairo_pattern_t *pattern, double 
;;     offset, double red, double green, double blue, double alpha);
(define cairo_pattern_add_color_stop_rgba
  (let ((~cairo_pattern_add_color_stop_rgba
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_add_color_stop_rgba"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern offset red green blue alpha)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~offset (unwrap~float offset))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue))
            (~alpha (unwrap~float alpha)))
        ((force ~cairo_pattern_add_color_stop_rgba)
         ~pattern
         ~offset
         ~red
         ~green
         ~blue
         ~alpha)))))
(export cairo_pattern_add_color_stop_rgba)

;; void cairo_mesh_pattern_begin_patch(cairo_pattern_t *pattern);
(define cairo_mesh_pattern_begin_patch
  (let ((~cairo_mesh_pattern_begin_patch
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_begin_patch"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_mesh_pattern_begin_patch)
         ~pattern)))))
(export cairo_mesh_pattern_begin_patch)

;; void cairo_mesh_pattern_end_patch(cairo_pattern_t *pattern);
(define cairo_mesh_pattern_end_patch
  (let ((~cairo_mesh_pattern_end_patch
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_end_patch"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        ((force ~cairo_mesh_pattern_end_patch) ~pattern)))))
(export cairo_mesh_pattern_end_patch)

;; void cairo_mesh_pattern_curve_to(cairo_pattern_t *pattern, double x1, double
;;      y1, double x2, double y2, double x3, double y3);
(define cairo_mesh_pattern_curve_to
  (let ((~cairo_mesh_pattern_curve_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_curve_to"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern x1 y1 x2 y2 x3 y3)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~x1 (unwrap~float x1))
            (~y1 (unwrap~float y1))
            (~x2 (unwrap~float x2))
            (~y2 (unwrap~float y2))
            (~x3 (unwrap~float x3))
            (~y3 (unwrap~float y3)))
        ((force ~cairo_mesh_pattern_curve_to)
         ~pattern
         ~x1
         ~y1
         ~x2
         ~y2
         ~x3
         ~y3)))))
(export cairo_mesh_pattern_curve_to)

;; void cairo_mesh_pattern_line_to(cairo_pattern_t *pattern, double x, double y
;;     );
(define cairo_mesh_pattern_line_to
  (let ((~cairo_mesh_pattern_line_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_line_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern x y)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_mesh_pattern_line_to)
         ~pattern
         ~x
         ~y)))))
(export cairo_mesh_pattern_line_to)

;; void cairo_mesh_pattern_move_to(cairo_pattern_t *pattern, double x, double y
;;     );
(define cairo_mesh_pattern_move_to
  (let ((~cairo_mesh_pattern_move_to
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_move_to"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern x y)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_mesh_pattern_move_to)
         ~pattern
         ~x
         ~y)))))
(export cairo_mesh_pattern_move_to)

;; void cairo_mesh_pattern_set_control_point(cairo_pattern_t *pattern, 
;;     unsigned int point_num, double x, double y);
(define cairo_mesh_pattern_set_control_point
  (let ((~cairo_mesh_pattern_set_control_point
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_set_control_point"
                   (list ffi-void*
                         ffi:unsigned-int
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern point_num x y)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~point_num (unwrap~fixed point_num))
            (~x (unwrap~float x))
            (~y (unwrap~float y)))
        ((force ~cairo_mesh_pattern_set_control_point)
         ~pattern
         ~point_num
         ~x
         ~y)))))
(export cairo_mesh_pattern_set_control_point)

;; void cairo_mesh_pattern_set_corner_color_rgb(cairo_pattern_t *pattern, 
;;     unsigned int corner_num, double red, double green, double blue);
(define cairo_mesh_pattern_set_corner_color_rgb
  (let ((~cairo_mesh_pattern_set_corner_color_rgb
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_set_corner_color_rgb"
                   (list ffi-void*
                         ffi:unsigned-int
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern corner_num red green blue)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~corner_num (unwrap~fixed corner_num))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue)))
        ((force ~cairo_mesh_pattern_set_corner_color_rgb)
         ~pattern
         ~corner_num
         ~red
         ~green
         ~blue)))))
(export cairo_mesh_pattern_set_corner_color_rgb)

;; void cairo_mesh_pattern_set_corner_color_rgba(cairo_pattern_t *pattern, 
;;     unsigned int corner_num, double red, double green, double blue, double 
;;     alpha);
(define cairo_mesh_pattern_set_corner_color_rgba
  (let ((~cairo_mesh_pattern_set_corner_color_rgba
          (delay (fh-link-proc
                   ffi:void
                   "cairo_mesh_pattern_set_corner_color_rgba"
                   (list ffi-void*
                         ffi:unsigned-int
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern corner_num red green blue alpha)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~corner_num (unwrap~fixed corner_num))
            (~red (unwrap~float red))
            (~green (unwrap~float green))
            (~blue (unwrap~float blue))
            (~alpha (unwrap~float alpha)))
        ((force ~cairo_mesh_pattern_set_corner_color_rgba)
         ~pattern
         ~corner_num
         ~red
         ~green
         ~blue
         ~alpha)))))
(export cairo_mesh_pattern_set_corner_color_rgba)

;; void cairo_pattern_set_matrix(cairo_pattern_t *pattern, const cairo_matrix_t
;;      *matrix);
(define cairo_pattern_set_matrix
  (let ((~cairo_pattern_set_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_set_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern matrix)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_pattern_set_matrix)
         ~pattern
         ~matrix)))))
(export cairo_pattern_set_matrix)

;; void cairo_pattern_get_matrix(cairo_pattern_t *pattern, cairo_matrix_t *
;;     matrix);
(define cairo_pattern_get_matrix
  (let ((~cairo_pattern_get_matrix
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_get_matrix"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern matrix)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_pattern_get_matrix)
         ~pattern
         ~matrix)))))
(export cairo_pattern_get_matrix)

;; typedef enum _cairo_extend {
;;   CAIRO_EXTEND_NONE,
;;   CAIRO_EXTEND_REPEAT,
;;   CAIRO_EXTEND_REFLECT,
;;   CAIRO_EXTEND_PAD,
;; } cairo_extend_t;
(define cairo_extend_t-enum-nvl
  '((CAIRO_EXTEND_NONE . 0)
    (CAIRO_EXTEND_REPEAT . 1)
    (CAIRO_EXTEND_REFLECT . 2)
    (CAIRO_EXTEND_PAD . 3))
  )
(define cairo_extend_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_extend_t-enum-nvl))
(define-public (unwrap-cairo_extend_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_extend_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_extend_t v)
  (assq-ref cairo_extend_t-enum-vnl v))
(define-public unwrap-enum-_cairo_extend unwrap-cairo_extend_t)
(define-public wrap-enum-_cairo_extend wrap-cairo_extend_t)

;; enum _cairo_extend {
;;   CAIRO_EXTEND_NONE,
;;   CAIRO_EXTEND_REPEAT,
;;   CAIRO_EXTEND_REFLECT,
;;   CAIRO_EXTEND_PAD,
;; };

;; void cairo_pattern_set_extend(cairo_pattern_t *pattern, cairo_extend_t 
;;     extend);
(define cairo_pattern_set_extend
  (let ((~cairo_pattern_set_extend
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_set_extend"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern extend)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~extend (unwrap-cairo_extend_t extend)))
        ((force ~cairo_pattern_set_extend)
         ~pattern
         ~extend)))))
(export cairo_pattern_set_extend)

;; cairo_extend_t cairo_pattern_get_extend(cairo_pattern_t *pattern);
(define cairo_pattern_get_extend
  (let ((~cairo_pattern_get_extend
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_extend"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        (wrap-cairo_extend_t
          ((force ~cairo_pattern_get_extend) ~pattern))))))
(export cairo_pattern_get_extend)

;; typedef enum _cairo_filter {
;;   CAIRO_FILTER_FAST,
;;   CAIRO_FILTER_GOOD,
;;   CAIRO_FILTER_BEST,
;;   CAIRO_FILTER_NEAREST,
;;   CAIRO_FILTER_BILINEAR,
;;   CAIRO_FILTER_GAUSSIAN,
;; } cairo_filter_t;
(define cairo_filter_t-enum-nvl
  '((CAIRO_FILTER_FAST . 0)
    (CAIRO_FILTER_GOOD . 1)
    (CAIRO_FILTER_BEST . 2)
    (CAIRO_FILTER_NEAREST . 3)
    (CAIRO_FILTER_BILINEAR . 4)
    (CAIRO_FILTER_GAUSSIAN . 5))
  )
(define cairo_filter_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_filter_t-enum-nvl))
(define-public (unwrap-cairo_filter_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_filter_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_filter_t v)
  (assq-ref cairo_filter_t-enum-vnl v))
(define-public unwrap-enum-_cairo_filter unwrap-cairo_filter_t)
(define-public wrap-enum-_cairo_filter wrap-cairo_filter_t)

;; enum _cairo_filter {
;;   CAIRO_FILTER_FAST,
;;   CAIRO_FILTER_GOOD,
;;   CAIRO_FILTER_BEST,
;;   CAIRO_FILTER_NEAREST,
;;   CAIRO_FILTER_BILINEAR,
;;   CAIRO_FILTER_GAUSSIAN,
;; };

;; void cairo_pattern_set_filter(cairo_pattern_t *pattern, cairo_filter_t 
;;     filter);
(define cairo_pattern_set_filter
  (let ((~cairo_pattern_set_filter
          (delay (fh-link-proc
                   ffi:void
                   "cairo_pattern_set_filter"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern filter)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~filter (unwrap-cairo_filter_t filter)))
        ((force ~cairo_pattern_set_filter)
         ~pattern
         ~filter)))))
(export cairo_pattern_set_filter)

;; cairo_filter_t cairo_pattern_get_filter(cairo_pattern_t *pattern);
(define cairo_pattern_get_filter
  (let ((~cairo_pattern_get_filter
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_filter"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern)))
        (wrap-cairo_filter_t
          ((force ~cairo_pattern_get_filter) ~pattern))))))
(export cairo_pattern_get_filter)

;; cairo_status_t cairo_pattern_get_rgba(cairo_pattern_t *pattern, double *red
;;     , double *green, double *blue, double *alpha);
(define cairo_pattern_get_rgba
  (let ((~cairo_pattern_get_rgba
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_rgba"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern red green blue alpha)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~red (unwrap~pointer red))
            (~green (unwrap~pointer green))
            (~blue (unwrap~pointer blue))
            (~alpha (unwrap~pointer alpha)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_rgba)
           ~pattern
           ~red
           ~green
           ~blue
           ~alpha))))))
(export cairo_pattern_get_rgba)

;; cairo_status_t cairo_pattern_get_surface(cairo_pattern_t *pattern, 
;;     cairo_surface_t **surface);
(define cairo_pattern_get_surface
  (let ((~cairo_pattern_get_surface
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_surface"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern surface)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~surface (unwrap~pointer surface)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_surface)
           ~pattern
           ~surface))))))
(export cairo_pattern_get_surface)

;; cairo_status_t cairo_pattern_get_color_stop_rgba(cairo_pattern_t *pattern, 
;;     int index, double *offset, double *red, double *green, double *blue, 
;;     double *alpha);
(define cairo_pattern_get_color_stop_rgba
  (let ((~cairo_pattern_get_color_stop_rgba
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_color_stop_rgba"
                   (list ffi-void*
                         ffi:int
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern index offset red green blue alpha)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~index (unwrap~fixed index))
            (~offset (unwrap~pointer offset))
            (~red (unwrap~pointer red))
            (~green (unwrap~pointer green))
            (~blue (unwrap~pointer blue))
            (~alpha (unwrap~pointer alpha)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_color_stop_rgba)
           ~pattern
           ~index
           ~offset
           ~red
           ~green
           ~blue
           ~alpha))))))
(export cairo_pattern_get_color_stop_rgba)

;; cairo_status_t cairo_pattern_get_color_stop_count(cairo_pattern_t *pattern, 
;;     int *count);
(define cairo_pattern_get_color_stop_count
  (let ((~cairo_pattern_get_color_stop_count
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_color_stop_count"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern count)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~count (unwrap~pointer count)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_color_stop_count)
           ~pattern
           ~count))))))
(export cairo_pattern_get_color_stop_count)

;; cairo_status_t cairo_pattern_get_linear_points(cairo_pattern_t *pattern, 
;;     double *x0, double *y0, double *x1, double *y1);
(define cairo_pattern_get_linear_points
  (let ((~cairo_pattern_get_linear_points
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_linear_points"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern x0 y0 x1 y1)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~x0 (unwrap~pointer x0))
            (~y0 (unwrap~pointer y0))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_linear_points)
           ~pattern
           ~x0
           ~y0
           ~x1
           ~y1))))))
(export cairo_pattern_get_linear_points)

;; cairo_status_t cairo_pattern_get_radial_circles(cairo_pattern_t *pattern, 
;;     double *x0, double *y0, double *r0, double *x1, double *y1, double *r1);
;;     
(define cairo_pattern_get_radial_circles
  (let ((~cairo_pattern_get_radial_circles
          (delay (fh-link-proc
                   ffi:int
                   "cairo_pattern_get_radial_circles"
                   (list ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern x0 y0 r0 x1 y1 r1)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~x0 (unwrap~pointer x0))
            (~y0 (unwrap~pointer y0))
            (~r0 (unwrap~pointer r0))
            (~x1 (unwrap~pointer x1))
            (~y1 (unwrap~pointer y1))
            (~r1 (unwrap~pointer r1)))
        (wrap-cairo_status_t
          ((force ~cairo_pattern_get_radial_circles)
           ~pattern
           ~x0
           ~y0
           ~r0
           ~x1
           ~y1
           ~r1))))))
(export cairo_pattern_get_radial_circles)

;; cairo_status_t cairo_mesh_pattern_get_patch_count(cairo_pattern_t *pattern, 
;;     unsigned int *count);
(define cairo_mesh_pattern_get_patch_count
  (let ((~cairo_mesh_pattern_get_patch_count
          (delay (fh-link-proc
                   ffi:int
                   "cairo_mesh_pattern_get_patch_count"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern count)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~count (unwrap~pointer count)))
        (wrap-cairo_status_t
          ((force ~cairo_mesh_pattern_get_patch_count)
           ~pattern
           ~count))))))
(export cairo_mesh_pattern_get_patch_count)

;; cairo_path_t *cairo_mesh_pattern_get_path(cairo_pattern_t *pattern, 
;;     unsigned int patch_num);
(define cairo_mesh_pattern_get_path
  (let ((~cairo_mesh_pattern_get_path
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_mesh_pattern_get_path"
                   (list ffi-void* ffi:unsigned-int)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern patch_num)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~patch_num (unwrap~fixed patch_num)))
        ((fht-wrap cairo_path_t*)
         ((force ~cairo_mesh_pattern_get_path)
          ~pattern
          ~patch_num))))))
(export cairo_mesh_pattern_get_path)

;; cairo_status_t cairo_mesh_pattern_get_corner_color_rgba(cairo_pattern_t *
;;     pattern, unsigned int patch_num, unsigned int corner_num, double *red, 
;;     double *green, double *blue, double *alpha);
(define cairo_mesh_pattern_get_corner_color_rgba
  (let ((~cairo_mesh_pattern_get_corner_color_rgba
          (delay (fh-link-proc
                   ffi:int
                   "cairo_mesh_pattern_get_corner_color_rgba"
                   (list ffi-void*
                         ffi:unsigned-int
                         ffi:unsigned-int
                         ffi-void*
                         ffi-void*
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern
             patch_num
             corner_num
             red
             green
             blue
             alpha)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~patch_num (unwrap~fixed patch_num))
            (~corner_num (unwrap~fixed corner_num))
            (~red (unwrap~pointer red))
            (~green (unwrap~pointer green))
            (~blue (unwrap~pointer blue))
            (~alpha (unwrap~pointer alpha)))
        (wrap-cairo_status_t
          ((force ~cairo_mesh_pattern_get_corner_color_rgba)
           ~pattern
           ~patch_num
           ~corner_num
           ~red
           ~green
           ~blue
           ~alpha))))))
(export cairo_mesh_pattern_get_corner_color_rgba)

;; cairo_status_t cairo_mesh_pattern_get_control_point(cairo_pattern_t *pattern
;;     , unsigned int patch_num, unsigned int point_num, double *x, double *y);
;;     
(define cairo_mesh_pattern_get_control_point
  (let ((~cairo_mesh_pattern_get_control_point
          (delay (fh-link-proc
                   ffi:int
                   "cairo_mesh_pattern_get_control_point"
                   (list ffi-void*
                         ffi:unsigned-int
                         ffi:unsigned-int
                         ffi-void*
                         ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (pattern patch_num point_num x y)
      (let ((~pattern
              ((fht-unwrap cairo_pattern_t*) pattern))
            (~patch_num (unwrap~fixed patch_num))
            (~point_num (unwrap~fixed point_num))
            (~x (unwrap~pointer x))
            (~y (unwrap~pointer y)))
        (wrap-cairo_status_t
          ((force ~cairo_mesh_pattern_get_control_point)
           ~pattern
           ~patch_num
           ~point_num
           ~x
           ~y))))))
(export cairo_mesh_pattern_get_control_point)

;; void cairo_matrix_init(cairo_matrix_t *matrix, double xx, double yx, double 
;;     xy, double yy, double x0, double y0);
(define cairo_matrix_init
  (let ((~cairo_matrix_init
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_init"
                   (list ffi-void*
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double
                         ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix xx yx xy yy x0 y0)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~xx (unwrap~float xx))
            (~yx (unwrap~float yx))
            (~xy (unwrap~float xy))
            (~yy (unwrap~float yy))
            (~x0 (unwrap~float x0))
            (~y0 (unwrap~float y0)))
        ((force ~cairo_matrix_init)
         ~matrix
         ~xx
         ~yx
         ~xy
         ~yy
         ~x0
         ~y0)))))
(export cairo_matrix_init)

;; void cairo_matrix_init_identity(cairo_matrix_t *matrix);
(define cairo_matrix_init_identity
  (let ((~cairo_matrix_init_identity
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_init_identity"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        ((force ~cairo_matrix_init_identity) ~matrix)))))
(export cairo_matrix_init_identity)

;; void cairo_matrix_init_translate(cairo_matrix_t *matrix, double tx, double 
;;     ty);
(define cairo_matrix_init_translate
  (let ((~cairo_matrix_init_translate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_init_translate"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix tx ty)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~tx (unwrap~float tx))
            (~ty (unwrap~float ty)))
        ((force ~cairo_matrix_init_translate)
         ~matrix
         ~tx
         ~ty)))))
(export cairo_matrix_init_translate)

;; void cairo_matrix_init_scale(cairo_matrix_t *matrix, double sx, double sy);
(define cairo_matrix_init_scale
  (let ((~cairo_matrix_init_scale
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_init_scale"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix sx sy)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~sx (unwrap~float sx))
            (~sy (unwrap~float sy)))
        ((force ~cairo_matrix_init_scale)
         ~matrix
         ~sx
         ~sy)))))
(export cairo_matrix_init_scale)

;; void cairo_matrix_init_rotate(cairo_matrix_t *matrix, double radians);
(define cairo_matrix_init_rotate
  (let ((~cairo_matrix_init_rotate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_init_rotate"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix radians)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~radians (unwrap~float radians)))
        ((force ~cairo_matrix_init_rotate)
         ~matrix
         ~radians)))))
(export cairo_matrix_init_rotate)

;; void cairo_matrix_translate(cairo_matrix_t *matrix, double tx, double ty);
(define cairo_matrix_translate
  (let ((~cairo_matrix_translate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_translate"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix tx ty)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~tx (unwrap~float tx))
            (~ty (unwrap~float ty)))
        ((force ~cairo_matrix_translate) ~matrix ~tx ~ty)))))
(export cairo_matrix_translate)

;; void cairo_matrix_scale(cairo_matrix_t *matrix, double sx, double sy);
(define cairo_matrix_scale
  (let ((~cairo_matrix_scale
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_scale"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix sx sy)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~sx (unwrap~float sx))
            (~sy (unwrap~float sy)))
        ((force ~cairo_matrix_scale) ~matrix ~sx ~sy)))))
(export cairo_matrix_scale)

;; void cairo_matrix_rotate(cairo_matrix_t *matrix, double radians);
(define cairo_matrix_rotate
  (let ((~cairo_matrix_rotate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_rotate"
                   (list ffi-void* ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix radians)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~radians (unwrap~float radians)))
        ((force ~cairo_matrix_rotate) ~matrix ~radians)))))
(export cairo_matrix_rotate)

;; cairo_status_t cairo_matrix_invert(cairo_matrix_t *matrix);
(define cairo_matrix_invert
  (let ((~cairo_matrix_invert
          (delay (fh-link-proc
                   ffi:int
                   "cairo_matrix_invert"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix)))
        (wrap-cairo_status_t
          ((force ~cairo_matrix_invert) ~matrix))))))
(export cairo_matrix_invert)

;; void cairo_matrix_multiply(cairo_matrix_t *result, const cairo_matrix_t *a, 
;;     const cairo_matrix_t *b);
(define cairo_matrix_multiply
  (let ((~cairo_matrix_multiply
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_multiply"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (result a b)
      (let ((~result ((fht-unwrap cairo_matrix_t*) result))
            (~a ((fht-unwrap cairo_matrix_t*) a))
            (~b ((fht-unwrap cairo_matrix_t*) b)))
        ((force ~cairo_matrix_multiply) ~result ~a ~b)))))
(export cairo_matrix_multiply)

;; void cairo_matrix_transform_distance(const cairo_matrix_t *matrix, double *
;;     dx, double *dy);
(define cairo_matrix_transform_distance
  (let ((~cairo_matrix_transform_distance
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_transform_distance"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix dx dy)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~dx (unwrap~pointer dx))
            (~dy (unwrap~pointer dy)))
        ((force ~cairo_matrix_transform_distance)
         ~matrix
         ~dx
         ~dy)))))
(export cairo_matrix_transform_distance)

;; void cairo_matrix_transform_point(const cairo_matrix_t *matrix, double *x, 
;;     double *y);
(define cairo_matrix_transform_point
  (let ((~cairo_matrix_transform_point
          (delay (fh-link-proc
                   ffi:void
                   "cairo_matrix_transform_point"
                   (list ffi-void* ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (matrix x y)
      (let ((~matrix ((fht-unwrap cairo_matrix_t*) matrix))
            (~x (unwrap~pointer x))
            (~y (unwrap~pointer y)))
        ((force ~cairo_matrix_transform_point)
         ~matrix
         ~x
         ~y)))))
(export cairo_matrix_transform_point)

;; typedef struct _cairo_region cairo_region_t;
(define-public cairo_region_t-desc 'void)
(define-fh-type-alias cairo_region_t fh-void)
(define-public cairo_region_t? fh-void?)
(define-public make-cairo_region_t make-fh-void)
(define-public cairo_region_t*-desc (fh:pointer cairo_region_t-desc))
(define-fh-pointer-type cairo_region_t* cairo_region_t*-desc cairo_region_t*? 
 make-cairo_region_t*)
(export cairo_region_t* cairo_region_t*? make-cairo_region_t*)

;; typedef enum _cairo_region_overlap {
;;   CAIRO_REGION_OVERLAP_IN,
;;   CAIRO_REGION_OVERLAP_OUT,
;;   CAIRO_REGION_OVERLAP_PART,
;; } cairo_region_overlap_t;
(define cairo_region_overlap_t-enum-nvl
  '((CAIRO_REGION_OVERLAP_IN . 0)
    (CAIRO_REGION_OVERLAP_OUT . 1)
    (CAIRO_REGION_OVERLAP_PART . 2))
  )
(define cairo_region_overlap_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_region_overlap_t-enum-nvl))
(define-public (unwrap-cairo_region_overlap_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_region_overlap_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_region_overlap_t v)
  (assq-ref cairo_region_overlap_t-enum-vnl v))
(define-public unwrap-enum-_cairo_region_overlap unwrap-cairo_region_overlap_t)
(define-public wrap-enum-_cairo_region_overlap wrap-cairo_region_overlap_t)

;; enum _cairo_region_overlap {
;;   CAIRO_REGION_OVERLAP_IN,
;;   CAIRO_REGION_OVERLAP_OUT,
;;   CAIRO_REGION_OVERLAP_PART,
;; };

;; cairo_region_t *cairo_region_create(void );
(define cairo_region_create
  (let ((~cairo_region_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_region_create"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let ()
        ((fht-wrap cairo_region_t*)
         ((force ~cairo_region_create)))))))
(export cairo_region_create)

;; cairo_region_t *cairo_region_create_rectangle(const cairo_rectangle_int_t *
;;     rectangle);
(define cairo_region_create_rectangle
  (let ((~cairo_region_create_rectangle
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_region_create_rectangle"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (rectangle)
      (let ((~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        ((fht-wrap cairo_region_t*)
         ((force ~cairo_region_create_rectangle)
          ~rectangle))))))
(export cairo_region_create_rectangle)

;; cairo_region_t *cairo_region_create_rectangles(const cairo_rectangle_int_t *
;;     rects, int count);
(define cairo_region_create_rectangles
  (let ((~cairo_region_create_rectangles
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_region_create_rectangles"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (rects count)
      (let ((~rects
              ((fht-unwrap cairo_rectangle_int_t*) rects))
            (~count (unwrap~fixed count)))
        ((fht-wrap cairo_region_t*)
         ((force ~cairo_region_create_rectangles)
          ~rects
          ~count))))))
(export cairo_region_create_rectangles)

;; cairo_region_t *cairo_region_copy(const cairo_region_t *original);
(define cairo_region_copy
  (let ((~cairo_region_copy
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_region_copy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (original)
      (let ((~original
              ((fht-unwrap cairo_region_t*) original)))
        ((fht-wrap cairo_region_t*)
         ((force ~cairo_region_copy) ~original))))))
(export cairo_region_copy)

;; cairo_region_t *cairo_region_reference(cairo_region_t *region);
(define cairo_region_reference
  (let ((~cairo_region_reference
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_region_reference"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region)
      (let ((~region ((fht-unwrap cairo_region_t*) region)))
        ((fht-wrap cairo_region_t*)
         ((force ~cairo_region_reference) ~region))))))
(export cairo_region_reference)

;; void cairo_region_destroy(cairo_region_t *region);
(define cairo_region_destroy
  (let ((~cairo_region_destroy
          (delay (fh-link-proc
                   ffi:void
                   "cairo_region_destroy"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region)
      (let ((~region ((fht-unwrap cairo_region_t*) region)))
        ((force ~cairo_region_destroy) ~region)))))
(export cairo_region_destroy)

;; cairo_bool_t cairo_region_equal(const cairo_region_t *a, const 
;;     cairo_region_t *b);
(define cairo_region_equal
  (let ((~cairo_region_equal
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_equal"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (a b)
      (let ((~a ((fht-unwrap cairo_region_t*) a))
            (~b ((fht-unwrap cairo_region_t*) b)))
        ((force ~cairo_region_equal) ~a ~b)))))
(export cairo_region_equal)

;; cairo_status_t cairo_region_status(const cairo_region_t *region);
(define cairo_region_status
  (let ((~cairo_region_status
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_status"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region)
      (let ((~region ((fht-unwrap cairo_region_t*) region)))
        (wrap-cairo_status_t
          ((force ~cairo_region_status) ~region))))))
(export cairo_region_status)

;; void cairo_region_get_extents(const cairo_region_t *region, 
;;     cairo_rectangle_int_t *extents);
(define cairo_region_get_extents
  (let ((~cairo_region_get_extents
          (delay (fh-link-proc
                   ffi:void
                   "cairo_region_get_extents"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region extents)
      (let ((~region ((fht-unwrap cairo_region_t*) region))
            (~extents
              ((fht-unwrap cairo_rectangle_int_t*) extents)))
        ((force ~cairo_region_get_extents)
         ~region
         ~extents)))))
(export cairo_region_get_extents)

;; int cairo_region_num_rectangles(const cairo_region_t *region);
(define cairo_region_num_rectangles
  (let ((~cairo_region_num_rectangles
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_num_rectangles"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region)
      (let ((~region ((fht-unwrap cairo_region_t*) region)))
        ((force ~cairo_region_num_rectangles) ~region)))))
(export cairo_region_num_rectangles)

;; void cairo_region_get_rectangle(const cairo_region_t *region, int nth, 
;;     cairo_rectangle_int_t *rectangle);
(define cairo_region_get_rectangle
  (let ((~cairo_region_get_rectangle
          (delay (fh-link-proc
                   ffi:void
                   "cairo_region_get_rectangle"
                   (list ffi-void* ffi:int ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region nth rectangle)
      (let ((~region ((fht-unwrap cairo_region_t*) region))
            (~nth (unwrap~fixed nth))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        ((force ~cairo_region_get_rectangle)
         ~region
         ~nth
         ~rectangle)))))
(export cairo_region_get_rectangle)

;; cairo_bool_t cairo_region_is_empty(const cairo_region_t *region);
(define cairo_region_is_empty
  (let ((~cairo_region_is_empty
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_is_empty"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region)
      (let ((~region ((fht-unwrap cairo_region_t*) region)))
        ((force ~cairo_region_is_empty) ~region)))))
(export cairo_region_is_empty)

;; cairo_region_overlap_t cairo_region_contains_rectangle(const cairo_region_t 
;;     *region, const cairo_rectangle_int_t *rectangle);
(define cairo_region_contains_rectangle
  (let ((~cairo_region_contains_rectangle
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_contains_rectangle"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (region rectangle)
      (let ((~region ((fht-unwrap cairo_region_t*) region))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        (wrap-cairo_region_overlap_t
          ((force ~cairo_region_contains_rectangle)
           ~region
           ~rectangle))))))
(export cairo_region_contains_rectangle)

;; cairo_bool_t cairo_region_contains_point(const cairo_region_t *region, int x
;;     , int y);
(define cairo_region_contains_point
  (let ((~cairo_region_contains_point
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_contains_point"
                   (list ffi-void* ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (region x y)
      (let ((~region ((fht-unwrap cairo_region_t*) region))
            (~x (unwrap~fixed x))
            (~y (unwrap~fixed y)))
        ((force ~cairo_region_contains_point)
         ~region
         ~x
         ~y)))))
(export cairo_region_contains_point)

;; void cairo_region_translate(cairo_region_t *region, int dx, int dy);
(define cairo_region_translate
  (let ((~cairo_region_translate
          (delay (fh-link-proc
                   ffi:void
                   "cairo_region_translate"
                   (list ffi-void* ffi:int ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (region dx dy)
      (let ((~region ((fht-unwrap cairo_region_t*) region))
            (~dx (unwrap~fixed dx))
            (~dy (unwrap~fixed dy)))
        ((force ~cairo_region_translate) ~region ~dx ~dy)))))
(export cairo_region_translate)

;; cairo_status_t cairo_region_subtract(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define cairo_region_subtract
  (let ((~cairo_region_subtract
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_subtract"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst other)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~other ((fht-unwrap cairo_region_t*) other)))
        (wrap-cairo_status_t
          ((force ~cairo_region_subtract) ~dst ~other))))))
(export cairo_region_subtract)

;; cairo_status_t cairo_region_subtract_rectangle(cairo_region_t *dst, const 
;;     cairo_rectangle_int_t *rectangle);
(define cairo_region_subtract_rectangle
  (let ((~cairo_region_subtract_rectangle
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_subtract_rectangle"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst rectangle)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        (wrap-cairo_status_t
          ((force ~cairo_region_subtract_rectangle)
           ~dst
           ~rectangle))))))
(export cairo_region_subtract_rectangle)

;; cairo_status_t cairo_region_intersect(cairo_region_t *dst, const 
;;     cairo_region_t *other);
(define cairo_region_intersect
  (let ((~cairo_region_intersect
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_intersect"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst other)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~other ((fht-unwrap cairo_region_t*) other)))
        (wrap-cairo_status_t
          ((force ~cairo_region_intersect) ~dst ~other))))))
(export cairo_region_intersect)

;; cairo_status_t cairo_region_intersect_rectangle(cairo_region_t *dst, const 
;;     cairo_rectangle_int_t *rectangle);
(define cairo_region_intersect_rectangle
  (let ((~cairo_region_intersect_rectangle
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_intersect_rectangle"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst rectangle)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        (wrap-cairo_status_t
          ((force ~cairo_region_intersect_rectangle)
           ~dst
           ~rectangle))))))
(export cairo_region_intersect_rectangle)

;; cairo_status_t cairo_region_union(cairo_region_t *dst, const cairo_region_t 
;;     *other);
(define cairo_region_union
  (let ((~cairo_region_union
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_union"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst other)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~other ((fht-unwrap cairo_region_t*) other)))
        (wrap-cairo_status_t
          ((force ~cairo_region_union) ~dst ~other))))))
(export cairo_region_union)

;; cairo_status_t cairo_region_union_rectangle(cairo_region_t *dst, const 
;;     cairo_rectangle_int_t *rectangle);
(define cairo_region_union_rectangle
  (let ((~cairo_region_union_rectangle
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_union_rectangle"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst rectangle)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        (wrap-cairo_status_t
          ((force ~cairo_region_union_rectangle)
           ~dst
           ~rectangle))))))
(export cairo_region_union_rectangle)

;; cairo_status_t cairo_region_xor(cairo_region_t *dst, const cairo_region_t *
;;     other);
(define cairo_region_xor
  (let ((~cairo_region_xor
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_xor"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst other)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~other ((fht-unwrap cairo_region_t*) other)))
        (wrap-cairo_status_t
          ((force ~cairo_region_xor) ~dst ~other))))))
(export cairo_region_xor)

;; cairo_status_t cairo_region_xor_rectangle(cairo_region_t *dst, const 
;;     cairo_rectangle_int_t *rectangle);
(define cairo_region_xor_rectangle
  (let ((~cairo_region_xor_rectangle
          (delay (fh-link-proc
                   ffi:int
                   "cairo_region_xor_rectangle"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (dst rectangle)
      (let ((~dst ((fht-unwrap cairo_region_t*) dst))
            (~rectangle
              ((fht-unwrap cairo_rectangle_int_t*) rectangle)))
        (wrap-cairo_status_t
          ((force ~cairo_region_xor_rectangle)
           ~dst
           ~rectangle))))))
(export cairo_region_xor_rectangle)

;; void cairo_debug_reset_static_data(void );
(define cairo_debug_reset_static_data
  (let ((~cairo_debug_reset_static_data
          (delay (fh-link-proc
                   ffi:void
                   "cairo_debug_reset_static_data"
                   (list)
                   (force ffi-cairo-llibs)))))
    (lambda ()
      (let () ((force ~cairo_debug_reset_static_data))))))
(export cairo_debug_reset_static_data)

;; typedef enum _cairo_svg_version {
;;   CAIRO_SVG_VERSION_1_1,
;;   CAIRO_SVG_VERSION_1_2,
;; } cairo_svg_version_t;
(define cairo_svg_version_t-enum-nvl
  '((CAIRO_SVG_VERSION_1_1 . 0)
    (CAIRO_SVG_VERSION_1_2 . 1))
  )
(define cairo_svg_version_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_svg_version_t-enum-nvl))
(define-public (unwrap-cairo_svg_version_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_svg_version_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_svg_version_t v)
  (assq-ref cairo_svg_version_t-enum-vnl v))
(define-public unwrap-enum-_cairo_svg_version unwrap-cairo_svg_version_t)
(define-public wrap-enum-_cairo_svg_version wrap-cairo_svg_version_t)

;; enum _cairo_svg_version {
;;   CAIRO_SVG_VERSION_1_1,
;;   CAIRO_SVG_VERSION_1_2,
;; };

;; typedef enum _cairo_svg_unit {
;;   CAIRO_SVG_UNIT_USER = 0,
;;   CAIRO_SVG_UNIT_EM,
;;   CAIRO_SVG_UNIT_EX,
;;   CAIRO_SVG_UNIT_PX,
;;   CAIRO_SVG_UNIT_IN,
;;   CAIRO_SVG_UNIT_CM,
;;   CAIRO_SVG_UNIT_MM,
;;   CAIRO_SVG_UNIT_PT,
;;   CAIRO_SVG_UNIT_PC,
;;   CAIRO_SVG_UNIT_PERCENT,
;; } cairo_svg_unit_t;
(define cairo_svg_unit_t-enum-nvl
  '((CAIRO_SVG_UNIT_USER . 0)
    (CAIRO_SVG_UNIT_EM . 1)
    (CAIRO_SVG_UNIT_EX . 2)
    (CAIRO_SVG_UNIT_PX . 3)
    (CAIRO_SVG_UNIT_IN . 4)
    (CAIRO_SVG_UNIT_CM . 5)
    (CAIRO_SVG_UNIT_MM . 6)
    (CAIRO_SVG_UNIT_PT . 7)
    (CAIRO_SVG_UNIT_PC . 8)
    (CAIRO_SVG_UNIT_PERCENT . 9))
  )
(define cairo_svg_unit_t-enum-vnl
  (map (lambda (pair) (cons (cdr pair) (car pair)))
       cairo_svg_unit_t-enum-nvl))
(define-public (unwrap-cairo_svg_unit_t n)
  (cond
   ((symbol? n)
    (or (assq-ref cairo_svg_unit_t-enum-nvl n)
        (throw 'ffi-help-error "bad arg: ~A" n)))
   ((integer? n) n)
   (else (error "bad arg"))))
(define-public (wrap-cairo_svg_unit_t v)
  (assq-ref cairo_svg_unit_t-enum-vnl v))
(define-public unwrap-enum-_cairo_svg_unit unwrap-cairo_svg_unit_t)
(define-public wrap-enum-_cairo_svg_unit wrap-cairo_svg_unit_t)

;; enum _cairo_svg_unit {
;;   CAIRO_SVG_UNIT_USER = 0,
;;   CAIRO_SVG_UNIT_EM,
;;   CAIRO_SVG_UNIT_EX,
;;   CAIRO_SVG_UNIT_PX,
;;   CAIRO_SVG_UNIT_IN,
;;   CAIRO_SVG_UNIT_CM,
;;   CAIRO_SVG_UNIT_MM,
;;   CAIRO_SVG_UNIT_PT,
;;   CAIRO_SVG_UNIT_PC,
;;   CAIRO_SVG_UNIT_PERCENT,
;; };

;; cairo_surface_t *cairo_svg_surface_create(const char *filename, double 
;;     width_in_points, double height_in_points);
(define cairo_svg_surface_create
  (let ((~cairo_svg_surface_create
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_svg_surface_create"
                   (list ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (filename width_in_points height_in_points)
      (let ((~filename (unwrap~pointer filename))
            (~width_in_points (unwrap~float width_in_points))
            (~height_in_points
              (unwrap~float height_in_points)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_svg_surface_create)
          ~filename
          ~width_in_points
          ~height_in_points))))))
(export cairo_svg_surface_create)

;; cairo_surface_t *cairo_svg_surface_create_for_stream(cairo_write_func_t 
;;     write_func, void *closure, double width_in_points, double 
;;     height_in_points);
(define cairo_svg_surface_create_for_stream
  (let ((~cairo_svg_surface_create_for_stream
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_svg_surface_create_for_stream"
                   (list ffi-void* ffi-void* ffi:double ffi:double)
                   (force ffi-cairo-llibs)))))
    (lambda (write_func
             closure
             width_in_points
             height_in_points)
      (let ((~write_func
              ((fht-unwrap cairo_write_func_t) write_func))
            (~closure (unwrap~pointer closure))
            (~width_in_points (unwrap~float width_in_points))
            (~height_in_points
              (unwrap~float height_in_points)))
        ((fht-wrap cairo_surface_t*)
         ((force ~cairo_svg_surface_create_for_stream)
          ~write_func
          ~closure
          ~width_in_points
          ~height_in_points))))))
(export cairo_svg_surface_create_for_stream)

;; void cairo_svg_surface_restrict_to_version(cairo_surface_t *surface, 
;;     cairo_svg_version_t version);
(define cairo_svg_surface_restrict_to_version
  (let ((~cairo_svg_surface_restrict_to_version
          (delay (fh-link-proc
                   ffi:void
                   "cairo_svg_surface_restrict_to_version"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (surface version)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~version (unwrap-cairo_svg_version_t version)))
        ((force ~cairo_svg_surface_restrict_to_version)
         ~surface
         ~version)))))
(export cairo_svg_surface_restrict_to_version)

;; void cairo_svg_get_versions(cairo_svg_version_t const **versions, int *
;;     num_versions);
(define cairo_svg_get_versions
  (let ((~cairo_svg_get_versions
          (delay (fh-link-proc
                   ffi:void
                   "cairo_svg_get_versions"
                   (list ffi-void* ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (versions num_versions)
      (let ((~versions (unwrap~pointer versions))
            (~num_versions (unwrap~pointer num_versions)))
        ((force ~cairo_svg_get_versions)
         ~versions
         ~num_versions)))))
(export cairo_svg_get_versions)

;; const char *cairo_svg_version_to_string(cairo_svg_version_t version);
(define cairo_svg_version_to_string
  (let ((~cairo_svg_version_to_string
          (delay (fh-link-proc
                   ffi-void*
                   "cairo_svg_version_to_string"
                   (list ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (version)
      (let ((~version (unwrap-cairo_svg_version_t version)))
        ((force ~cairo_svg_version_to_string) ~version)))))
(export cairo_svg_version_to_string)

;; void cairo_svg_surface_set_document_unit(cairo_surface_t *surface, 
;;     cairo_svg_unit_t unit);
(define cairo_svg_surface_set_document_unit
  (let ((~cairo_svg_surface_set_document_unit
          (delay (fh-link-proc
                   ffi:void
                   "cairo_svg_surface_set_document_unit"
                   (list ffi-void* ffi:int)
                   (force ffi-cairo-llibs)))))
    (lambda (surface unit)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface))
            (~unit (unwrap-cairo_svg_unit_t unit)))
        ((force ~cairo_svg_surface_set_document_unit)
         ~surface
         ~unit)))))
(export cairo_svg_surface_set_document_unit)

;; cairo_svg_unit_t cairo_svg_surface_get_document_unit(cairo_surface_t *
;;     surface);
(define cairo_svg_surface_get_document_unit
  (let ((~cairo_svg_surface_get_document_unit
          (delay (fh-link-proc
                   ffi:int
                   "cairo_svg_surface_get_document_unit"
                   (list ffi-void*)
                   (force ffi-cairo-llibs)))))
    (lambda (surface)
      (let ((~surface
              ((fht-unwrap cairo_surface_t*) surface)))
        (wrap-cairo_svg_unit_t
          ((force ~cairo_svg_surface_get_document_unit)
           ~surface))))))
(export cairo_svg_surface_get_document_unit)

;; access to enum symbols and #define'd constants:
(define ffi-cairo-symbol-tab
  '((CAIRO_SVG_UNIT_PERCENT . 9)
    (CAIRO_SVG_UNIT_PC . 8)
    (CAIRO_SVG_UNIT_PT . 7)
    (CAIRO_SVG_UNIT_MM . 6)
    (CAIRO_SVG_UNIT_CM . 5)
    (CAIRO_SVG_UNIT_IN . 4)
    (CAIRO_SVG_UNIT_PX . 3)
    (CAIRO_SVG_UNIT_EX . 2)
    (CAIRO_SVG_UNIT_EM . 1)
    (CAIRO_SVG_UNIT_USER . 0)
    (CAIRO_SVG_UNIT_PERCENT . 9)
    (CAIRO_SVG_UNIT_PC . 8)
    (CAIRO_SVG_UNIT_PT . 7)
    (CAIRO_SVG_UNIT_MM . 6)
    (CAIRO_SVG_UNIT_CM . 5)
    (CAIRO_SVG_UNIT_IN . 4)
    (CAIRO_SVG_UNIT_PX . 3)
    (CAIRO_SVG_UNIT_EX . 2)
    (CAIRO_SVG_UNIT_EM . 1)
    (CAIRO_SVG_UNIT_USER . 0)
    (CAIRO_SVG_VERSION_1_2 . 1)
    (CAIRO_SVG_VERSION_1_1 . 0)
    (CAIRO_SVG_VERSION_1_2 . 1)
    (CAIRO_SVG_VERSION_1_1 . 0)
    (CAIRO_REGION_OVERLAP_PART . 2)
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
    (CAIRO_FONT_TYPE_USER . 4)
    (CAIRO_FONT_TYPE_QUARTZ . 3)
    (CAIRO_FONT_TYPE_WIN32 . 2)
    (CAIRO_FONT_TYPE_FT . 1)
    (CAIRO_FONT_TYPE_TOY . 0)
    (CAIRO_FONT_TYPE_USER . 4)
    (CAIRO_FONT_TYPE_QUARTZ . 3)
    (CAIRO_FONT_TYPE_WIN32 . 2)
    (CAIRO_FONT_TYPE_FT . 1)
    (CAIRO_FONT_TYPE_TOY . 0)
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
    (CAIRO_FORMAT_RGB30 . 5)
    (CAIRO_FORMAT_RGB16_565 . 4)
    (CAIRO_FORMAT_A1 . 3)
    (CAIRO_FORMAT_A8 . 2)
    (CAIRO_FORMAT_RGB24 . 1)
    (CAIRO_FORMAT_ARGB32 . 0)
    (CAIRO_FORMAT_INVALID . -1)
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
    (CAIRO_STATUS_LAST_STATUS . 43)
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
    (CAIRO_STATUS_LAST_STATUS . 43)
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
    (CAIRO_TAG_LINK . "Link")
    (CAIRO_TAG_DEST . "cairo.dest")
    (CAIRO_VERSION_STRING . "1.16.0")
    (CAIRO_VERSION . 11600)))

(define ffi-cairo-symbol-val
  (lambda (k)
    (or (assq-ref ffi-cairo-symbol-tab k))))
(export ffi-cairo-symbol-val)

(define (unwrap-enum obj)
  (cond ((number? obj) obj)
        ((symbol? obj) (ffi-cairo-symbol-val obj))
        ((fh-object? obj) (struct-ref obj 0))
        (else (error "type mismatch"))))

(define ffi-cairo-types
  '((pointer . "cairo_t") "cairo_t" (pointer . "cairo_surface_t") 
    "cairo_surface_t" (pointer . "cairo_device_t") "cairo_device_t" (struct . 
    "_cairo_matrix") (pointer . "cairo_matrix_t") "cairo_matrix_t" (pointer . 
    "cairo_pattern_t") "cairo_pattern_t" "cairo_destroy_func_t" (struct . 
    "_cairo_user_data_key") (pointer . "cairo_user_data_key_t") 
    "cairo_user_data_key_t" "cairo_write_func_t" "cairo_read_func_t" (struct 
    . "_cairo_rectangle_int") (pointer . "cairo_rectangle_int_t") 
    "cairo_rectangle_int_t" (struct . "_cairo_rectangle") (pointer . 
    "cairo_rectangle_t") "cairo_rectangle_t" (struct . "_cairo_rectangle_list"
    ) (pointer . "cairo_rectangle_list_t") "cairo_rectangle_list_t" (pointer 
    . "cairo_scaled_font_t") "cairo_scaled_font_t" (pointer . 
    "cairo_font_face_t") "cairo_font_face_t" (pointer . "cairo_glyph_t") 
    "cairo_glyph_t" (pointer . "cairo_text_cluster_t") "cairo_text_cluster_t" 
    (pointer . "cairo_text_extents_t") "cairo_text_extents_t" (pointer . 
    "cairo_font_extents_t") "cairo_font_extents_t" (pointer . 
    "cairo_font_options_t") "cairo_font_options_t" 
    "cairo_user_scaled_font_init_func_t" 
    "cairo_user_scaled_font_render_glyph_func_t" 
    "cairo_user_scaled_font_text_to_glyphs_func_t" 
    "cairo_user_scaled_font_unicode_to_glyph_func_t" (pointer . 
    "cairo_path_data_t") "cairo_path_data_t" (union . "_cairo_path_data_t") 
    (struct . "cairo_path") (pointer . "cairo_path_t") "cairo_path_t" 
    "cairo_surface_observer_callback_t" "cairo_raster_source_acquire_func_t" 
    "cairo_raster_source_release_func_t" "cairo_raster_source_snapshot_func_t"
    "cairo_raster_source_copy_func_t" "cairo_raster_source_finish_func_t" 
    (pointer . "cairo_region_t") "cairo_region_t"))
(export ffi-cairo-types)

(define-public cairo_raster_source_acquire_func_t*-desc
  (fh:pointer
    cairo_raster_source_acquire_func_t-desc))

(define-fh-pointer-type
  cairo_raster_source_acquire_func_t*
  cairo_raster_source_acquire_func_t*-desc
  cairo_raster_source_acquire_func_t*?
  make-cairo_raster_source_acquire_func_t*)

(export
  cairo_raster_source_acquire_func_t*
  cairo_raster_source_acquire_func_t*?
  make-cairo_raster_source_acquire_func_t*)

(fh-ref<=>deref!
  cairo_raster_source_acquire_func_t*
  make-cairo_raster_source_acquire_func_t*
  cairo_raster_source_acquire_func_t
  make-cairo_raster_source_acquire_func_t)

(define-public cairo_raster_source_release_func_t*-desc
  (fh:pointer
    cairo_raster_source_release_func_t-desc))

(define-fh-pointer-type
  cairo_raster_source_release_func_t*
  cairo_raster_source_release_func_t*-desc
  cairo_raster_source_release_func_t*?
  make-cairo_raster_source_release_func_t*)

(export
  cairo_raster_source_release_func_t*
  cairo_raster_source_release_func_t*?
  make-cairo_raster_source_release_func_t*)

(fh-ref<=>deref!
  cairo_raster_source_release_func_t*
  make-cairo_raster_source_release_func_t*
  cairo_raster_source_release_func_t
  make-cairo_raster_source_release_func_t)

(define M_PI 3.141592653589793)

(define M_2PI 6.283185307179586)

(define (make-cairo-unit-matrix)
  (make-cairo_matrix_t #(1.0 0.0 0.0 1.0 0.0 0.0)))

;; --- last line ---
