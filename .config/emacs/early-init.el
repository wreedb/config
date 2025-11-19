;; -*- lexical-binding: t; -*-

(defconst emacs/tmp
  (expand-file-name (format "emacs-%d" (user-uid)) temporary-file-directory)
  "temporary directory for emacs files")

;; use /tmp for backup and autosave
(setopt backup-directory-alist `((".*" . ,emacs/tmp)))
(setopt auto-save-file-name-transforms `((".*" ,emacs/tmp t)))
(setopt auto-save-list-file-prefix emacs/tmp)

;; list of needed directories
(setq-local needed-dirs
  (list "cache" "cache/tree-sitter"
        "cache/transient" "cache/projectile" "cache/eln"
        "cache/packages" "cache/packages/gnupg"))

;; create the needed-dirs if they aren't there
(dolist (dir needed-dirs)
  (unless (file-exists-p (expand-file-name dir user-emacs-directory))
    (mkdir (expand-file-name dir user-emacs-directory) t)))

(setopt load-prefer-newer t) ;; prefer newer '.el' files over older '.elc/.eln' files
(setopt package-enable-at-startup nil)

(when (native-comp-available-p)
  (setopt native-compile-target-directory (concat user-emacs-directory "cache/eln/"))
  (startup-redirect-eln-cache native-compile-target-directory)
  (defconst native-comp-opts
    '("-mtune=native" "-march=skylake" "-O3"))
  (setopt native-comp-speed 3
          native-comp-jit-compilation t
          native-comp-async-warnings-errors-kind nil
          native-comp-compiler-options native-comp-opts
          native-comp-verbose 0
          native-comp-enable-subr-trampolines t
          native-comp-async-jobs-number 9))

;; avoid the flashbang
(push '(background-color . "#1D1F21") default-frame-alist)
;; (push '(foreground-color . "#B294BB") default-frame-alist)
;; disable ui elements I don't want
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(push '(horizontal-scroll-bars . nil) default-frame-alist)
(push '(font . "JetBrains Mono-14") default-frame-alist)
;(tooltip-mode nil)

(setopt frame-title-format '("gnu emacs: %b"))

;; change default echo area message
(advice-add 'startup-echo-area-message
  :override #'(lambda () (message "What's GNU with you?")))

;; reduce error messaging
(setq native-comp-async-warnings-errors-kind 'error
      native-comp-async-report-warnings-errors nil
      warning-suppress-log-types '((comp) (bytecomp))
      byte-compile-warning-types '(not obsolete)
      warning-minimum-log-level :error
      warning-minimum-level :error)

;; allows me to ignore the customize interface entirely <3
(setopt custom-file (concat user-emacs-directory "cache/custom.el"))
(setopt safe-local-variable-directories '("~/.config/emacs"))
(setopt load-path (cons (expand-file-name "local" user-emacs-directory) load-path))
