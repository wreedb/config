(setq load-prefer-newer t
      auto-revert-avoid-polling t
      display-line-numbers-width 3)

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "JetBrains Mono Medium-14"))

(defconst wbr-config/dir
  user-emacs-directory
  "my config dir: '~/.config/emacs'")

(defconst wbr-config/assets
  (concat user-emacs-directory "assets/")
  "(user) misc. files such as images")

(defconst wbr-config/themes
  (concat user-emacs-directory "themes/")
  "my theme files")

(defconst wbr-config/var
  (concat user-emacs-directory "var/")
  "caches and varying files")

(defconst wbr-config/modules
  (concat user-emacs-directory "modules/")
  "directory for modular configuration files")

(defconst wbr-config/file-config
  (concat wbr-config/dir "config.el")
  "misc. configurations '~/.config/emacs/config.el'")

(defconst wbr-home/dir
  (concat (getenv "HOME") "/")
  "my HOME directory")

(defconst wbr-home/local
  (concat wbr-home/dir ".local/")
  "my '~/.local' directory")

(defconst wbr-home/bin
  (concat wbr-home/local "bin/")
  "my '~/.local/bin' directory")

(defconst wbr-home/org-dir
  (concat wbr-home/dir "Documents/org/")
  "my org-mode directory")

(mkdir wbr-home/org-dir t)
(mkdir wbr-config/modules t)
(mkdir wbr-config/assets t)
(mkdir wbr-config/var t)

(setq load-path
  (cons wbr-config/modules load-path))

(setq custom-file "/dev/null")

(setq auto-save-list-file-prefix
  (concat wbr-config/var "auto-save/saves-"))

(setq auto-save-default nil)

(setq savehist-file (concat wbr-config/var "savehist"))

(setq url-configuration-directory (concat wbr-config/var "url/"))
(setq recentf-save-file (concat wbr-config/var "recentf"))

(setq backup-by-copying t
      delete-old-versions t)

