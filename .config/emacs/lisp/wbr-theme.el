;; -*- lexical-binding: t; -*-
(add-to-list 'custom-theme-load-path (concat wbr/themes-dir "catppuccin-theme"))
(add-to-list 'custom-theme-load-path (concat wbr/themes-dir "gruvbox-theme"))
(add-to-list 'custom-theme-load-path (concat wbr/themes-dir "one-themes"))
(add-to-list 'custom-theme-load-path (concat wbr/themes-dir "doom-themes"))

(add-to-list 'load-path (concat wbr/themes-dir "catppuccin-theme"))
(add-to-list 'load-path (concat wbr/themes-dir "gruvbox-theme"))
(add-to-list 'load-path (concat wbr/themes-dir "one-themes"))
(add-to-list 'load-path (concat wbr/themes-dir "doom-themes"))

(require 'catppuccin-theme)
(require 'doom-themes)
(require 'gruvbox)
(require 'one-themes)

(with-eval-after-load 'catppuccin-theme
  (setq catppuccin-flavor 'mocha))

(with-eval-after-load 'doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-gruvbox-variant "hard"))

(load-theme 'one-dark t)
(provide 'wbr-theme)
