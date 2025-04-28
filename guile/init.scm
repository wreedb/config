;; -*- scheme -*- vim:ft=scheme

(use-modules (ice-9 readline)
             (ice-9 pretty-print)
             (ice-9 format)
             (ice-9 ftw) ;; file-tree-walk
             (ice-9 q) ;; queues
             (ice-9 streams)
             (ice-9 buffered-input)
             (ice-9 expect)
             (ice-9 curried-definitions)
             (ice-9 binary-ports)
             (ice-9 popen)
             (ice-9 rdelim)
             (web client)
             (web server)
             (web response)
             (fibers))

(activate-readline)


(define (getenv-maybe varname default)
  (or (getenv varname) default))

(define (write-file mode str file)
  (let ((handle (open-file file mode)))
    (display str handle)
    (close-port handle)))

(define (capture command)
  (let* ((in (open-input-pipe command))
         (out (read-string in)))
    (close-pipe in) out))

(define (rm-newlines str)
  (list->string
    (filter
      (lambda (c) (not (char=? c #\newline)))
      (string->list str))))
