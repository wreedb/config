;; -*- lexical-binding: t; -*-

(defun wbr-f/load-lib (lib)
  "send a message and then 'load-library' LIB"
  (message ">>> load: %s" lib)
  (load-library lib))

(defun wbr-f/after-load (before after)
  "'load-library' AFTER inside 'with-eval-after-load' wrapper for BEFORE feature"
  (with-eval-after-load before
    (wbr-f/load-lib after)))

(defun wbr-f/config-dir (dir)
  "Return DIR relative to 'user-emacs-directory'"
  (expand-file-name dir user-emacs-directory))

(defun wbr-f/mkdir (dir)
  "Create DIR if it doesn't exist"
  (unless (file-exists-p dir)
    (mkdir dir t)))

(defun wbr-f/treesit-install-all ()
  (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist)))

(provide 'wbr-functions)
