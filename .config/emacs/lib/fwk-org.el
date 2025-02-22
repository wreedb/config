;; -*- lexical-binding: t; -*-

(fwk-func/load-lib 'org)
(fwk-func/load-lib 'org-tempo)

(fwk-func/mkdir fwk-var/org-dir)

(setopt org-directory fwk-var/org-dir
        org-default-notes-file (expand-file-name "notes.org" fwk-var/org-dir)
        org-agenda-files (list fwk-var/org-dir)
        org-auto-align-tags t
        org-edit-src-content-indentation 0)

(use-package org-modern
  :init
  (add-hook 'org-mode-hook #'org-modern-mode))

(use-package toc-org)

(provide 'fwk-org)
