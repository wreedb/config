;; -*- lexical-binding: t; -*-

(defconst wbr/home-dir
  (concat (getenv "HOME") "/")
  "User's home directory")

(defconst wbr/config-dir
  (concat user-emacs-directory "/")
  "my user emacs configuration directory")

(defconst wbr/cache-dir
  (wbr-f/config-dir "cache/")
  "cache directory for changing files")

(defconst wbr/elpaca-dir
  (wbr-f/config-dir "elpaca/")
  "directory for elpaca's packages")

(defconst wbr/assets-dir
  (wbr-f/config-dir "assets/")
  "directory for images and other misc. assets")

(defconst wbr/themes-dir
  (wbr-f/config-dir "themes/")
  "directory for locally installed themes")

(defconst wbr/org-dir
  (concat wbr/home-dir "Documents/org/")
  "Directory for storing org-mode documents")

(defconst wbr/projects-dir
  (concat wbr/home-dir "Projects/")
  "Directory where I store my projects")

(wbr-f/mkdir wbr/cache-dir)
(wbr-f/mkdir wbr/assets-dir)
(wbr-f/mkdir wbr/themes-dir)
(wbr-f/mkdir wbr/org-dir)

(provide 'wbr-constants)
