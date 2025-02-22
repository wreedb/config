;; -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)
(setq package-quickstart nil)

(unless (file-exists-p (expand-file-name "cache" user-emacs-directory))
  (mkdir (expand-file-name "cache" user-emacs-directory) t))

(unless (file-exists-p (expand-file-name "cache/eln-cache" user-emacs-directory))
  (mkdir (expand-file-name "cache/eln-cache" user-emacs-directory) t))

(startup-redirect-eln-cache (expand-file-name "cache/eln-cache" user-emacs-directory))

(setq default-frame-alist
 (append
  '((vertical-scroll-bars . nil)
    (horizontal-scroll-bars . nil)
    (font . "JetBrains Mono-14"))
  default-frame-alist))

(setopt tool-bar-mode nil
        menu-bar-mode nil
	    tooltip-mode nil)


(setq custom-file (expand-file-name "cache/custom.el" user-emacs-directory))

(setq native-comp-async-report-warnings-errors 'silent
      warning-minimum-level :emergency
      warning-minimum-log-level 'error
      byte-compile-warnings '(not obsolete)
      warning-suppress-log-types '((comp) (bytecomp)))

(setq load-path
 (cons (expand-file-name "lib" user-emacs-directory) load-path))

(message "[fwk] *>>> LOAD: elpaca")
(require 'fwk-elpaca)
(message "[fwk] *>>> INTERNAL: fwk-early-setup")
(require 'fwk-early-setup)
