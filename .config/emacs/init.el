;; -*- lexical-binding: t; -*-

(defconst emacs/dir
  (format "%s" user-emacs-directory)
  "~/.config/emacs")

(defconst emacs/cache
  (expand-file-name "cache" emacs/dir)
  "cache for emacs files")

(defconst emacs/assets
  (expand-file-name "assets" emacs/dir)
  "images and ascii files")

(defconst emacs/packages
  (expand-file-name "packages" emacs/cache)
  "Directory for storing packages")

(defconst emacs/packages-gpghome
  (expand-file-name "gnupg" emacs/packages)
  "Keyring info for package archives")

(defconst emacs/ts-grammars
  (expand-file-name "tree-sitter" emacs/cache)
  "Tree sitter grammars")

(defconst emacs/early-init
  (expand-file-name "early-init.el" emacs/dir)
  "Emacs early init file")

(defconst emacs/init-file
  (format "%s" user-init-file)
  "Emacs init file")

(defconst emacs/literate-config
  (expand-file-name "README.org" emacs/dir)
  "Literate Emacs configuration document")

(defconst home-dir
  (format "%s/" (getenv "HOME"))
  "home (~) directory")

(defconst home-lib
  (expand-file-name ".local/lib" home-dir)
  "local lib directory")

(defconst xdg/config-home
  (expand-file-name ".config" home-dir)
  "~/.config XDG directory")

(defconst xdg/cache-home
  (expand-file-name ".cache" home-dir)
  "~/.cache XDG directory")

(defconst xdg/data-home
  (expand-file-name ".local/share" home-dir)
  "~/.local/share XDG directory")

(defconst xdg/state-home
  (expand-file-name ".local/state" home-dir)
  "~/.local/state XDG directory")

(defconst xdg/bin-home
  (expand-file-name ".local/bin" home-dir)
  "~/.local/bin XDG directory")

(defconst user/projects-dir
  (expand-file-name "projects" home-dir)
  "~/projects")

(defconst user/pictures-dir
  (expand-file-name "pictures" home-dir)
  "~/pictures")

(defconst user/desktop-dir
  (expand-file-name "desktop" home-dir)
  "~/desktop")

(defconst user/downloads-dir
  (expand-file-name "downloads" home-dir)
  "~/downloads")

(defconst user/documents-dir
  (expand-file-name "documents" home-dir)
  "~/documents")

(defconst user/videos-dir
  (expand-file-name "videos" home-dir)
  "~/videos")

(defconst user/music-dir
  (expand-file-name "music" home-dir)
  "~/music")

(defun reload/font ()
  "reload font/font-lock settings"
  (interactive)
  (set-face-attribute 'default nil
    :family "JetBrains Mono"
	:weight 'medium
    :height 140)

  (set-face-attribute 'fixed-pitch nil
	:family "JetBrains Mono"
	:weight 'medium
	:height 140)
  
  (set-face-attribute 'variable-pitch nil
	:family "Roboto"
	:weight 'medium
	:width 'condensed
	:height 140)

  ;; this must be a bug...
  (set-face-attribute 'help-key-binding nil
    :background 'unspecified
    :foreground 'unspecified
    :slant 'italic
    :weight 'bold
    :box nil)
  
  ;; fallback icons
  (set-fontset-font t nil (font-spec
	:size 14
	:dpi 96
	:name "Symbols Nerd Font Mono"))

  (setq-local font-lock-italics
   '(font-lock-comment-face
	 font-lock-comment-delimiter-face
	 font-lock-keyword-face))

  (dolist (face font-lock-italics)
	(set-face-attribute face nil :slant 'italic))
  
  (set-face-attribute 'font-lock-builtin-face nil :weight 'medium)

  (with-eval-after-load 'org-modern
	(set-face-attribute 'org-modern-symbol nil
	  :family "Iosevka Term"
	  :weight 'medium
	  :width 'expanded
	  :height 140)))

(defun efn (name basedir)
  "shorthand of 'expand-file-name' with BASEDIR required"
  (expand-file-name name basedir))

(defun treesit-install-all-grammars ()
  "Install all grammars listed in 'treesit-language-source-alist'"
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (unless (treesit-language-available-p (car grammar))
      (treesit-install-language-grammar (car grammar) emacs/ts-grammars))))

(defun add-hook-list (target modes)
  "Add hook TARGET to all members of MODES"
  (let ((modelist modes))
    (mapc (lambda (mode) (add-hook mode target)) modelist)))

