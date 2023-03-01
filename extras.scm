;; extras.scm

(define-module (extras) #:declarative? #f)

(when (not (defined? 'sendmsg))
  (load-extension "sockmsg" "scm_init_sockmsg")
  (export sendmsg recvmsg! SCM_RIGHTS SCM_CREDENTIALS))

(when (not (defined? 'mmap))
  (load-extension "mmap" "scm_init_mmap")
  (export mmap PROT_READ PROT_WRITE MAP_PRIVATE MAP_SHARED))

;; --- last line ---
