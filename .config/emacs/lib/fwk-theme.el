;; -*- lexical-binding: t; -*-

(setopt custom-theme-directory fwk-var/theme-dir)

(setq custom-theme-load-path
 (list (expand-file-name "one-themes" fwk-var/theme-dir)
       (expand-file-name "doom-themes" fwk-var/theme-dir)
       (expand-file-name "catppuccin-theme" fwk-var/theme-dir)
       custom-theme-directory))

(setq load-path
 (append (list
  (expand-file-name "one-themes" fwk-var/theme-dir)
  (expand-file-name "doom-themes" fwk-var/theme-dir)
  (expand-file-name "catppuccin-theme" fwk-var/theme-dir)
  custom-theme-directory)
 load-path))



(fwk-func/load-lib 'brogrammer-theme)
(fwk-func/load-lib 'doom-themes)
(fwk-func/load-lib 'catppuccin-theme)
(fwk-func/load-lib 'one-themes)

(setopt doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-gruvbox-dark-variant "hard"
        catppuccin-flavor 'mocha)

(load-theme 'doom-gruvbox t)

(provide 'fwk-theme)
