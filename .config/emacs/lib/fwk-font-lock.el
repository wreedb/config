;; -*- lexical-binding: t; -*-

;; default font
(set-face-attribute 'default nil
  :family "JetBrains Mono"
  :weight 'medium
  :height 140)

(set-face-attribute 'fixed-pitch nil
  :family "JetBrains Mono"
  :weight 'medium
  :height 140)

(set-face-attribute 'fixed-pitch-serif nil
  :family "JetBrains Mono"
  :weight 'medium
  :height 140)

(set-face-attribute 'variable-pitch nil
  :family "JetBrains Mono"
  :weight 'medium
  :height 140)

;; fancy programming font styles
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
(set-face-attribute 'font-lock-builtin-face nil :weight 'bold)

;; this has to be a bug right?
(set-face-attribute 'help-key-binding nil
  :background "unspecified"
  :foreground "unspecified"
  :weight 'bold
  :slant 'italic
  :box nil)

(provide 'fwk-font-lock)
