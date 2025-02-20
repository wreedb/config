;; -*- lexical-binding: t; -*- vim:ft=lisp

(use-package async
  :ensure t
  :demand t)

(use-package dash
  :ensure t
  :demand t)
(use-package autothemer
  :ensure t
  :demand t)

(use-package transient
  :config
  (unless (file-exists-p (concat wbr/cache-dir "transient/"))
    (mkdir (concat wbr/cache-dir "transient/") t))
  (setq transient-levels-file (concat wbr/cache-dir "transient/levels.el")
        transient-history-file (concat wbr/cache-dir "transient/history.el")
        transient-values-file (concat wbr/cache-dir "transient/values.el")))

;; misc
(use-package parent-mode)
(use-package hydra)

(use-package quelpa
  :config
  (setq quelpa-dir (concat wbr/cache-dir "quelpa/")))

(use-package swiper)
(use-package sudo-edit)

(use-package smex
  :config
  (unless (file-exists-p (concat wbr/cache-dir "smex/"))
    (mkdir (concat wbr/cache-dir "smex/") t))
  (setq smex-save-file (concat wbr/cache-dir "smex/save.el")))

(use-package magit)

(use-package rich-minority
  :config (rich-minority-mode t))

(use-package vterm
  :config (setq vterm-shell "fish"))

(use-package counsel
  :delight
  :config (counsel-mode))


(use-package ivy
  :delight
  :config
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil)
  (ivy-mode)
  (keymap-global-set "C-c C-r" 'ivy-resume)
  (keymap-global-set "C-x C-f" 'counsel-find-file)
  (keymap-global-set "M-x" 'counsel-M-x))

(use-package ivy-rich
  :delight
  :after (ivy)
  :config (ivy-rich-mode t))

(use-package page-break-lines
  :config (page-break-lines-mode))

(use-package which-key
  :delight
  :config
  (setq which-key-side-window-location 'bottom
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-allow-imprecise-window-fit t
        which-key-max-description-length 25
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-idle-delay 0.8)
  (which-key-mode t))

(use-package treemacs
  :config
  (setq treemacs-show-hidden-files t
        treemacs-hide-dot-git-directory t
        treemacs-persist-file (concat wbr/cache-dir "treemacs/persist")
        treemacs-last-error-persist-file (concat wbr/cache-dir "treemacs/error-persist")))

(use-package undo-fu
  :config
  (keymap-global-unset "C-z")
  (keymap-global-set "C-z" 'undo-fu-only-undo)
  (keymap-global-set "C-S-z" 'undo-fu-only-redo))

(use-package evil
  :after (undo-fu)
  :init
  (setq evil-want-keybinding nil
        evil-undo-system 'undo-fu)
  :config (evil-mode))

(use-package evil-collection
  :delight
  :after (evil)
  :config (evil-collection-init))

(use-package evil-surround
  :after (evil evil-collection)
  :config (global-evil-surround-mode t))

(use-package evil-cleverparens
  :after (evil evil-collection)
  :delight
  :init
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'lisp-mode-hook #'evil-cleverparens-mode))

(use-package highlight-quoted
  :config
  (add-hook 'prog-mode-hook #'highlight-quoted-mode)
  (add-hook 'help-mode-hook #'highlight-quoted-mode))

(use-package highlight-defined
  :config
  (add-hook 'prog-mode-hook #'highlight-defined-mode)
  (add-hook 'help-mode-hook #'highlight-defined-mode))

(use-package highlight-numbers
  :config
  (add-hook 'prog-mode-hook #'highlight-numbers-mode)
  (add-hook 'help-mode-hook #'highlight-numbers-mode))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook #'rainbow-delimiters-mode))

(use-package telephone-line
  :config
  (telephone-line-mode t))

(use-package ivy-posframe
  :after (ivy ivy-rich)
  :init
  (setq ivy-posframe-parameters
	'((left-fringe . 12)
	  (right-fringe . 12)))
  (setq ivy-posframe-width 125
	ivy-posframe-height 10
	ivy-posframe-border-width 3)
  (setq ivy-posframe-display-functions-alist
	'((counsel-M-x . ivy-posframe-display-at-frame-center)
	  (t . ivy-posframe-display)))
  :config
  (ivy-posframe-mode t)
  (set-face-attribute 'ivy-posframe-border nil :background "black"))

(use-package projectile
  :config
  (unless (file-exists-p (expand-file-name "projectile" wbr/cache-dir))
    (mkdir (expand-file-name "projectile" wbr/cache-dir) t))
  (setq projectile-cache-file (expand-file-name "projectile/cache" wbr/cache-dir)
	projectile-known-projects-file (expand-file-name "projectile/known-projects.eld")
        projectile-project-search-path '(("~/Projects" . 1)))
  (keymap-global-set "C-c p" 'projectile-command-map)
  (projectile-mode t))


(use-package dashboard
  :after (nerd-icons projectile)
  :config
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))
	dashboard-display-icons-p t
	dashboard-icons-type 'nerd-icons
	dashboard-heading-icons t
	dashboard-set-file-icons t
	dashboard-banner-logo-title "Hey, Will."
	dashboard-center-content t
	dashboard-vertically-center-content t)
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))

(use-package editorconfig
  :config (editorconfig-mode t))

(use-package rainbow-mode
  :delight
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'conf-mode #'rainbow-mode)
  (add-hook 'org-mode-hook #'rainbow-hook))

(use-package orderless
  :custom
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :after (orderless)
  :config (vertico-mode))

(use-package corfu
  :after (orderless)
  :config
  (setq tab-always-indent 'complete
        text-mode-ispell-word-completion nil
        read-extended-command-predicate #'command-completion-default-include-p
	corfu-auto t
	corfu-quit-no-match t)
  (global-corfu-mode))

;; org-mode
(load-library "org")
(load-library "org-tempo")

(setq org-directory wbr/org-dir
      org-default-notes-file (expand-file-name "notes.org" wbr/org-dir)
      org-agenda-files (list wbr/org-dir)
      org-auto-align-tags t
      org-edit-src-content-indentation 0)

(use-package org-modern
  :config
  (add-hook 'org-mode-hook #'org-modern-mode))

(use-package toc-org)

;; nerd-icons
(use-package nerd-icons)

(use-package nerd-icons-dired
  :after (nerd-icons)
  :config
  (add-hook 'dired-mode-hook #'nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :after (nerd-icons)
  :config
  (add-hook 'ibuffer-mode #'nerd-icons-ibuffer-mode))

(use-package nerd-icons-corfu
  :after (nerd-icons corfu)
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-ivy-rich
  :after (nerd-icons ivy-rich)
  :config
  (nerd-icons-ivy-rich-mode t))
