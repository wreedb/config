;; -*- lexical-binding: t; -*-

;; theme setup
(fwk-func/load-fwk-lib 'fwk-theme)

;; misc. settings
(fwk-func/load-fwk-lib 'fwk-features)

;; main package declarations
(fwk-func/load-fwk-lib 'fwk-packages)

;; dashboard setup
(fwk-func/load-fwk-lib 'fwk-dashboard)

;; org-mode settings and packages
(fwk-func/load-fwk-lib 'fwk-org)

;; mode hooks from packages
(fwk-func/load-fwk-lib 'fwk-hooks)

;; general.el keybinds
(fwk-func/load-fwk-lib 'fwk-keybinds)

;; treesitter settings
(fwk-func/load-fwk-lib 'fwk-treesitter)

;; language->mode associations
(fwk-func/load-fwk-lib 'fwk-modes)

;; language-servers
(fwk-func/load-fwk-lib 'fwk-lsp)

;; font ligatures (jetbrains mono)
(fwk-func/load-fwk-lib 'fwk-ligatures)

;; italic, bold, colored text for code
(fwk-func/load-fwk-lib 'fwk-font-lock)