(defun mkdir-p (dir &optional parents)
  "Create directory only if needed, optionally with parents"
  (unless (file-exists-p dir)
    (cond ((eq t parents)
	   (mkdir dir t))
	  ((eq nil parents)
	   (mkdir dir)))))

(defun reload/buffer ()
  "revert buffer, and autosave if needed"
  (interactive)
  (revert-buffer-quick t))

(defun reload/init-file ()
  "reload the emacs init.el file"
  (interactive)
  (load user-init-file))

(defun reload/early-init ()
  "reload the emacs early-init.el file"
  (interactive)
  (load emacs/early-init))

(defun load/this-file ()
  "load active buffers' file"
  (interactive)
  (load (buffer-file-name)))

(defun kill/current-buffer ()
  "kill active buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill/other-buffers ()
  "kill all other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun open/config-org ()
  "Open literate org emacs config for editing"
  (interactive)
  (find-file emacs/literate-config))

(defun open/init-file ()
  "open the emacs 'init.el' file for editing"
  (interactive)
  (find-file emacs/init-file))

(defun open/early-init ()
  "open the emacs 'early-init.el' file for editing"
  (interactive)
  (find-file emacs/init-file))

(defun eval/buffer ()
  "Evaluate active buffer"
  (interactive)
  (eval-buffer))

(defun list/random-item (lst)
  "retrieve random item from list LST"
  (nth (random (length lst)) lst))

(defconst package-selected-packages '(
  ;; generic libraries
  lv
  f
  s
  ht
  seq
  leaf
  leaf-keywords
  llama
  async
  dash
  annalist
  autothemer
  cl-lib
  dired-hacks-utils
  dired-subtree
  ;; features
  undo-fu
  consult
  eat
  vertico
  vertico-posframe
  marginalia
  dired-sidebar
  corfu
  cape
  goto-chg
  sudo-edit
  magit
  projectile
  helpful
  hydra
  ;; editing
  evil
  evil-surround
  evil-collection
  colorful-mode
  hl-todo
  rainbow-delimiters
  highlight-defined
  highlight-quoted
  highlight-numbers
  ;; interface
  doom-modeline
  page-break-lines
  nerd-icons
  nerd-icons-dired
  nerd-icons-ibuffer
  nerd-icons-corfu
  ;; themes
  kaolin-themes
  catppuccin-theme
  dashboard
  ;; builtin upgrades
  org tramp
  transient
  which-key
  eglot
  modus-themes
  ;; org-mode extensions
  org-modern
  toc-org
  org-contrib
  org-make-toc
  ;; language modes
  ini-mode
  markdown-ts-mode
  hyprlang-ts-mode
  swift-mode
  just-ts-mode
  fish-mode
  v-mode))

;; use native-comp when available
(when (native-comp-available-p)
  (setopt package-native-compile t))

;; archive sources
(setopt package-archives
 '(("gnu"    . "https://elpa.gnu.org/packages/")
   ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ("melpa"  . "https://melpa.org/packages/")))

;; archive priorities
(setopt package-archive-priorities
 '(("gnu"    . 75)
   ("nongnu" . 50)
   ("melpa"  . 25)))

;; keeping things clean
(setopt package-user-dir emacs/packages
		package-gnupghome-dir emacs/packages-gpghome
		package-install-upgrade-built-in t)

(require 'package)
(package-initialize)

;; only refresh archives when needed
(when (eq nil package-archive-contents)
  (package-refresh-contents))

;; install any packages that aren't already
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package t)))

(package-activate-all)

