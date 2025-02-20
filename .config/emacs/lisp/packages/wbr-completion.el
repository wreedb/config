;; -*- lexical-binding: t; -*-

(use-package orderless
  :custom
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :after (orderless)
  :config
  (setq tab-always-indent 'complete
        read-extended-command-predicate #'command-completion-default-include-p)
  (setq corfu-auto t
        corfu-quit-no-match t)
  (global-corfu-mode))

(use-package vertico
  :after (orderless)
  :config (vertico-mode))

(provide 'wbr-completion)
