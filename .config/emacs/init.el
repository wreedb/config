;; -*- lexical-binding: t; -*-
(defconst wbr/lisp-dir
  (expand-file-name "lisp/" user-emacs-directory)
  "directory for my lisp files")

(defconst wbr/lisp-packages-dir
  (expand-file-name "packages/" wbr/lisp-dir)
  "directory for my package install declarations and setup")

(setq load-path (cons wbr/lisp-dir load-path))
(setq load-path (cons wbr/lisp-packages-dir load-path))

(require 'elpaca-setup)
(require 'wbr-functions)

;; constants for common things like directories and files
(wbr-f/load-lib "wbr-constants")
;; tuning features and changing default settings
(wbr-f/load-lib "wbr-features")
;; packages
(wbr-f/load-lib "wbr-packages-init")
;; modes
(wbr-f/load-lib "wbr-auto-mode-alist")

(wbr-f/after-load 'treesit "wbr-treesit")
(wbr-f/after-load 'autothemer "wbr-theme")
(wbr-f/after-load 'wbr-theme "wbr-font-lock")
