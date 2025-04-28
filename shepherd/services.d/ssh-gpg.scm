;; -*- scheme -*-

(use-modules (shepherd support))

(define ssh-agent
  (service '(ssh-agent)
	#:documentation "Allow outgoing ssh sessions"
	#:start (make-forkexec-constructor '("/init/ssh-agent")
			  #:pid-file (string-append %user-runtime-dir "/ssh-agent/pid"))
	#:stop (make-kill-destructor)
	#:respawn? #f))

(define gpg-agent
  (service '(gpg-agent)
    #:documentation "GNUPG user agent"
	#:start (make-forkexec-constructor '("/init/gpg-agent")
			  #:pid-file (string-append %user-runtime-dir "/gpg-agent/pid"))
    #:stop (make-kill-destructor)
	#:respawn? #f))

(define dirmngr
  (service '(dirmngr)
	#:documentation "GNUPG network agent"
	#:start (make-forkexec-constructor '("/init/dirmngr")
			  #:pid-file (string-append %user-runtime-dir "/dirmngr/pid"))
	#:stop (make-kill-destructor)
	#:respawn? #f))

(register-services
  (list ssh-agent
		gpg-agent
	    dirmngr))
