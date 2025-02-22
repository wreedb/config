;; -*- lexical-binding: t; -*-

(fwk-func/add-hooks #'display-line-numbers-mode
  '(prog-mode-hook text-mode-hook org-mode-hook conf-mode-hook))

;(fwk-func/add-hooks #'hl-line-mode
;  '(prog-mode-hook text-mode-hook org-mode-hook conf-mode-hook))

(with-eval-after-load 'highlight-defined
  (fwk-func/add-hooks #'highlight-defined-mode
   '(prog-mode-hook conf-mode-hook help-mode-hook)))

(with-eval-after-load 'highlight-quoted
  (fwk-func/add-hooks #'highlight-quoted-mode
   '(prog-mode-hook conf-mode-hook)))

(with-eval-after-load 'highlight-numbers
  (fwk-func/add-hooks #'highlight-numbers-mode
   '(prog-mode-hook conf-mode-hook text-mode-hook help-mode-hook)))

(with-eval-after-load 'rainbow-delimiters
  (fwk-func/add-hooks #'rainbow-delimiters-mode
   '(prog-mode-hook conf-mode-hook)))

(with-eval-after-load 'rainbow-mode
  (fwk-func/add-hooks #'rainbow-mode
   '(prog-mode-hook conf-mode-hook help-mode-hook text-mode-hook)))

(with-eval-after-load 'evil-cleverparens
  (fwk-func/add-hooks #'evil-cleverparens-mode
   '(emacs-lisp-mode-hook lisp-mode-hook racket-mode-hook scheme-mode-hook)))

(with-eval-after-load 'nerd-icons-dired
  (fwk-func/add-hooks #'nerd-icons-dired-mode
   '(dired-mode-hook)))

(with-eval-after-load 'nerd-icons-ibuffer
  (fwk-func/add-hooks #'nerd-icons-ibuffer-mode
   '(ibuffer-mode-hook)))

(provide 'fwk-hooks)
