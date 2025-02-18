(setq load-prefer-newer t
      auto-revert-avoid-polling t
      display-line-numbers-width 3)

;; Avoid visiting symlinked file destination, rather
;; refer to them as the name of the symlink
(setq find-file-visit-truename nil
      vc-follow-symlinks nil)

(global-visual-line-mode t)

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'conf-mode-hook #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "JetBrains Mono Medium-14"))

(defconst wbr-config/dir
  user-emacs-directory
  "My config dir: '~/.config/emacs'")

(defconst wbr-config/assets
  (concat wbr-config/dir "assets/")
  "(user) misc. files such as images")

(defconst wbr-config/themes
  (concat wbr-config/dir "themes/")
  "My theme files")

(defconst wbr-config/var
  (concat wbr-config/dir "var/")
  "Caches and varying files")

(defconst wbr-config/modules
  (concat wbr-config/dir "modules/")
  "Directory for modular configuration files")

(defconst wbr-config/file-config-org
  (concat wbr-config/dir "configuration.org")
  "My configuration as a literate Org document")

(defconst wbr-config/file-config
  (concat wbr-config/dir "configuration.el")
  "The elisp file that 'wbr-config/file-config-org' is tangled into")

(defconst wbr-config/file-init
  (concat wbr-config/dir "init.el")
  "My init.el file '~/.config/emacs/init.el'")

(defconst wbr-config/file-early-init
  (concat wbr-config/dir "early-init.el")
  "The first file loaded on startup '~/.config/emacs/early-init.el'")

(defconst wbr-home/dir
  (concat (getenv "HOME") "/")
  "My $HOME (~) directory")

(defconst wbr-home/local
  (concat wbr-home/dir ".local/")
  "My '~/.local' directory")

(defconst wbr-home/bin
  (concat wbr-home/local "bin/")
  "My '~/.local/bin' directory")

(defconst wbr-home/org-dir
  (concat wbr-home/dir "Documents/org/")
  "My Org documents directory")

(defconst wbr-home/projects
  (concat wbr-home/dir "Projects/")
  "Directory containing all of my projects")

(mkdir wbr-home/org-dir t)
(mkdir wbr-config/modules t)
(mkdir wbr-config/assets t)
(mkdir wbr-config/var t)
;; Subdirectories that may be needed
(mkdir (concat wbr-config/var "auto-save")    t)
(mkdir (concat wbr-config/var "backup")       t)
(mkdir (concat wbr-config/var "native-cache") t)
(mkdir (concat wbr-config/var "transient")    t)
(mkdir (concat wbr-config/var "url")          t)
(mkdir (concat wbr-config/var "treemacs")     t)

(setq load-path
  (cons wbr-config/modules load-path))

(setq custom-file "/dev/null")

(setq auto-save-list-file-prefix
  (concat wbr-config/var "auto-save/saves-"))

(setq auto-save-default nil)

(setq savehist-file (concat wbr-config/var "savehist"))
(savehist-mode)

(setq url-configuration-directory (concat wbr-config/var "url/"))
(setq recentf-save-file (concat wbr-config/var "recentf"))
(recentf-mode)

(setq backup-by-copying t
      delete-old-versions t)

