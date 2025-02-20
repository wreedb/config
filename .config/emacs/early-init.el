;; -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

(add-to-list 'default-frame-alist
             '(horizontal-scroll-bars . nil))

(setq tool-bar-mode nil
      menu-bar-mode nil)

(setq native-comp-async-report-warnings-errors 'silent)
(setq warning-minimum-level :emergency)
(setq warning-minimum-log-level 'error)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))


(mkdir (concat user-emacs-directory "cache") t)

(unless (file-exists-p (expand-file-name "cache/eln-cache" user-emacs-directory))
  (mkdir (concat user-emacs-directory "cache/eln-cache") t))

(startup-redirect-eln-cache
  (concat user-emacs-directory "cache/eln-cache"))

(setq create-lockfiles nil
      use-dialog-box nil)

(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-14"))
