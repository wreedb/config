;; -*- lexical-binding: t; -*-

(use-package dashboard
  :config
  (setq initial-buffer-choice
        (lambda () (get-buffer-create dashboard-buffer-name)))
  ;; ensure icon usage
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons
        dashboard-heading-icons t
        dashboard-set-file-icons t)
  ;; banner
  (setq dashboard-startup-banner
    (expand-file-name "emacs.txt" fwk-var/emacs-assets))

  ;; positioning
  (setq dashboard-center-content t
        dashboard-vertically-center-content t)

  ;; dashboard items
  (setq dashboard-items
   '((recents . 4)
     (projects . 2)))

  (setq dashboard-path-style 'truncate-beginning)
  (setq dashboard-path-max-length 45)
  (setq dashboard-projects-backend 'projectile)
  
  ;; ensure dashboard still starts after elpaca
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (with-eval-after-load 'projectile
    (dashboard-setup-startup-hook)))

(provide 'fwk-dashboard)
