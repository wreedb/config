;; -*- scheme -*-

(use-modules (shepherd support))

(define xfsettingsd
  (service '(xfsettingsd)
	#:documentation "Manages many configuration settings"
	#:start (make-forkexec-constructor '("/usr/bin/xfsettingsd" "-D" "--replace"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services (list xfsettingsd))
