;; -*- lexical-binding: t; -*-


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

(provide 'wbr-general)
