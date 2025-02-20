;; -*- lexical-binding: t; -*-

(defun package-setup/undo-fu ()
  "Post-install setup for 'undo-fu' package"
  (keymap-global-unset "C-z")
  (keymap-global-set "C-z" 'undo-fu-only-undo)
  (keymap-global-set "C-S-z" 'undo-fu-only-redo))

(defun package-setup/evil ()
  "Post-install setup for 'evil' package"
  (setq evil-want-keybinding nil
        evil-undo-system 'undo-fu))

(defun package-setup/evil-cleverparens ()
  "Post-install setup for 'evil-cleverparens' package"
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'scheme-mode #'evil-cleverparens-mode)
  (add-hook 'lisp-interaction-mode #'evil-cleverparens-mode))

(defun package-setup/highlight-quoted ()
  "Post-install setup for 'highlight-quoted' package"
  (add-hook 'prog-mode-hook #'highlight-quoted-mode)
  (add-hook 'help-mode-hook #'highlight-quoted-mode)
  (add-hook 'conf-mode #'highlight-quoted-mode)
  (add-hook 'conf-unix-mode #'highlight-quoted-mode)
  (add-hook 'conf-desktop-mode #'highlight-quoted-mode))

(defun package-setup/highlight-defined ()
  "Post-install setup for 'highlight-defined' package"
  (add-hook 'prog-mode-hook #'highlight-defined-mode)
  (add-hook 'help-mode-hook #'highlight-defined-mode)
  (add-hook 'conf-mode #'highlight-defined-mode)
  (add-hook 'conf-unix-mode #'highlight-defined-mode)
  (add-hook 'conf-desktop-mode #'highlight-defined-mode))

(defun package-setup/highlight-numbers ()
  "Post-install setup for 'highlight-numbers' package"
  (add-hook 'prog-mode-hook    #'highlight-numbers-mode)
  (add-hook 'help-mode-hook    #'highlight-numbers-mode)
  (add-hook 'conf-mode         #'highlight-numbers-mode)
  (add-hook 'conf-unix-mode    #'highlight-numbers-mode)
  (add-hook 'conf-desktop-mode #'highlight-numbers-mode))

(defun package-setup/rainbow-delimiters ()
  "Post-install setup for 'rainbow-delimiters' package"
  (add-hook 'prog-mode-hook    #'rainbow-delimiters-mode)
  (add-hook 'help-mode-hook    #'rainbow-delimiters-mode)
  (add-hook 'conf-mode         #'rainbow-delimiters-mode)
  (add-hook 'conf-unix-mode    #'rainbow-delimiters-mode)
  (add-hook 'conf-desktop-mode #'rainbow-delimiters-mode))

(defun package-setup/rainbow-mode ()
  "Post-install setup for 'rainbow-mode' package"
  (add-hook 'prog-mode-hook    #'rainbow-mode)
  (add-hook 'text-mode-hook    #'rainbow-mode)
  (add-hook 'help-mode-hook    #'rainbow-mode)
  (add-hook 'conf-mode         #'rainbow-mode)
  (add-hook 'conf-unix-mode    #'rainbow-mode)
  (add-hook 'conf-desktop-mode #'rainbow-mode))

(use-package undo-fu
  :config (package-setup/undo-fu))

(use-package evil
  :after (undo-fu)
  :init
  (with-eval-after-load 'undo-fu
    (package-setup/evil))
  :config (evil-mode))

(use-package evil-collection
  :after (undo-fu evil)
  :config (evil-collection-init))

(use-package evil-surround
  :after (undo-fu evil evil-collection)
  :config (global-evil-surround-mode t))

(use-package evil-cleverparens
  :after (undo-fu evil evil-collection)
  :init
  (with-eval-after-load 'evil
    (package-setup/evil-cleverparens)))

(use-package highlight-quoted
  :config
  (package-setup/highlight-quoted))

(use-package highlight-defined
  :config
  (package-setup/highlight-defined))

(use-package highlight-numbers
  :config
  (package-setup/highlight-numbers))

(use-package rainbow-delimiters
  :config
  (package-setup/rainbow-delimiters))

(use-package rainbow-mode
  :delight rainbow-mode
  :config (package-setup/rainbow-mode))

(use-package editorconfig
  :config (editorconfig-mode t))

(provide 'wbr-editor)
