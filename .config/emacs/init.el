;; -*- lexical-binding: t; -*- vim:ft=lisp
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(load-library "elpaca-setup")
(load-library "wbr-functions")
(load-library "wbr-constants")

(load-library "features.el")

;; package installs
(load-library "packages.el")
(load-library "keybinds.el")

(load-library "treesit")

(with-eval-after-load 'treesit
  (load-library "languages.el"))

(load-library "ligatures-setup.el")

(with-eval-after-load 'dash
  (load-library "theme-setup"))

(load-library "font-lock-setup")
