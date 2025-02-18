;; -*- lexical-binding: t; -*-
;; (setq package-enable-at-startup nil)

(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

(setq menu-bar-mode nil
      tool-bar-mode nil)

(mkdir (concat user-emacs-directory "cache") t)

(startup-redirect-eln-cache
  (concat user-emacs-directory "cache/eln-cache"))

(setq create-lockfiles nil
      use-dialog-box nil)

(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-14"))
