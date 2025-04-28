
(use-modules (shepherd support))

(define gvfsd
  (service '(gvfsd)
    #:start (make-forkexec-constructor '("/usr/lib/gvfsd" "--replace"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(define gvfsd-metadata
  (service '(gvfsd-metadata)
    #:start (make-forkexec-constructor '("/usr/lib/gvfsd-metadata" "--replace"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(register-services (list gvfsd gvfsd-metadata))
