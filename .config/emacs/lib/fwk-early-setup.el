;; -*- lexical-binding: t; -*-
;; function/constant definitions

(defconst fwk-var/emacs-dir
  (format "%s" user-emacs-directory)
  "User Emacs configuration directory")

(defconst fwk-var/home-dir
  (concat (getenv "HOME") "/")
  "User HOME directory")

(defconst fwk-var/projects-dir
  (expand-file-name "Projects" fwk-var/home-dir)
  "User directory for projects")

(defconst xdg/pictures
  (expand-file-name "Pictures" fwk-var/home-dir))

(defconst xdg/videos
  (expand-file-name "Videos" fwk-var/home-dir))

(defconst xdg/downloads
  (expand-file-name "Downloads" fwk-var/home-dir))

(defconst xdg/desktop
  (expand-file-name "Desktop" fwk-var/home-dir))

(defconst xdg/documents
  (expand-file-name "Documents" fwk-var/home-dir))

(defconst xdg/music
  (expand-file-name "Music" fwk-var/home-dir))

(defconst xdg/config-home
  (expand-file-name ".config" fwk-var/home-dir)
  "User's XDG_CONFIG_HOME")

(defconst xdg/cache-home
  (expand-file-name ".cache" fwk-var/home-dir)
  "User's XDG_CACHE_HOME")

(defconst xdg/data-home
  (expand-file-name ".local/share" fwk-var/home-dir)
  "User's XDG_DATA_HOME")

(defconst xdg/state-home
  (expand-file-name ".local/state" fwk-var/home-dir)
  "User's XDG_STATE_HOME")

(defconst xdg/bin-home
  (expand-file-name ".local/bin" fwk-var/home-dir)
  "User's ~/.local/bin directory")

(defconst fwk-var/org-dir
  (expand-file-name "Documents/org" fwk-var/home-dir)
  "Directory for storing org-mode related files")

(defconst fwk-var/emacs-cache
  (expand-file-name "cache" fwk-var/emacs-dir)
  "A cache specifically for Emacs related files")

(defconst fwk-var/theme-dir
  (expand-file-name "themes" fwk-var/emacs-dir)
  "User themes directory")

(defconst fwk-var/emacs-assets
  (expand-file-name "assets" fwk-var/emacs-dir)
  "Files such as images and ascii art")

(defun fwk-func/echo (msg)
  "print message MSG to echo area"
  (interactive)
  (message (format "[FWK] *>>> %s" msg)))

(defun fwk-func/mkdir (dir)
  "Create directory DIR and print a message about it"
  (unless (file-exists-p dir)
    (fwk-func/echo (format "MKDIR: %s" dir)) 
    (mkdir dir t)))

(defun fwk-func/load-lib (lib)
  "Load library LIB and print a message about it"
  (fwk-func/echo (format "LOAD: %s" lib))
  (require lib))

(defun fwk-func/load-fwk-lib (lib)
  "Load fwk-specific library LIB and print a message about it"
  (fwk-func/echo (format "INTERNAL: %s" lib))
  (require lib))

(defun fwk-func/emacs-cache-subdir (target)
  "return dir or file name relative to emacs cache"
  (expand-file-name target fwk-var/emacs-cache)) 


(defun fwk-func/after-load (before after)
  "ensure library BEFORE is loaded prior to loading AFTER"
  (fwk-func/echo (format "PRELOAD: %s" before))
  (with-eval-after-load before
    (fwk-func/load-lib after)))

(defun fwk-func/reload-buffer ()
  "Reload buffer without confirmation"
  (interactive)
  (fwk-func/echo "REVERT BUFFER")
  (revert-buffer nil t))

(defun fwk-func/ensure-cache-dir (dir)
  "If directory doesn't exist in fwk-var/emacs-cache, create it"
  (fwk-func/mkdir (fwk-func/emacs-cache-subdir dir)))

(defun fwk-func/reload-init-file ()
  "Reload emacs init file"
  (interactive)
  (fwk-func/echo "LOAD: init.el")
  (load (expand-file-name "init.el" user-emacs-directory) :nomessage t))

(defun fwk-func/backup-file-name (fpath)
  (let* ((backupRootDir (fwk-func/emacs-cache-subdir "backup"))
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath))
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") )))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))

(defun fwk-func/add-hooks (target modelist)
  "Add hook TARGET to all modes in MODELIST"
  (let ((new-hooks modelist))
    (mapc (lambda (hook) (add-hook hook target)) new-hooks)))

(provide 'fwk-early-setup)
