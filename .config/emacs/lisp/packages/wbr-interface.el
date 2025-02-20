;; -*- lexical-binding: t; -*-

(use-package dashboard
  :after (nerd-icons projectile)
  :config
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))
	dashboard-display-icons-p t
	dashboard-icons-type 'nerd-icons
	dashboard-heading-icons t
	dashboard-set-file-icons t
	dashboard-banner-logo-title "Hey, Will."
	dashboard-startup-banner (expand-file-name "gnu_color.png" wbr/assets-dir)
	dashboard-center-content t
	dashboard-vertically-center-content t)
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))

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

(provide 'wbr-interface)
