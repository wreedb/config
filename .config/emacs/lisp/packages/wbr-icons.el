;; -*- lexical-binding: t; -*-

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

(provide 'wbr-icons)
