;; -*- lexical-binding: t; -*-

(setq inhibit-startup-echo-area-message user-real-login-name)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(horizontal-scroll-bar-mode 0)
(tooltip-mode 0)

(startup-redirect-eln-cache
  (concat user-emacs-directory "var/native-cache"))

(setq create-lockfiles nil
      use-dialog-box nil
      warning-minimum-level :emergency
      byte-compile-warnings '(not obsolete)
      warning-suppress-log-types '((comp) (bytecomp))
      native-comp-async-report-warnings-errors 'silent
      warning-minimum-log-level 'error
      package-enable-at-startup nil)


(set-face-attribute 'default nil
  :family "JetBrains Mono"
  :weight 'medium
  :height 140)
