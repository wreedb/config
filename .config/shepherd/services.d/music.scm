;; -*- scheme -*-

(use-modules (shepherd support))

(define mpd
  (service '(mpd)
    #:documentation "Music player daemon"
    #:start (make-forkexec-constructor '("/usr/bin/mpd" "--no-daemon"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(define mpd-discord-rpc
  (service '(mpd-discord-rpc)
    #:requirement '(mpd)
    #:documentation "Show listening status in discord"
    #:start (make-forkexec-constructor '("mpd-discord-rpc")
      #:log-file (string-append %user-log-dir "/mpd-discord-rpc.log"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(register-services
  (list mpd
        mpd-discord-rpc))
