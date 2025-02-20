;; -*- lexical-binding: t; -*-

(defun unfuck-v-mode ()
  (message "saved your code formatting."))

(use-package v-mode
  :config
  (advice-add 'v-after-save-hook :override #'unfuck-v-mode))

(use-package fish-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.fish\\'" . fish-mode))
    auto-mode-alist)))

(use-package racket-mode
  :init
  (setq racket-doc-index-directory (expand-file-name "racket/" wbr/cache-dir)
	racket-repl-history-directory (expand-file-name "racket/" wbr/cache-dir))
  (setq auto-mode-alist (append
    '(("\\.rkt\\'" . racket-mode))
    auto-mode-alist)))

(use-package zig-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.zig\\'"     . zig-ts-mode))
    '(("\\.zig.zon\\'" . zig-ts-mode))
    auto-mode-alist)))

(use-package just-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\justfile\\'" . just-ts-mode))
    '(("\\Justfile\\'" . just-ts-mode))
    auto-mode-alist)))

(use-package markdown-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.md\\'" . markdown-ts-mode))
    '(("\\.MD\\'" . markdown-ts-mode))
    auto-mode-alist)))

(use-package hyprlang-ts-mode
  :init (setq hyprlang-ts-mode-indent-offset 2))

(provide 'wbr-language-modes)
