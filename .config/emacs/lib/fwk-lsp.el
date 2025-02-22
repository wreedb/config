;; -*- lexical-binding: t; -*-

(fwk-func/load-lib 'eglot)

(setq eglot-server-programs
  (append
   '((python-ts-mode   . ("pylsp"))
     (fish-mode        . ("fish-lsp" "start"))
     (markdown-ts-mode . ("marksman" "server"))
     (json-ts-mode     . ("vscode-json-language-server" "--stdio"))
     (css-ts-mode      . ("vscode-css-language-server" "--stdio"))
     (js-ts-mode       . ("vscode-eslint-language-server" "--stdio"))
     (v-mode           . ("~/.config/v-analyzer/bin/v-analyzer" "--stdio")))
   eglot-server-programs))

(add-hook 'python-ts-mode #'eglot-ensure)
(add-hook 'fish-mode-hook #'eglot-ensure)
(add-hook 'markdown-ts-mode-hook #'eglot-ensure)
(add-hook 'json-ts-mode #'eglot-ensure)
(add-hook 'css-ts-mode #'eglot-ensure)
(add-hook 'js-ts-mode-hook #'eglot-ensure)
(add-hook 'v-mode-hook #'eglot-ensure)

(provide 'fwk-lsp)
