;; sockmsg.scm

(define-module (sockmsg)
  #:export (sendmsg recvmsg! SCM_RIGHTS)
  #:declarative? #f)

(load-extension "sockmsg" "scm_init_sockmsg")

;; --- last line ---