;; load leaf
(require 'leaf)
(require 'leaf-keywords)
(leaf-keywords-init)

(provide 'package-setup)

(leaf f
  :package t
  :leaf-autoload t)

(leaf s
  :package t
  :leaf-autoload t)

(leaf dash
  :package t
  :leaf-autoload t)

(leaf async
  :package t
  :leaf-autoload t)

(leaf llama
  :package t
  :leaf-autoload t)

(leaf annalist
  :package t
  :leaf-autoload t)

(leaf autothemer
  :package t
  :leaf-autoload t)

(leaf ht
  :package t
  :leaf-autoload t)

(leaf dired-hacks-utils
  :package t
  :leaf-autoload t)

(leaf dired-subtree
  :package t
  :leaf-autoload t)

(leaf shrink-path
  :package t
  :leaf-autoload t)

(leaf emacs
  :package nil
  :init
  (setopt tab-width 4)
  (setopt display-line-numbers-width 3)
  (setopt enable-recursive-minibuffers t)
  (setopt use-dialog-box nil)
  (setopt confirm-kill-processes nil)
  (setopt find-file-visit-truename nil)
  (setopt vc-follow-symlinks nil)
  (setopt truncate-lines t)
  (setopt blink-cursor-mode nil)
  (defalias 'yes-or-no-p 'y-or-n-p)
  :config
  (context-menu-mode t)
  (indent-tabs-mode nil)
  (pixel-scroll-precision-mode t)
  (column-number-mode t)
  (visual-line-mode -1)
  (add-hook-list #'display-line-numbers-mode
   '(prog-mode-hook org-mode-hook conf-mode-hook)))

  (leaf compat
    :package nil
    :leaf-autoload t)

  (leaf cl-lib
    :package nil
    :leaf-autoload t)

  (leaf cl-lib
    :package nil
    :leaf-autoload t)

  (leaf cl-print
    :package nil
    :leaf-autoload t)

  (leaf compat
    :package nil
    :leaf-autoload t)

  (leaf seq
    :package nil
    :leaf-autoload t)

  ;; utils
  (leaf dired
    :package nil
    :require t
    :init (setopt dired-kill-when-opening-new-dired-buffer t))

  (leaf savehist
    :package nil
    :require t
    :init (setopt savehist-file (efn "savehist" emacs/cache))
    :global-minor-mode savehist-mode)

  (leaf autorevert
    :package nil
    :require t
    :init
    (setopt auto-revert-verbose nil)
    (setopt global-auto-revert-non-file-buffers t)
    :global-minor-mode global-auto-revert-mode)

  (leaf recentf
    :package nil
    :require t
    :init (setopt recentf-save-file (efn "recentf" emacs/cache))
    :global-minor-mode recentf-mode)

  (leaf time
    :package nil
    :require t
    :init
    (setopt display-time-default-load-average nil)
    (setopt display-time-format "%I:%M %p")
    :global-minor-mode display-time-mode)

  (leaf editorconfig
    :package nil
    :require t
    :config
    (editorconfig-mode t))

  (leaf ispell
    :package nil
    :require t
    :init
    (setopt ispell-program-name "hunspell")
    (setopt ispell-local-dictionary "en_US-large")
    (setopt ispell-alternate-dictionary "/usr/share/hunspell/en_US.aff"))

  (leaf treesit
    :package nil
    :require t
    :init
    (setopt treesit-extra-load-path (list home-lib emacs/ts-grammars))
    (setopt treesit-font-lock-level 4)
    (setopt treesit-language-source-alist
     '((hyprlang   "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")
       (c          "https://github.com/tree-sitter/tree-sitter-c")
       (cpp        "https://github.com/tree-sitter/tree-sitter-cpp")
       (bash       "https://github.com/tree-sitter/tree-sitter-bash")
       (cmake      "https://github.com/uyha/tree-sitter-cmake")
       (css        "https://github.com/tree-sitter/tree-sitter-css")
       (go         "https://github.com/tree-sitter/tree-sitter-go")
       (nix        "https://github.com/nix-community/tree-sitter-nix")
       (rust       "https://github.com/tree-sitter/tree-sitter-rust")
       (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
       (json       "https://github.com/tree-sitter/tree-sitter-json")
       (python     "https://github.com/tree-sitter/tree-sitter-python")
       (toml       "https://github.com/tree-sitter/tree-sitter-toml")
       (yaml       "https://github.com/ikatyang/tree-sitter-yaml")
       (just       "https://github.com/indianboy42/tree-sitter-just")
       (lua        "https://github.com/tjdevries/tree-sitter-lua" "v0.2.0")
	   (swift      "https://github.com/alex-pinkus/tree-sitter-swift")
       (zig        "https://github.com/maxxnino/tree-sitter-zig")
	   (god        "https://github.com/wreedb/tree-sitter-god"))))

  (leaf font-lock
    :package nil
    :require t
    :config
    :global-minor-mode global-font-lock-mode)

(leaf tramp
  :package t
  :init (setopt tramp-persistency-file-name (efn "tramp" emacs/cache)))

(leaf transient
  :package t
  :require t
  :init
  (setopt transient/dir (efn "transient" emacs/cache))
  (unless (file-exists-p transient/dir) (mkdir transient/dir t))
  (setopt transient-levels-file (efn "levels.el" transient/dir))
  (setopt transient-values-file (efn "values.el" transient/dir))
  (setopt transient-history-file (efn "history.el" transient/dir)))

(leaf eglot
  :package t
  :require t
  :init
  (setopt eglot-server-programs
   '((python-ts-mode . ("basedpyright-langserver" "--stdio"))
     (fish-mode . ("fish-lsp" "start"))
     (rust-ts-mode . ("rust-analyzer"))
	 (js-ts-mode . ("vscode-eslint-language-server" "--stdio"))
	 (typescript-ts-mode . ("vscode-eslint-language-server" "--stdio"))
	 (markdown-mode . ("vscode-markdown-language-server" "--stdio"))
	 (markdown-ts-mode . ("vscode-markdown-language-server" "--stdio"))
	 (json-ts-mode . ("vscode-json-language-server" "--stdio"))
	 (css-ts-mode . ("vscode-css-language-server" "--stdio"))
	 (swift-mode . ("sourcekit-lsp"))
	 (lua-ts-mode . ("lua-language-server"))))
  (add-hook 'swift-mode #'eglot-ensure))

(leaf org
  :package t
  :leaf-autoload t
  :init
  (setopt org-directory (efn "org" user/projects-dir))
  (unless (file-exists-p org-directory) (mkdir org-directory t))
  :config
  (setopt org-default-notes-file (efn "notes.org" org-directory))
  (setopt org-agenda-files (list org-directory))
  (setopt org-auto-align-tags t)
  (setopt org-return-follows-link t)
  (setopt org-src-fontify-natively t)
  (setopt org-src-preserve-indentation t)
  (setopt org-edit-src-content-indentation 0)
  (setopt org-confirm-babel-evaluate nil))

(leaf org-modern
  :package t
  :after (org)
  :hook org-mode-hook)

(leaf toc-org
  :package t
  :after (org)
  :hook org-mode-hook)

(leaf org-tempo
  :package nil
  :require t
  :after (org))

`(leaf nerd-icons
  :package t
  :require t)

(leaf nerd-icons-dired
  :package t
  :after (nerd-icons)
  :hook dired-mode-hook)

(leaf nerd-icons-ibuffer
  :package t
  :after (nerd-icons)
  :hook ibuffer-mode-hook)

(leaf nerd-icons-corfu
  :package t
  :after (nerd-icons corfu)
  :config
  (setopt corfu-margin-formatters (cons #'nerd-icons-corfu-formatter corfu-margin-formatters)))

(leaf undo-fu
  :package t
  :require t
  :init
  (setopt undo-limit 67108864)
  (setopt undo-strong-limit 100663296)
  (setopt undo-outer-limit 1006632960)
  :config
  (keymap-set global-map "C-u u" #'undo-fu-only-undo)
  (keymap-set global-map "C-u r" #'undo-fu-only-redo)
  (keymap-set global-map "C-u C-r" #'undo-fu-only-redo-all))

(leaf vertico
  :require t
  :config (vertico-mode t))

(leaf vertico-posframe
  :require t
  :config (vertico-posframe-mode t))

(leaf marginalia
  :package t
  :require t
  :after (vertico)
  :config (marginalia-mode t))

(leaf consult
  :package t
  :after (vertico marginalia)
  :require t)

(leaf eat
  :package t
  :commands (eat eat-other-window)
  :leaf-autoload t)

(leaf sudo-edit
  :package t
  :commands sudo-edit-find-file
  :leaf-autoload t)

(leaf magit
  :package t
  :after (transient)
  :commands magit
  :leaf-autoload t)

(leaf projectile
  :package t
  :require t
  :init
  (setopt projectile-known-projects-file (efn "projectile/known-projects.eld" emacs/cache))
  (keymap-set global-map "C-c p" #'projectile-command-map)
  :global-minor-mode projectile-mode)

(leaf cape
  :package t
  :require t
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(leaf corfu
  :package t
  :require t
  :config
  (setopt tab-always-indent 'complete)
  (setopt read-extended-command-predicate #'command-completion-default-include-p)
  (setopt corfu-popupinfo-max-height 35)
  (setopt corfu-quit-no-match t)
  (setopt corfu-auto t)
  (corfu-popupinfo-mode t)
  (global-corfu-mode t))

(leaf evil
  :require t
  :after (undo-fu)
  :init
  (setopt evil-want-keybindings nil)
  (setopt evil-undo-system 'undo-fu)
  :config (evil-mode t))

(leaf evil-surround
  :after (evil)
  :global-minor-mode global-evil-surround-mode)

(leaf evil-collection
  :require t
  :after (evil evil-surround)
  :config (evil-collection-init))

(leaf centered-cursor-mode
  :package t
  :commands centered-cursor-mode
  :leaf-autoload t)

(leaf highlight-defined
  :package t
  :require t
  :hook prog-mode-hook conf-mode-hook)

(leaf highlight-quoted
  :require t
  :hook prog-mode-hook conf-mode-hook)

(leaf highlight-numbers
  :require t
  :hook prog-mode-hook conf-mode-hook)

(leaf rainbow-delimiters
  :require t
  :hook prog-mode-hook conf-mode-hook)

(leaf colorful-mode
  :commands colorful-mode
  :leaf-autoload t
  :config
  (advice-add 'colorful-add-color-names :override #'ignore)
  :hook prog-mode-hook conf-mode-hook)

(leaf hl-todo
  :require t
  :global-minor-mode global-hl-todo-mode)

(leaf helpful
  :package t
  :require t
  :config
  (keymap-set global-map "C-h f" #'helpful-callable)
  (keymap-set global-map "C-h k" #'helpful-key)
  (keymap-set global-map "C-h x" #'helpful-command)
  (keymap-set global-map "C-h v" #'helpful-variable)
  (keymap-set global-map "C-c C-d" #'helpful-at-point))

(leaf parent-mode
  :package t
  :leaf-autoload t)

(leaf spdx
  :package t
  :leaf-autoload t)

(leaf dired-sidebar
  :package t
  :require t
  :config
  (keymap-set global-map "C-x C-d" 'dired-sidebar-toggle-sidebar))

(leaf ligature
  :package t
  :require t
  :init
  (defconst ligatures-jetbrainsmono
    '("--" "---" "==" "===" "!=" "!==" "=!=" "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++"
     "***" ";;" "!!" "??" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<>" "<<<" ">>>" "<<" ">>" "||" "-|"
     "_|_" "|-" "||-" "|=" "||=" "##" "###" "####" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:"
     "#!" "#=" "^=" "<$>" "<$" "$>" "<+>" "<+ +>" "<*>" "<* *>" "</" "</>" "/>" "<!--"
     "<#--" "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>" "==>" "=>"
     "=>>" ">=>" ">>=" ">>-" ">-" ">--" "-<" "-<<" ">->" "<-<" "<-|" "<=|" "|=>" "|->" "<-"
     "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~" "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]"
     "|>" "<|" "||>" "<||" "|||>" "|||>" "<|>" "..." ".." ".=" ".-" "..<" ".?" "::" ":::"
     ":=" "::=" ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__")
  "ligatures for JetBrains Mono")
  :config (ligature-set-ligatures 'prog-mode ligatures-jetbrainsmono)
  :global-minor-mode global-ligature-mode)

(leaf page-break-lines
  :package t
  :require t
  :global-minor-mode global-page-break-lines-mode)

(leaf dashboard
  :package t
  :require t
  :config
  (setq dashboard-center-content t
		dashboard-startup-banner (efn "icons/emacs.png" user/pictures-dir)
		dashboard-icon-type 'nerd-icons)
  (dashboard-setup-startup-hook))

;; some day i'll make my own modeline, but that day hasn't come yet.
(leaf doom-modeline
  :package t
  :require t
  :init
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-icon t)
  (setq doom-modeline-time-icon nil)
  (setq doom-modeline-battery nil)
  (setq doom-modeline-env-version nil)
  :global-minor-mode doom-modeline-mode)

(leaf catppuccin-theme
  :package t
  :require nil)

(leaf kaolin-themes
  :package t
  :require nil
  :config (load-theme 'kaolin-dark t))

;; (leaf doom-themes
;;   :package t
;;   :require t
;;   :config
;;   (setq doom-themes-enable-bold t)
;;   (setq doom-themes-enable-italic t)
;;   (load-theme 'doom-tomorrow-night t))

(leaf fish-mode
  :package t
  :mode "\\.fish\\'" "\\fish_variables\\'")

(leaf markdown-ts-mode
  :package t
  :mode "\\.md\\'" "\\.MD\\'" "\\.markdown\\'")

(leaf swift-mode
  :package t
  :mode "\\.swift\\'"
  :init
  (setopt swift-mode:basic-offset 4)
  (setopt swift-mode:parenthesized-expression-offset 4)
  (setopt swift-mode:multiline-statement-offset 4))

(leaf hyprlang-ts-mode
  :package t
  :mode "\\hyprland.conf\\'")

(leaf just-ts-mode
  :package t
  :mode "\\justfile\\'" "\\Justfile\\'")

(leaf nix-ts-mode
  :package t
  :mode "\\.nix\\'")

(leaf v-mode
  :package t
  :config
  (advice-add 'v-after-save-hook :override #'ignore)
  :mode "\\.v\\'" "\\.vsh\\'" "\\v.mod\\'")

(leaf ini-mode
  :package t
  :mode "\\.ini\\'")

(leaf zig-ts-mode
  :package t
  :mode "\\.zig\\'" "\\.zig.zon\\'")

(leaf perl-ts-mode
  :package nil
  :require t
  :mode "\\.pl\\'"
  :config
  (fset 'perl-mode #'perl-ts-mode)
  (fset 'cperl-mode #'perl-ts-mode))

(leaf which-key
  :package nil
  :after (helpful undo-fu)
  :init
  (setq which-key-side-window-location 'bottom)
  (setq which-key-side-window-slot -10)
  (setq which-key-side-window-max-height 0.25)
  (setq which-key-allow-imprecise-window-fit t)
  (setq which-key-popup-type 'minibuffer)
  (setq which-key-separator ": ")
  (setq which-key-max-description-length 25)
  (setq which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-max-display-columns nil)
  (setq which-key-min-display-lines 4)
  (setq which-key-idle-delay 0.6)
  :config
  (set-face-attribute 'which-key-key-face nil :weight 'bold)
  :global-minor-mode which-key-mode)

(defun keybind (prefix suffix map desc action)
  "setup keybind with which-key description"
  (setq-local fullkey (concat prefix " " suffix))
  (keymap-set map suffix action)
  (which-key-add-key-based-replacements fullkey desc))

(keymap-set global-map "C-+" #'text-scale-increase)
(keymap-set global-map "C--" #'text-scale-increase)
(keymap-set global-map "C-x k" #'kill/current-buffer)
(keymap-set global-map "C-x C-k" #'kill-buffer-and-window)

(defvar-keymap leadkey)

(evil-define-key 'normal global-map (kbd "SPC") leadkey)
(evil-define-key 'visual global-map (kbd "SPC") leadkey)
(evil-define-key 'normal dired-mode-map (kbd "SPC") leadkey)
(evil-define-key 'visual dired-mode-map (kbd "SPC") leadkey)
(evil-define-key 'normal ibuffer-mode-map (kbd "SPC") leadkey)
(evil-define-key 'visual ibuffer-mode-map (kbd "SPC") leadkey)
(evil-define-key 'normal splash-screen-keymap (kbd "SPC") leadkey)
(evil-define-key 'visual splash-screen-keymap (kbd "SPC") leadkey)

(with-eval-after-load 'evil-maps
  (keymap-unset evil-motion-state-map "SPC")
  (keymap-unset evil-motion-state-map "RET")
  (keymap-unset evil-motion-state-map "TAB"))

(with-eval-after-load 'org
  (evil-define-key 'normal org-mode-map (kbd "SPC") leadkey)
  (evil-define-key 'visual org-mode-map (kbd "SPC") leadkey))

(keybind "SPC" "."   leadkey "find file" #'find-file)
(keybind "SPC" "["   leadkey "find file at-point" #'find-file-at-point)
(keybind "SPC" "s"   leadkey "switch buffer" #'switch-to-buffer)
(keybind "SPC" "P"   leadkey "projectile" #'projectile-command-map)
(keybind "SPC" "SPC" leadkey "exec cmd" #'execute-extended-command)

(defvar-keymap         leadkey/files)
(keybind "SPC"     "f" leadkey       "files" leadkey/files)
(keybind "SPC f"   "r" leadkey/files "recent files" #'recentf)
(keybind "SPC f"   "l" leadkey/files "locate file" #'locate-file)

(defvar-keymap         leadkey/files/emacs)
(keybind "SPC f"   "e" leadkey/files "emacs dir" leadkey/files/emacs)
(keybind "SPC f e" "i" leadkey/files/emacs "edit init.el" #'open/init-file)
(keybind "SPC f e" "e" leadkey/files/emacs "edit early-init.el" #'open/early-init)
(keybind "SPC f e" "b" leadkey/files/emacs "browse files" #'(lambda () (interactive) (dired emacs/dir)))

(defvar-keymap       leadkey/buffers)
(keybind "SPC"   "b" leadkey         "buffers" leadkey/buffers)
(keybind "SPC b" "i" leadkey/buffers "ibuffer" #'ibuffer)
(keybind "SPC b" "k" leadkey/buffers "kill buffer" #'kill/current-buffer)
(keybind "SPC b" "K" leadkey/buffers "kill all other buffers" #'kill/other-buffers)
(keybind "SPC b" "n" leadkey/buffers "ibuffer" #'next-buffer)
(keybind "SPC b" "p" leadkey/buffers "ibuffer" #'previous-buffer)

(defvar-keymap           leadkey/comment)
(keybind "SPC"     "TAB" leadkey         "comment" leadkey/comment)
(keybind "SPC TAB" "TAB" leadkey/comment "comment region" #'comment-or-uncomment-region)
(keybind "SPC TAB" "l"   leadkey/comment "comment line" #'comment-line)

(defvar-keymap       leadkey/help)
(keybind "SPC"   "h" leadkey      "help" leadkey/help)
(keybind "SPC h" "v" leadkey/help "describe variable" #'helpful-variable)
(keybind "SPC h" "f" leadkey/help "describe function" #'helpful-callable)
(keybind "SPC h" "k" leadkey/help "describe key" #'helpful-key)
(keybind "SPC h" "p" leadkey/help "describe at-point" #'helpful-at-point)
(keybind "SPC h" "F" leadkey/help "describe face" #'describe-face)

(defvar-keymap       leadkey/window)
(keybind "SPC"   "w" leadkey        "window" leadkey/window)
(keybind "SPC w" "c" leadkey/window "close window" #'evil-window-delete)
(keybind "SPC w" "v" leadkey/window "v-split" #'evil-window-vsplit)
(keybind "SPC w" "s" leadkey/window "h-split" #'evil-window-split)
(keybind "SPC w" "h" leadkey/window "focus left" #'evil-window-left)
(keybind "SPC w" "j" leadkey/window "focus down" #'evil-window-down)
(keybind "SPC w" "k" leadkey/window "focus up" #'evil-window-up)
(keybind "SPC w" "l" leadkey/window "focus right" #'evil-window-right)

(defvar-keymap       leadkey/dired)
(keybind "SPC"   "d" leadkey       "dired" leadkey/dired)
(keybind "SPC d" "d" leadkey/dired "open dired" #'dired)
(keybind "SPC d" "t" leadkey/dired "sidebar" #'dired-sidebar-toggle-sidebar)
(keybind "SPC d" "e" leadkey/dired "emacs dir" #'(lambda () (interactive) (dired emacs/dir)))
(keybind "SPC d" "c" leadkey/dired "config dir" #'(lambda () (interactive) (dired xdg/config-home)))
(keybind "SPC d" "p" leadkey/dired "project dir" #'(lambda () (interactive) (dired user/projects-dir)))

(defvar-keymap       leadkey/reload)
(keybind "SPC"   "r" leadkey        "reload" leadkey/reload)
(keybind "SPC r" "r" leadkey/reload "reload buffer" #'reload/buffer)
(keybind "SPC r" "f" leadkey/reload "reload font" #'reload/font)
(keybind "SPC r" "i" leadkey/reload "reload init" #'reload/init-file)
(keybind "SPC r" "e" leadkey/reload "reload early-init" #'reload/early-init)

(defvar-keymap       leadkey/toggle)
(keybind "SPC"   "t" leadkey        "toggle" leadkey/toggle)
(keybind "SPC t" "t" leadkey/toggle "terminal" #'eat-other-window)
(keybind "SPC t" "d" leadkey/toggle "sidebar" #'dired-sidebar-toggle-sidebar)
(keybind "SPC t" "l" leadkey/toggle "line wrap" #'toggle-truncate-lines)
(keybind "SPC t" "n" leadkey/toggle "line numbers" #'display-line-numbers-mode)
(keybind "SPC t" "c" leadkey/toggle "center cursor" #'centered-cursor-mode)

(defvar-keymap       leadkey/eval)
(keybind "SPC"   "e" leadkey      "eval" leadkey/eval)
(keybind "SPC e" "e" leadkey/eval "expression" #'eval-expression)
(keybind "SPC e" "r" leadkey/eval "region" #'eval-region)
(keybind "SPC e" "b" leadkey/eval "buffer" #'eval-buffer)
(keybind "SPC e" "l" leadkey/eval "last S-expr" #'eval-last-sexp)
(keybind "SPC e" "f" leadkey/eval "defun" #'eval-defun)

(defvar-keymap       leadkey/org)
(keybind "SPC"   "o" leadkey     "org" leadkey/org)
(keybind "SPC o" "b" leadkey/org "tangle" #'org-babel-tangle)
(keybind "SPC o" "i" leadkey/org "toggle item" #'org-toggle-item)
(keybind "SPC o" "x" leadkey/org "export" #'org-export-dispatch)
(keybind "SPC o" "s" leadkey/org "insert src block" #'tempo-template-org-src)

(defvar-keymap       leadkey/compile)
(keybind "SPC"   "c" leadkey         "compile" leadkey/compile)
(keybind "SPC c" "c" leadkey/compile "byte-compile" #'(lambda () (interactive) (byte-compile-file (buffer-file-name))))
(keybind "SPC c" "n" leadkey/compile "native-compile" #'emacs-lisp-native-compile)
(keybind "SPC c" "N" leadkey/compile "native-compile+load" #'emacs-lisp-native-compile-and-load)

(defvar-keymap       leadkey/load)
(keybind "SPC"   "l" leadkey      "load" leadkey/load)
(keybind "SPC l" "t" leadkey/load "load: theme" #'consult-theme)
(keybind "SPC l" "l" leadkey/load "load: libary" #'load-library)
(keybind "SPC l" "f" leadkey/load "load: file" #'load-file)

(defvar-keymap       leadkey/undo)
(keybind "SPC"   "u" leadkey      "undo-fu" leadkey/undo)
(keybind "SPC u" "u" leadkey/undo "undo" #'undo-fu-only-undo)
(keybind "SPC u" "r" leadkey/undo "redo" #'undo-fu-only-redo)
(keybind "SPC u" "R" leadkey/undo "redo all" #'undo-fu-only-redo-all)

(setopt auto-mode-alist
 (append
     '(("\\.toml\\'" . toml-ts-mode)
       ("\\.god\\'" . god-ts-mode)
		   ("\\.c\\'" . c-ts-mode)
		   ("\\.h\\'" . c-ts-mode)
		   ("\\.pp\\'" . c++-ts-mode)
		   ("\\.hh\\'" . c++-ts-mode)
		   ("\\.cpp\\'" . c++-ts-mode)
		   ("\\.hpp\\'" . c++-ts-mode)
		   ("\\fonts.conf\\'" . conf-mode-maybe)
		   ("\\.desktop\\'" . conf-desktop-mode)
		   ("\\.service\\'" . conf-desktop-mode)
		   ("\\gitignore\\'" . conf-mode)
		   ("\\gitattributes\\'" . conf-mode)
		   ("\\.py\\'" . python-ts-mode)
		   ("\\.cmake\\'" cmake-ts-mode)
		   ("\\CMakeList.txt\\'" . cmake-ts-mode)
		   ("\\.lua\\'" . lua-ts-mode)
		   ("\\.yml\\'" . yaml-ts-mode)
		   ("\\.yaml\\'" . yaml-ts-mode)
		   ("\\.json\\'" . json-ts-mode)
		   ("\\.jsonc\\'" . json-ts-mode)
		   ("\\.rs\\'" . rust-ts-mode)
		   ("\\.rb\\'" . ruby-ts-mode)
		   ("\\.java\\'" . java-ts-mode)
		   ("\\.class\\'" . java-ts-mode)
		   ("\\.sh\\'" . bash-ts-mode)
		   ("\\.bash\\'" . bash-ts-mode)
		   ("\\.zsh\\'" . bash-ts-mode)
		   ("\\.css\\'" . css-ts-mode)
		   ("\\.js\\'" . js-ts-mode)
		   ("\\.jsx\\'" . js-ts-mode)
		   ("\\.go\\'" . go-ts-mode)
		   ("\\.ts\\'" . typescript-ts-mode)
		   ("\\.tsx\\'" . typescript-ts-mode))
		 auto-mode-alist))

(add-hook 'texinfo-mode-hook #'display-line-numbers-mode)
(add-hook 'toml-ts-mode-hook #'display-line-numbers-mode)

(defun after-init-org-require ()
  "Load org mode after init finishes"
  (interactive)
  (require 'org)
  (require 'org-contrib)
  (require 'org-modern)
  (require 'toc-org))

(add-hook 'after-init-hook #'reload/font)
(add-hook 'after-init-hook #'after-init-org-require)

(cd home-dir)
