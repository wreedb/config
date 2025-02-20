;; -*- lexical-binding: t; -*-

(defun package-setup/telephone-line ()
  "Post-install setup for 'telephone-line' package"
  (setq telephone-line-primary-left-separator 'telephone-line-identity-left
        telephone-line-secondary-left-separator 'telephone-line-identity-hollow-left
	telephone-line-primary-right-separator 'telephone-line-identity-right
        telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right
	telephone-line-height 24)
  (telephone-line-mode t))

(use-package telephone-line
  :config (package-setup/telephone-line))

(provide 'wbr-modeline)
