;; -*- lexical-binding: t; -*-

(use-package vterm
  :config (setq vterm-shell "fish"))

(use-package treemacs
  :config
  (setq treemacs-show-hidden-files t
        treemacs-hide-dot-git-directory t
        treemacs-persist-file (concat wbr/cache-dir "treemacs/persist")
        treemacs-last-error-persist-file (concat wbr/cache-dir "treemacs/error-persist")))

(use-package projectile
  :config
  (unless (file-exists-p (concat wbr/cache-dir "projectile"))
    (mkdir (concat wbr/cache-dir "projectile") t))
  (setq projectile-cache-file (concat wbr/cache-dir "projectile/cache")
	projectile-known-projects-file (concat wbr/cache-dir "projectile/known-projects.eld")
        projectile-project-search-path '(("~/Projects" . 1)))
  (keymap-global-set "C-c p" 'projectile-command-map)
  (projectile-mode t))

(provide 'wbr-util)
