;; -*- lexical-binding: t; -*-

;; SECTION: misc.

(use-package dash)
(use-package async)
(use-package autothemer)
(use-package hydra)
(use-package sudo-edit)
(use-package parent-mode)
(use-package magit)

(use-package transient
  :init (fwk-func/ensure-cache-dir "transient")
  :custom
  (transient-levels-file (fwk-func/emacs-cache-subdir "transient/levels"))
  (transient-values-file (fwk-func/emacs-cache-subdir "transient/values"))
  (transient-history-file (fwk-func/emacs-cache-subdir "transient/history")))

(use-package quelpa
  :init (fwk-func/ensure-cache-dir "quelpa")
  :custom (quelpa-dir (fwk-func/emacs-cache-subdir "quelpa")))

;; SECTION: editing

;; see 'fwk-hooks.el' for hooks
(use-package highlight-defined)
(use-package highlight-quoted)
(use-package highlight-numbers)
(use-package rainbow-delimiters)
(use-package rainbow-mode)

;; see 'fwk-keybinds.el' for related keymap(s)
(use-package undo-fu
  :init
  (keymap-global-unset "C-z")
  (keymap-global-set "C-z" 'undo-fu-only-undo)
  (keymap-global-set "C-S-z" 'undo-fu-only-redo))

(use-package evil
  :after (undo-fu)
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config (evil-mode))

(use-package evil-collection
  :after (evil)
  :config (evil-collection-init))

(use-package evil-surround
  :after (evil-collection)
  :config (global-evil-surround-mode t))

;; see 'fwk-hooks.el' for associated hooks
(use-package evil-cleverparens
  :after (evil-collection))

(use-package orderless
  :config
  (with-eval-after-load 'orderless
    (setopt completion-styles '(orderless basic)
	        completion-category-defaults nil
	        completion-category-overrides '((file (styles partial-completion))))))

(use-package corfu
  :after (orderless)
  :custom
  (tab-always-indent 'complete)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  :config
  (global-corfu-mode t))

(use-package corfu-popupinfo
  :ensure nil
  :after (corfu)
  :custom
  (corfu-popupinfo-delay '(0.25 . 0.1))
  (corfu-popupinfo-hide nil)
  :init
  (add-hook 'corfu-mode-hook #'corfu-popupinfo-mode)
  :config
  (corfu-popupinfo-mode t))

;; SECTION: interface
(use-package vertico
  :after (orderless)
  :init (vertico-mode t))

(use-package vertico-posframe
  :after (orderless vertico)
  :custom
  (vertico-posframe-parameters '((left-fringe . 12) (right-fringe . 12)))
  :config
  (vertico-posframe-mode t))

(use-package counsel
  :config (counsel-mode))

;; see 'fwk-keybinds.el' for associate keymaps
(use-package ivy
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-initial-inputs-alist nil)
  :config
  (ivy-mode))

(use-package ivy-rich
  :after (ivy)
  :config (ivy-rich-mode t))

(use-package ivy-posframe
  :after (ivy ivy-rich)
  :custom
  (ivy-posframe-parameters '((left-fringe . 12) (right-fringe . 12)))
  (ivy-posframe-width 125)
  (ivy-posframe-height 10)
  (ivy-posframe-border-width 3)
  (ivy-posframe-display-functions-alist
   '((counsel-M-x . ivy-posframe-display-at-frame-center)
     (t           . ivy-posframe-display)))
  :config
  (ivy-posframe-mode t)
  (set-face-attribute 'ivy-posframe-border nil :background "black"))

(use-package page-break-lines
  :config (page-break-lines-mode))

(use-package which-key
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-side-window-slot -10)
  (which-key-side-window-max-height 0.25)
  (which-key-allow-imprecise-window-fit t)
  (which-key-max-description-length 25)
  (which-key-max-display-columns nil)
  (which-key-min-display-lines 6)
  (which-key-idle-delay 0.8)
  :config
  (which-key-mode t))

(use-package smex
  :init (fwk-func/ensure-cache-dir "smex")
  :config (setq smex-save-file (fwk-func/emacs-cache-subdir "smex/save")))


;; SECTION: language modes
;; -- NOTE: see 'fwk-modes.el' for mode associations and settings
(use-package racket-mode
  :custom
  (racket-doc-index-directory (fwk-func/emacs-cache-subdir "racket-mode"))
  (racket-repl-history-directory (fwk-func/emacs-cache-subdir "racket-mode")))

(use-package v-mode)
(use-package fish-mode)
(use-package nix-ts-mode)
(use-package zig-ts-mode)
(use-package just-ts-mode)
(use-package markdown-ts-mode)
(use-package markdown-mode)
(use-package hyprlang-ts-mode)

(use-package geiser-guile
  :custom (geiser-guile-init-file (expand-file-name "guile/init.scm" xdg/config-home)))

;; SECTION: utils
(use-package vterm
  :custom (vterm-shell "fish"))

(use-package treemacs
  :init (fwk-func/ensure-cache-dir "treemacs")
  :custom
  (treemacs-show-hidden-files t)
  (treemacs-hide-dot-git-directory t)
  (treemacs-persist-file (fwk-func/emacs-cache-subdir "treemacs/persist"))
  (treemacs-last-error-persist-file (fwk-func/emacs-cache-subdir "treemacs/last-error")))

;; see 'fwk-keybinds.el' for related keymap(s)
(use-package projectile
  :init (fwk-func/ensure-cache-dir "projectile")
  :custom
  (projectile-cache-file (fwk-func/emacs-cache-subdir "projectile/cache"))
  (projectile-known-projects-file (fwk-func/emacs-cache-subdir "projectile/known-projects.eld"))
  :config
  (with-eval-after-load 'projectile
    (projectile-mode t)
    (projectile-discover-projects-in-directory fwk-var/projects-dir 1)))

;; SECTION: icons
(use-package nerd-icons)

;; see 'fwk-modes.el' for associated hook(s)
(use-package nerd-icons-dired :after (nerd-icons))
(use-package nerd-icons-ibuffer :after (nerd-icons))

(use-package nerd-icons-corfu
  :after (nerd-icons corfu)
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-ivy-rich
  :after (nerd-icons ivy-rich)
  :config (nerd-icons-ivy-rich-mode t))

(use-package treemacs-nerd-icons
  :after (nerd-icons treemacs)
  :config (treemacs-load-theme "nerd-icons"))

(use-package telephone-line
  :custom
  (telephone-line-primary-left-separator 'telephone-line-identity-left)
  (telephone-line-secondary-left-separator 'telephone-line-identity-hollow-left)
  (telephone-line-primary-right-separator 'telephone-line-identity-right)
  (telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right)
  :config
  (telephone-line-mode t))

;; see 'fwk-modes.el' for list of diminished minor modes
(use-package diminish)

(provide 'fwk-packages)
