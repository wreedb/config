;; -*- lexical-binding: t; -*-

(defun package-setup/transient ()
  "Post-install setup for 'transient' package"
  (unless (file-exists-p (concat wbr/cache-dir "transient/"))
    (mkdir (concat wbr/cache-dir "transient/") t))
  (setq transient-levels-file (concat wbr/cache-dir "transient/levels.el")
        transient-history-file (concat wbr/cache-dir "transient/history.el")
        transient-values-file (concat wbr/cache-dir "transient/values.el")))

(defun package-setup/smex ()
  "Post-install setup for 'smex' package"
  (unless (file-exists-p (concat wbr/cache-dir "smex"))
    (mkdir (concat wbr/cache-dir "smex") t))
  (setq smex-save-file (concat wbr/cache-dir "smex/save.el")))

(defun package-setup/quelpa ()
  "Post-install setup for 'quelpa' package"
  (unless (file-exists-p (concat wbr/cache-dir "quelpa"))
    (mkdir (concat wbr/cache-dir "quelpa") t))
  (setq quelpa-dir (concat wbr/cache-dir "quelpa")))  

(use-package async
  :demand t)
(use-package dash
  :demand t)
(use-package autothemer
  :demand t)
(use-package hydra)
(use-package swiper)
(use-package sudo-edit)
(use-package parent-mode)
(use-package magit)

(use-package transient
  :config (package-setup/transient))

(use-package quelpa
  :config (package-setup/quelpa))

(use-package smex
  :config (package-setup/smex))

(use-package rich-minority
  :config (rich-minority-mode t))

(provide 'wbr-misc)
