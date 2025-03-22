;; -*- scheme -*-

(use-modules (shepherd support))

(define audio-dir
  (string-append %user-runtime-dir "/audio"))

(unless (file-exists? audio-dir)
  (mkdir-p audio-dir)
  (chmod audio-dir #o700))

(define pipewire
  (service '(pipewire)
    #:documentation "Audio server"
	#:start (make-forkexec-constructor '("/usr/bin/pipewire")
			  #:log-file (string-append audio-dir "/pipewire.log"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define pipewire-pulse
  (service '(pipewire-pulse)
	#:requirement '(pipewire)
	#:documentation "Pulseaudio compatability layer for Pipewire"
    #:start (make-forkexec-constructor '("/usr/bin/pipewire-pulse")
			  #:log-file (string-append audio-dir "/pipewire-pulse.log"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define wireplumber
  (service '(wireplumber)
    #:requirement '(pipewire)
	#:documentation "Session manager for Pipewire"   
    #:start (make-forkexec-constructor '("/usr/bin/wireplumber")
			  #:log-file (string-append audio-dir "/wireplumber.log"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services (list pipewire
						 pipewire-pulse
						 wireplumber))
