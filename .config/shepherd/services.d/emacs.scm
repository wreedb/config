(use-modules (shepherd support))

(define emacs
  (service '(emacs)
	#:documentation "The best text editor"
	#:start (make-forkexec-constructor '("/usr/bin/emacs" "--fg-daemon"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services (list emacs))

