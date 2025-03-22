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
             (web client)
             (web server)
             (web response)
             (shepherd)
             (gnutls))

(activate-readline)
