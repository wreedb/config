;; -*- lexical-binding: t; -*- vim:ft=lisp

(setq enable-recursive-minibuffers t
      dired-kill-when-opening-new-dired-buffer t
      truncate-lines t
      tab-width 4
      blink-cursor-mode nil
      pixel-scroll-precision-mode nil
      column-number-mode t
      electric-indent-mode nil
      indent-tabs-mode nil)

(setq backup-by-copying t
      delete-old-versions t
      backup-directory-alist
      `(("." . ,(concat wbr/cache-dir "backup/"))))

(setq custom-file "/dev/null")

(setq auto-save-list-file-prefix (concat wbr/cache-dir "auto-save/saves-")
      auto-save-default nil)
;; line numbers
(global-visual-line-mode)

(global-display-line-numbers-mode)

(setq load-prefer-newer t
      auto-revert-avoid-polling t
      display-line-numbers-width 3)

;; pretend to visit the symlink as if it were real
(setq find-file-visit-truename nil
      vc-follow-symlinks nil)

(unless (file-exists-p (concat wbr/cache-dir "savehist/"))
  (mkdir (concat wbr/cache-dir "savehist") t))

(unless (file-exists-p (concat wbr/cache-dir "recentf/"))
  (mkdir (concat wbr/cache-dir "recentf") t))

(unless (file-exists-p (concat wbr/cache-dir "tramp/"))
  (mkdir (concat wbr/cache-dir "tramp") t))

(unless (file-exists-p (concat wbr/cache-dir "url/"))
  (mkdir (concat wbr/cache-dir "url") t))

(setq savehist-file (expand-file-name "savehist/history" wbr/cache-dir))
(savehist-mode)

(setq recentf-save-file (expand-file-name "recentf/save" wbr/cache-dir))
(recentf-mode)

(setq tramp-persistency-file-name (expand-file-name "tramp/persist" wbr/cache-dir))

(setq url-configuration-directory (expand-file-name "url" wbr/cache-dir))


(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
