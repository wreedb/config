(use-modules (shepherd service)
             (shepherd support))


;; (perform-root-action root-service 'daemonize)

(define sshd
  (service '(sshd)
	#:requirement '(network-manager)
	#:documentation "SSH access daemon"
	#:start (make-forkexec-constructor '("/usr/bin/sshd" "-D"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define udisks
  (service '(udisks)
    #:documentation "User level disk access"
    #:start (make-forkexec-constructor '("/usr/lib/udisks2/udisksd"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(define dnsmasq
  (service '(dnsmasq)
	#:requirement '(network-manager)
	#:documentation "DHCP and DNS caching server"
	#:start (make-forkexec-constructor
			 '("/usr/bin/dnsmasq" "-k" "--enable-dbus" "--user=dnsmasq" "--pid-file"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define pkgfiled
  (service '(pkgfiled)
	#:documentation "Pacman database caching service"
	#:start (make-forkexec-constructor
			 '("/usr/bin/pkgfiled" "/var/lib/pacman/sync" "/var/cache/pkgfile"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define network-manager
  (service '(network-manager)
	#:documentation "Manages the networking"
	#:start (make-forkexec-constructor '("/usr/bin/NetworkManager" "--no-daemon"))
	#:stop (make-kill-destructor)
	#:respawn? #t))

(define srvcs
  (list sshd
		udisks
		dnsmasq
		pkgfiled
		network-manager))

(register-services srvcs)

(for-each (lambda (svc)
  (start-service svc)) srvcs)
