;; -*- lexical-binding: t; -*-

(defconst wbr/home-dir
  (concat (getenv "HOME") "/")
  "User's home directory")

(defconst wbr/config-dir
  user-emacs-directory
  "my user emacs configuration directory")

(defconst wbr/cache-dir
  (wbr-func/config-dir "cache/")
  "cache directory for changing files")

(defconst wbr/elpaca-dir
  (wbr-func/config-dir "elpaca/")
  "directory for elpaca's packages")

(defconst wbr/assets-dir
  (wbr-func/config-dir "assets/")
  "directory for images and other misc. assets")

(defconst wbr/themes-dir
  (wbr-func/config-dir "themes/")
  "directory for locally installed themes")

(defconst wbr/org-dir
  (concat wbr/home-dir "Documents/org/")
  "Directory for storing org-mode documents")

(defconst wbr/projects-dir
  (concat wbr/home-dir "Projects/")
  "Directory where I store my projects")

(unless (file-exists-p wbr/cache-dir)
  (mkdir wbr/cache-dir t))

(unless (file-exists-p wbr/assets-dir)
  (mkdir wbr/assets-dir t))

(unless (file-exists-p wbr/themes-dir)
  (mkdir wbr/themes-dir t))
  
		       
