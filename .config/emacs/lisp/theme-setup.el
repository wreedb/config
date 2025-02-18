;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (concat wbr/themes-dir "catppuccin"))
(add-to-list 'load-path (concat wbr/themes-dir "doom"))
(add-to-list 'load-path (concat wbr/themes-dir "one"))
(add-to-list 'load-path (concat wbr/themes-dir "gruvbox"))
(add-to-list 'load-path (concat wbr/themes-dir "rose-pine"))

(load-library "catppuccin-theme")
(load-library "doom-themes")
(load-library "gruvbox")
(load-library "one-themes")
(load-library "rose-pine-color-theme")

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-gruvbox-variant "hard")

(load-theme 'one-dark t)
