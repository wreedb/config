;; -*- lexical-binding: t; -*-

(with-eval-after-load 'undo-fu
  (keymap-global-unset "C-z")
  (keymap-global-set "C-z"   'undo-fu-only-undo)
  (keymap-global-set "C-S-z" 'undo-fu-only-redo))

(with-eval-after-load 'projectile
  (keymap-global-set "C-c p" 'projectile-command-map))

(with-eval-after-load 'dashboard
  (add-hook 'dashboard-mode-hook
    (lambda () (keymap-local-set "C-c r" #'dashboard-refresh-buffer))))

(with-eval-after-load 'ivy
  (keymap-global-set "C-c C-r" 'ivy-resume)
  (keymap-global-set "C-x C-f" 'counsel-find-file)
  (keymap-global-set "M-x"     'counsel-M-x))

(use-package general
  :after (evil which-key)
  :config
  (general-evil-setup)
  (general-create-definer fwk/general-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (fwk/general-keys
    "SPC" '(counsel-M-x       :wk "execute-extended-command")
    "."   '(counsel-find-file :wk "find-file")

    "f"   '(:ignore t       :wk "FILES")
    "f r" '(counsel-recentf :wk "recent")
    "f c" '(:ignore t       :wk "CONFIG")
    "f c i" '(fwk-func/edit-init       :wk "init.el")
    "f c e" '(fwk-func/edit-early-init :wk "early-init.el")

    "TAB"     '(:ignore t                   :wk "COMMENT")
    "TAB TAB" '(comment-line                :wk "comment line")
    "TAB r"   '(comment-or-uncomment-region :wk "comment region")

    "b"   '(:ignore t        :wk "BUFFER")
    "b i" '(ibuffer          :wk "ibuffer")
    "b k" '(kill-this-buffer :wk "kill buffer")
    "b n" '(next-buffer      :wk "next buffer")
    "b p" '(previous-buffer  :wk "prev buffer")
    "b c" '(counsel-ibuffer  :wk "counsel-ibuffer")

    "h"   '(:ignore t                 :wk "HELP")
    "h v" '(counsel-describe-variable :wk "variable")
    "h f" '(counsel-describe-function :wk "function")
    "h F" '(counsel-describe-face     :wk "face")
    "h s" '(counsel-describe-symbol   :wk "symbol")

    "d"   '(:ignore t :wk "DIRED")
    "d d" '(dired     :wk "open dired") 
    
    "r"   '(:ignore t :wk "RELOAD")
    "r r" '(fwk-func/reload-buffer    :wk "buffer")
    "r i" '(fwk-func/reload-init-file :wk "init.el")
    
    "w"   '(:ignore t          :wk "WINDOW")
    "w c" '(evil-window-delete :wk "close")
    "w v" '(evil-window-vsplit :wk "vsplit")
    "w s" '(evil-window-split  :wk "split")

    "w h" '(evil-window-left  :wk "left")
    "w j" '(evil-window-down  :wk "down")
    "w k" '(evil-window-up    :wk "up")
    "w l" '(evil-window-right :wk "right")

    "t"   '(:ignore t                 :wk "TOGGLE")
    "t t" '(toggle-truncate-lines     :wk "truncated lines")
    "t n" '(display-line-numbers-mode :wk "line numbers")
    "t v" '(vterm-other-window        :wk "vterm")
    "t f" '(treemacs                  :wk "treemacs")

    "e"   '(:ignore t       :wk "EVAL")
    "e e" '(eval-expression :wk "expression")
    "e r" '(eval-region     :wk "region")
    "e b" '(eval-buffer     :wk "buffer")
    "e l" '(eval-last-sexp  :wk "last S-expression")
    "e f" '(eval-defun      :wk "defun")

    "o"   '(:ignore t              :wk "ORG")
    "o a" '(org-agenda             :wk "agenda")
    "o i" '(org-toggle-item        :wk "toggle item")
    "o x" '(org-export-dispatch    :wk "export dispatch")
    "o t" '(org-todo               :wk "todo")
    "o T" '(org-todo-list          :wk "todo list")

    "B"   '(:ignore t :wk "BABEL")
    "B t" '(org-babel-tangle :wk "tangle")
    
    "l"   '(:ignore t            :wk "LOAD")
    "l t" '(counsel-load-theme   :wk "theme")
    "l l" '(counsel-load-library :wk "library")
    "l f" '(load-file            :wk "file")

    "P" '(projectile-command-map :wk "PROJECTILE")))

(provide 'fwk-keybinds)
