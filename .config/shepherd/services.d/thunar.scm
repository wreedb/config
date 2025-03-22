(use-modules (shepherd support))

(define thunar
  (service '(thunar)
	#:documentation "XFCE's file manager"
	#:start (make-forkexec-constructor '("/usr/bin/thunar" "--daemon"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services (list thunar))
