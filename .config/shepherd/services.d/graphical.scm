;; -*- scheme -*-

(use-modules (shepherd support))

;(define portal-gtk
;  (service '(portal-gtk)
;	#:documentation "Desktop portal GTK implementation"
;	#:start (make-forkexec-constructor '("/usr/lib/xdg-desktop-portal-gtk"))
;	#:stop (make-kill-destructor)
;	#:respawn? #t))

;(define portal-hypr
;  (service '(portal-hypr)
;	#:documentation "Desktop portal GTK implementation"
;	#:requirement '(portal-gtk)
;	#:start (make-forkexec-constructor '("/usr/lib/xdg-desktop-portal-hyprland"))
;	#:stop (make-kill-destructor)
;	#:respawn? #t))

(define wlsunset
  (service '(wlsunset)
    #:documentation "Blue light filter"
    #:start (make-forkexec-constructor
     '("/usr/bin/wlsunset" "-l" "45.1" "-L" "-91.4"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(define polkit-agent
  (service '(polkit-agent)
	#:documentation "Polkit authenticator program"
	#:start (make-forkexec-constructor '("/usr/lib/xfce-polkit/xfce-polkit"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(register-services (list polkit-agent
                         wlsunset))