(setq backup-directory-alist
      `(("." . ,(concat wbr-config/var "backup/"))))

(setq tramp-persistency-file-name (concat wbr-config/var "tramp-persist")
      tramp-histfile-override (concat wbr-config/var "tramp-history"))

(load-file (concat wbr-config/modules "ligatures_jetbrains-mono.el"))
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-gruvbox-dark-variant "hard")
  (load-theme 'doom-gruvbox t)
  (set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
  (set-face-attribute 'font-lock-variable-name-face nil :weight 'bold)
  (set-face-attribute 'help-key-binding nil
	              :background nil
	              :foreground nil
		      :weight 'bold
		      :box nil))

;; (use-package catppuccin-theme
;;   :config
;;   (load-theme 'catppuccin t)
;;   (setq catppuccin-flavor 'mocha)
;;   (set-face-attribute 'font-lock-comment-face nil :slant 'italic)

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


(require 'qml-ts-mode)

(use-package ssass-mode)
(use-package markdown-ts-mode)
(use-package just-ts-mode)
(use-package zig-ts-mode)
(use-package v-mode)
(use-package lua-mode)
(use-package fish-mode)
(use-package racket-mode
  :config
  (setq racket-doc-index-directory (concat wbr-config/var "racket/"))
  (setq racket-repl-history-directory (concat wbr-config/var "racket/")))

(use-package hyprlang-ts-mode
  :custom (hyprlang-ts-mode-indent-offset 2))

;; for saving history of M-x commands between sessions, I've read that 
;; this can be done without smex, but I was unable to succeed in trying
(use-package smex
  :custom
  (smex-save-file (concat wbr-config/var "smex-save-file")))

(use-package sly)
(use-package magit)

;; Hides minor modes from modelines
(use-package rich-minority
  :delight
  :config (rich-minority-mode t))

;; A better terminal emulator for Emacs
(use-package vterm
  :custom
  (vterm-shell "/usr/bin/fish")
  (vterm-always-compile-module t))

;; Counsel and Ivy provide a much nicer interface, as well as
;; quality of life improvement wrappers for some regular Emacs functions
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

;; Provides a floating frame for M-x command among other things
(use-package ivy-posframe
  :after (ivy) ; if using doom-themes, add to :after list
  :init
  (setq ivy-posframe-parameters
    '((left-fringe  . 12)
      (right-fringe . 12)))
  (setq ivy-posframe-width 125)
  (setq ivy-posframe-height 10)
  (setq ivy-posframe-border-width 3)
  (setq ivy-posframe-display-functions-alist
   '((counsel-M-x . ivy-posframe-display-at-frame-center)
     (t . ivy-posframe-display)))
  :config
  (ivy-posframe-mode t)
  (set-face-attribute 'ivy-posframe-border nil :background "black"))

;; Changes ugly page breaks into neat lines
(use-package page-break-lines
  :delight
  :config (page-break-lines-mode))

;; The modeline from Doom Emacs
(use-package doom-modeline
  :after (nerd-icons)
  :custom (doom-modeline-icon t)
  :config (doom-modeline-mode))

;; The startup welcome screen buffer
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
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))

;; Project management
(use-package projectile
  :custom
  (projectile-cache-file (concat wbr-config/var "projectile.cache"))
  (projectile-known-projects-file (concat wbr-config/var "projectile-known-projects.eld"))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode t)
  (setq projectile-project-search-path '(("~/Projects" . 1))))

;; Makes the experience of Emacs have much less friction
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

(use-package treemacs
  :delight
  :custom
  (treemacs-show-hidden-files t)
  (treemacs-hide-dot-git-directory t)
  (treemacs-persist-file (concat wbr-config/var "treemacs/persist-file"))
  (treemacs-last-error-persist-file (concat wbr-config/var "treemacs/last-error-persist-file")))

(use-package treemacs-evil
  :after (treemacs evil))

;; I'm glad something like editorconfig exists.
(use-package editorconfig
  :delight
  :config (editorconfig-mode t))

;; Better undo system
(use-package undo-fu
  :config (global-unset-key (kbd "C-z"))
  :bind (("C-z" . 'undo-fu-only-undo)
	 ("C-S-z" . 'undo-fu-only-redo)))

;; I used [n]vim before Emacs
(use-package evil
  :after (undo-fu)
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-fu)
  :config (evil-mode))

;; Extra keybindings for evil-mode
(use-package evil-collection
  :after (evil)
  :config (evil-collection-init))

;; Like vim-surround but for evil-mode
(use-package evil-surround
  :after (evil)
  :config (global-evil-surround-mode t))

;; Better paren interaction for lisp-like languages
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
   (org-mode     . rainbow-mode)
   (toml-ts-mode . rainbow-mode)
   (conf-mode    . rainbow-mode)))

(use-package rainbow-delimiters
  :delight rainbow-delimiters-mode
  :hook
  ((prog-mode . rainbow-delimiters-mode)
   (toml-ts-mode . rainbow-delimiters-mode)))

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
  :after (vertico)
  :config
  (setq vertico-posframe-parameters
    '((left-fringe . 8)
      (right-fringe . 8)))
  (vertico-posframe-mode t))

(use-package highlight-defined
  :delight
  :hook
  ((prog-mode . highlight-defined-mode)
   (help-mode . highlight-defined-mode)))

(use-package highlight-quoted
  :delight
  :hook
  ((prog-mode . highlight-quoted-mode)
   (help-mode . highlight-quoted-mode)))

(use-package highlight-numbers
  :delight
  :hook (prog-mode . highlight-numbers-mode))

(require 'org)
(require 'org-tempo)
(setq org-directory wbr-home/org-dir
      org-default-notes-file (concat org-directory "notes.org")
      org-agenda-files (list org-directory)
      org-auto-align-tags t
      org-tags-column 0
      org-edit-src-content-indentation 0)

(use-package org-modern
  :delight
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
    "t v" '(vterm-other-window        :wk "vterm")
    "t f" '(treemacs                  :wk "treemacs")

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
      indent-tabs-mode nil)

(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(set-fontset-font t nil (font-spec
  :name "Symbols Nerd Font Mono"
  :size 14))

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
    (qml             "https://github.com/yuja/tree-sitter-qmljs")
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
    ("\\.qml\\'"          . qml-ts-mode)
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
    ("\\justfile\\'"      . just-ts-mode)
    ("\\gitignore\\'"     . conf-mode)
    ("\\gitattributes\\'" . conf-mode))
  auto-mode-alist))

(setq inferior-lisp-program (concat wbr-home/local "opt/sbcl/bin/sbcl"))