(setq backup-directory-alist
      `(("." . ,(concat wbr-config/var "backup/"))))

(use-package transient
  :custom
  (transient-levels-file  (concat wbr-config/var "transient/levels.el"))
  (transient-history-file (concat wbr-config/var "transient/history.el"))
  (transient-values-file  (concat wbr-config/var "transient/values.el")))

(use-package parent-mode)

(use-package hydra)
(use-package quelpa
  :custom (quelpa-dir (concat wbr-config/var "quelpa/")))

(use-package swiper)
(use-package sudo-edit)

(use-package markdown-ts-mode)
(use-package just-ts-mode)
(use-package zig-ts-mode)
(use-package v-mode)
(use-package lua-mode)
(use-package fish-mode)
(use-package racket-mode)
(use-package hyprlang-ts-mode
  :custom (hyprlang-ts-mode-indent-offset 2))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-vibrant t))

(use-package gruvbox-theme)
(use-package one-themes)
(use-package kaolin-themes)

(use-package smex
  :custom
  (smex-save-file (concat wbr-config/var "smex-save-file")))

(use-package slime)
(use-package magit)

(use-package rich-minority
  :delight
  :config (rich-minority-mode t))

(use-package vterm
  :custom
  (vterm-shell "/usr/bin/fish")
  (vterm-always-compile-module t))

(use-package ligature
  :delight global-ligature-mode
  :hook (prog-mode . ligature-mode)
  :config (load-library "ligatures_jetbrains-mono.el"))

(use-package counsel
  :config (counsel-mode))

(use-package ivy
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-initial-inputs-alist nil)
  :bind
  (("C-c C-r" . 'ivy-resume)
   ("M-x"     . 'counsel-M-x)
   ("C-x C-f" . 'counsel-find-file))
  :config
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (ivy-mode))

(use-package ivy-rich
  :after (ivy)
  :delight ivy-rich-mode
  :config (ivy-rich-mode t))

(use-package ivy-posframe
  :after (ivy ivy-rich)
  :delight ivy-posframe-mode
  :custom
  (ivy-posframe-parameters
    '((left-fringe  . 8)
      (right-fringe . 8)))
  (ivy-posframe-border-width 3)
  (ivy-posframe-display-functions-alist
   '((counsel-M-x . ivy-posframe-display-at-frame-center)
     (t . ivy-posframe-display)))
  :config
  (ivy-posframe-mode t))

(use-package page-break-lines
  :delight
  :config (page-break-lines-mode))

(use-package doom-modeline
  :after (nerd-icons)
  :custom (doom-modeline-icon t)
  :config (doom-modeline-mode))

(use-package dashboard
  :after (nerd-icons projectile)
  :config
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents   . 6)
                          (bookmarks . 3)
                          (projects  . 3)))
  (setq dashboard-modify-heading-icons
        '((recents . "nf-fa-file_text")
          (bookmarks . "nf-fa-bookmark")
          (projects . "nf-fa-folder_tree")))
  (setq dashboard-banner-logo-title "Hey, Will.")
  (setq dashboard-startup-banner (concat wbr-config/assets "emacs.png"))
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (dashboard-setup-startup-hook))

(use-package projectile
  :custom
  (projectile-cache-file (concat wbr-config/var "projectile.cache"))
  (projectile-known-projects-file (concat wbr-config/var "projectile-known-projects.eld"))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode t))

(use-package which-key
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-side-window-slot -10)
  (which-key-side-window-max-height 0.25)
  (which-key-allow-imprecise-window-fit t)
  (which-key-max-description-length 25)
  (which-key-max-display-columns nil)
  (which-key-min-display-lines 6)
  (which-key-idle-delay 0.8)
  :config
  (which-key-mode t))

(use-package undo-fu
  :config (global-unset-key (kbd "C-z"))
  :bind (("C-z" . 'undo-fu-only-undo)
         ("C-S-z" . 'undo-fu-only-redo)))

(use-package evil
  :after (undo-fu)
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-fu)
  :config (evil-mode))

(use-package evil-collection
  :after (evil)
  :config (evil-collection-init))

(use-package evil-surround
  :after (evil)
  :config (global-evil-surround-mode t))

(use-package evil-cleverparens
  :after (evil)
  :hook ((emacs-lisp-mode . evil-cleverparens-mode)
         (lisp-mode       . evil-cleverparens-mode)
         (scheme-mode     . evil-cleverparens-mode)
         (racket-mode     . evil-cleverparens-mode)))

(use-package rainbow-mode
  :delight
  :hook
  ((prog-mode    . rainbow-mode)
   (help-mode    . rainbow-mode)
   (org-mode     . rainbow-mode)))

(use-package rainbow-delimiters
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package suggest)

(use-package eros
  :hook (emacs-lisp-mode . eros-mode)
  :config (eros-mode t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :after (orderless)
  :custom
  (corfu-auto t)
  (corfu-quit-no-match t)
  :config (global-corfu-mode))

(use-package vertico
  :after (orderless)
  :config (vertico-mode))

(use-package vertico-posframe
  :config
  (setq vertico-posframe-parameters
    '((left-fringe . 8)
      (right-fringe . 8)))
  (vertico-posframe-mode t))

(use-package highlight-defined
  :delight
  :hook
  ((prog-mode    . highlight-defined-mode)
   (help-mode    . highlight-defined-mode)))

(use-package highlight-quoted
  :delight
  :hook
  ((prog-mode . highlight-quoted-mode)
   (help-mode . highlight-quoted-mode)))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

; (require 'highlight-numbers)
; (add-hook 'prog-mode-hook #'highlight-numbers-mode)

(require 'org)
(require 'org-tempo)
(setq org-directory wbr-home/org-dir
      org-default-notes-file (concat org-directory "notes.org")
      org-agenda-files (list org-directory)
      org-auto-align-tags t
      org-tags-column 0)

(use-package org-modern
  :delight org-modern-mode
  :hook (org-mode . org-modern-mode))

(use-package toc-org)

(use-package nerd-icons
  :custom (nerd-icons-font-family "Symbols Nerd Font Mono"))

(use-package nerd-icons-ivy-rich
  :after (ivy-rich)
  :config
  (nerd-icons-ivy-rich-mode t)
  (ivy-rich-mode t))

(use-package nerd-icons-corfu
  :after (corfu)
  :config (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :delight
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :delight
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package general
  :after (evil which-key projectile)
  :config
  (general-evil-setup)
  (general-create-definer wbr/general-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (wbr/general-keys
    "SPC" '(counsel-M-x     :wk "Better M-x")
    "." '(counsel-find-file :wk "find file")

    "f"   '(:ignore t       :wk "FILES:")
    "f r" '(counsel-recentf :wk "recent")

    "TAB"     '(:ignore t                   :wk "COMMENT:")
    "TAB TAB" '(comment-line                :wk "line")
    "TAB r"   '(comment-or-uncomment-region :wk "region")

    "b"   '(:ignore t        :wk "BUFFER:")
    "b i" '(ibuffer          :wk "ibuffer")
    "b k" '(kill-this-buffer :wk "kill")
    "b n" '(next-buffer      :wk "next")
    "b p" '(previous-buffer  :wk "previous")
    "b c" '(counsel-ibuffer  :wk "counsel-ibuffer")
    "b r" '(revert-buffer    :wk "sync/reload buffer")

    "d"   '(:ignore t                 :wk "DESCRIBE:")
    "d v" '(counsel-describe-variable :wk "variable")
    "d f" '(counsel-describe-function :wk "function")
    "d F" '(counsel-describe-face     :wk "face")
    "d s" '(counsel-describe-symbol   :wk "symbol")

    "w"   '(:ignore t          :wk "WINDOW:")
    "w c" '(evil-window-delete :wk "close")
    "w v" '(evil-window-vsplit :wk "vsplit")
    "w s" '(evil-window-split  :wk "split")

    "w h" '(evil-window-left  :wk "left")
    "w j" '(evil-window-down  :wk "down")
    "w k" '(evil-window-up    :wk "up")
    "w l" '(evil-window-right :wk "right")

    "t"   '(:ignore                   :wk "TOGGLE:")
    "t t" '(toggle-truncate-lines     :wk "truncated lines")
    "t n" '(display-line-numbers-mode :wk "line numbers")

    "e"   '(:ignore t       :wk "EVAL:")
    "e e" '(eval-expression :wk "expression")
    "e r" '(eval-region     :wk "region")
    "e b" '(eval-buffer     :wk "buffer")
    "e l" '(eval-last-sexp  :wk "last S-expression")
    "e f" '(eval-defun      :wk "defun")

    "o"   '(:ignore t              :wk "ORG:")
    "o s" '(tempo-template-org-src :wk "insert source block")
    "o a" '(org-agenda             :wk "agenda")
    "o i" '(org-toggle-item        :wk "toggle item")
    "o x" '(org-export-dispatch    :wk "export dispatch")
    "o b" '(org-babel-tangle       :wk "babel tangle")
    "o t" '(org-todo               :wk "todo")
    "o T" '(org-todo-list          :wk "todo list")

    "l"   '(:ignore t            :wk "LOAD:")
    "l t" '(counsel-load-theme   :wk "theme")
    "l l" '(counsel-load-library :wk "library")
    "l f" '(load-file            :wk "file")

    "p" '(projectile-command-map :wk "projectile")))

(setq dired-kill-when-opening-new-dired-buffer t
      enable-recursive-minibuffers t
      truncate-lines t
      tab-always-indent 'complete
      tab-width 4
      sentence-end-double-space nil
      blink-cursor-mode nil
      pixel-scroll-precision-mode nil
      column-number-mode t
      electric-indent-mode nil
      indent-tabs-mode nil
      recentf-mode t)

(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(set-fontset-font t nil
  (font-spec
    :name "Symbols Nerd Font Mono"
    :size 14))

(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
(set-face-attribute
  'font-lock-function-call-face nil
  :weight 'bold
  :underline t)

(set-face-attribute 'ivy-posframe-border nil :background "grey")

;; in case counsel breaks
(keymap-global-set "C-x M-x" 'execute-extended-command)

(require 'eglot)
(setq eglot-server-programs (append
  '((markdown-ts-mode   . ("marksman" "server"))
    (bash-ts-mode       . ("bash-language-server" "start"))
    (css-ts-mode        . ("vscode-css-language-server" "--stdio"))
    (js-ts-mode         . ("deno" "lsp"))
    (html-mode          . ("vscode-html-language-server" "--stdio"))
    (json-ts-mode       . ("vscode-json-language-server" "--stdio"))
    (python-ts-mode     . ("pylsp"))
    (c-ts-mode          . ("clangd"))
    (c++-ts-mode        . ("clangd"))
    (go-ts-mode         . ("gopls"))
    (typescript-ts-mode . ("deno" "lsp"))
    (yaml-ts-mode       . ("yaml-language-server" "--stdio"))
    (v-mode             . ("v-analyzer" "--stdio"))
    (rust-ts-mode       . ("rust-analyzer"))
    (fish-mode          . ("fish-lsp" "start"))
    (lua-mode           . ("lua-language-server")))
  eglot-server-programs))

(require 'treesit)

(setq treesit-language-source-alist
  '((hyprlang        "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")
    (c               "https://github.com/tree-sitter/tree-sitter-c")
    (h               "https://github.com/tree-sitter/tree-sitter-c")
    (cpp             "https://github.com/tree-sitter/tree-sitter-cpp")
    (cxx             "https://github.com/tree-sitter/tree-sitter-cpp")
    (hpp             "https://github.com/tree-sitter/tree-sitter-cpp")
    (hxx             "https://github.com/tree-sitter/tree-sitter-cpp")
    (bash            "https://github.com/tree-sitter/tree-sitter-bash")
    (cmake           "https://github.com/uyha/tree-sitter-cmake")
    (css             "https://github.com/tree-sitter/tree-sitter-css")
    (go              "https://github.com/tree-sitter/tree-sitter-go")
    (html            "https://github.com/tree-sitter/tree-sitter-html")
    (javascript      "https://github.com/tree-sitter/tree-sitter-javascript")
    (json            "https://github.com/tree-sitter/tree-sitter-json")
    (make            "https://github.com/alemuller/tree-sitter-make")
    (markdown        "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src")
    (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src")
    (python          "https://github.com/tree-sitter/tree-sitter-python")
    (toml            "https://github.com/tree-sitter/tree-sitter-toml")
    (tsx             "https://github.com/tree-sitter/tree-sitter-typescript")
    (typescript      "https://github.com/tree-sitter/tree-sitter-typescript")
    (yaml            "https://github.com/ikatyang/tree-sitter-yaml")
    (v               "https://github.com/nedpals/tree-sitter-v")
    (elisp           "https://github.com/wilfred/tree-sitter-elisp")
    (scss            "https://github.com/tree-sitter-grammars/tree-sitter-scss")
    (just            "https://github.com/indianboy42/tree-sitter-just")
    (zig             "https://github.com/maxxnino/tree-sitter-zig")))

(setq treesit-font-lock-level 4
      go-ts-mode-indent-offset 4)

(setq auto-mode-alist (append
  '(("\\.toml\\'"         . toml-ts-mode)
    ("\\.c\\'"            . c-ts-mode)
    ("\\.h\\'"            . c-ts-mode)
    ("\\.cpp\\'"          . c++-ts-mode)
    ("\\.cxx\\'"          . c++-ts-mode)
    ("\\.hpp\\'"          . c++-ts-mode)
    ("\\.hxx\\'"          . c++-ts-mode)
    ("\\.md\\'"           . markdown-ts-mode)
    ("\\.ts\\'"           . typescript-ts-mode)
    ("\\.tsx\\'"          . typescript-ts-mode)
    ("\\.go\\'"           . go-ts-mode)
    ("\\.go\\'"           . go-mod-ts-mode)
    ("\\.js\\'"           . js-ts-mode)
    ("\\.jsx\\'"          . js-ts-mode)
    ("\\.css\\'"          . css-ts-mode)
    ("\\.sh\\'"           . bash-ts-mode)
    ("\\.bash\\'"         . bash-ts-mode)
    ("\\.java\\'"         . java-ts-mode)
    ("\\.json\\'"         . json-ts-mode)
    ("\\.jsonc\\'"        . json-ts-mode)
    ("\\.rb\\'"           . ruby-ts-mode)
    ("\\.rs\\'"           . rust-ts-mode)
    ("\\.yaml\\'"         . yaml-ts-mode)
    ("\\.yml\\'"          . yaml-ts-mode)
    ("\\CMakeList.txt\\'" . cmake-ts-mode)
    ("\\.cmake\\'"        . cmake-ts-mode)
    ("\\.py\\'"           . python-ts-mode)
    ("\\.pyc\\'"          . python-ts-mode)
    ("\\hyprland.conf\\'" . hyprlang-ts-mode)
    ("\\hyprlock.conf\\'" . hyprlang-ts-mode)
    ("\\.fish\\'"         . fish-mode)
    ("\\.rkt\\'"          . racket-mode)
    ("\\.lua\\'"          . lua-mode)
    ("\\.zig\\'"          . zig-ts-mode)
    ("\\.zig.zon\\'"      . zig-ts-mode)
    ("\\.v\\'"            . v-mode)
    ("\\v.mod\\'"         . v-mode)
    ("\\justfile\\'"      . just-ts-mode))
  auto-mode-alist))
