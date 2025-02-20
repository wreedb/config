;; -*- lexical-binding: t; -*- vim:ft=lisp

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

(provide 'wbr-org)
