;; -*- lexical-binding: t; -*-

;; indentation/tab settings
(setopt indent-tabs-mode nil)
(setopt tab-width 4)

;; disable cursor blinking
(setopt blink-cursor-mode nil)


;; defined in ~/.config/emacs/lib/fwk-early-setup.el
(setopt make-backup-file-name-function 'fwk-func/backup-file-name)

(setopt kept-old-versions 5
        kept-new-versions 5
        delete-old-versions t)

;; auto-save
(fwk-func/ensure-cache-dir "auto-save")
(setopt auto-save-list-file-prefix
	(fwk-func/emacs-cache-subdir "auto-save/save-"))

;; general stuff
(setopt enable-recursive-minibuffers t)
(setopt minibuffer-prompt-properties
 '(read-only t cursor-intangible t face minibuffer-prompt))

(fwk-func/load-lib 'display-line-numbers)
(setopt global-display-line-numbers-mode t)
(setopt display-line-numbers-width 3)

(setopt column-number-mode t)

(setopt show-trailing-whitespace nil)

;; savehist-mode
(fwk-func/ensure-cache-dir "savehist")
(fwk-func/load-lib 'savehist)
(setopt savehist-file (fwk-func/emacs-cache-subdir "savehist/save"))
(savehist-mode t)

;; recentf-mode
(fwk-func/ensure-cache-dir "recentf")
(fwk-func/load-lib 'recentf)
(setopt recentf-save-file (fwk-func/emacs-cache-subdir "recentf/save"))
(recentf-mode t)

(setopt find-file-visit-truename nil)
(setopt vc-follow-symlinks nil)
(setopt load-prefer-newer t)
(setopt truncate-lines t)

;; autorevert mode
(fwk-func/load-lib 'autorevert)
(setopt auto-revert-verbose nil)
(global-auto-revert-mode t)

(when (display-graphic-p)
  (context-menu-mode))

;; show time in modelinea
(setopt display-time-default-load-average nil)
(setopt display-time-format "%I:%M %p")
(display-time-mode t)

(setopt gc-cons-threshold 800000)

;; tramp
(fwk-func/ensure-cache-dir "tramp")
(fwk-func/load-lib 'tramp)
(setopt tramp-persistency-file-name
  (fwk-func/emacs-cache-subdir "tramp/persist"))

(provide 'fwk-features)
