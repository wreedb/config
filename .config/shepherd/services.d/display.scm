;; -*- scheme -*-

(use-modules (shepherd support))

(define kanshi
  (service '(kanshi)
    #:documentation "Display configuration daemon"
    #:start (make-forkexec-constructor '("/usr/bin/kanshi")
              #:log-file (string-append %user-log-dir "/kanshi.log"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(define swww
  (service '(swww)
	#:documentation "Wallpaper daemon"
	#:start (make-forkexec-constructor '("/usr/bin/swww-daemon")
              #:log-file (string-append %user-log-dir "/swww.log"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define dunst
  (service '(dunst)
	#:documentation "Desktop Notification daemon"
	#:start (make-forkexec-constructor '("/usr/bin/dunst")
              #:log-file (string-append %user-log-dir "/dunst.log"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services
  (list kanshi
        swww
        dunst))
