;; -*- scheme -*-

(use-modules ((ice-9 ftw) #:select (scandir))
             (shepherd service)
             (shepherd support))

(perform-service-action root-service 'daemonize)

(for-each
  (lambda (file)
    (load (string-append "services.d/" file)))
  (scandir (string-append (dirname (current-filename)) "/services.d")
           (lambda (file)
             (string-suffix? ".scm" file))))

(define srvcs
  (list ssh-agent
		gpg-agent
		dirmngr
		pipewire
		pipewire-pulse
		wireplumber
		mpd
		mpd-discord-rpc
		kanshi
		swww
		dunst
		wlsunset
		polkit-agent
		xfsettingsd
		thunar
		emacs))

(for-each (lambda (svc)
  (start-service svc))
  srvcs)

;; (define login-services
;;   (list ssh-agent
;; 		gpg-agent
;; 		dirmngr))

;; (define audio-services
;;   (list pipewire
;; 		pipewire-pulse
;; 		wireplumber))

;; (define music-services
;;   (list mpd mpd-discord-rpc))

;; (define display-services
;;   (list kanshi
;; 		swww
;; 		dunst))

;; (define graphical-services
;;   (list wlsunset
;; 		polkit-agent))

;; (define (begin-services service-list)
;;   (for-each
;;     (lambda (svc)
;; 	  (start-service svc))
;; 	service-list))

;; (begin-services login-services)
;; (begin-services audio-services)
;; (begin-services music-services)
;; (begin-services display-services)
;; (begin-services graphical-services)
