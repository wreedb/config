;; -*- lexical-binding: t; -*-

(defun wbr-func/config-dir (dirname)
  "Return the name of a directory relative to 'user-emacs-directory'"
  (concat user-emacs-directory dirname))

(defun wbr-func/mkdir (dirname)
  "Create directory if it doesn't exist"
  (unless (file-exists-p dirname)
    (mkdir dirname t)))
