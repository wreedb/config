;; -*- lexical-binding: t; -*- vim:ft=lisp

(use-package v-mode)

(use-package fish-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.fish\\'" . fish-mode))
    auto-mode-alist)))

(use-package racket-mode
  :init
  (setq racket-doc-index-directory (expand-file-name "racket/" wbr/cache-dir)
	racket-repl-history-directory (expand-file-name "racket/" wbr/cache-dir))
  (setq auto-mode-alist (append
    '(("\\.rkt\\'" . racket-mode))
    auto-mode-alist)))

(use-package zig-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.zig\\'"     . zig-ts-mode))
    '(("\\.zig.zon\\'" . zig-ts-mode))
    auto-mode-alist)))

(use-package just-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\justfile\\'" . just-ts-mode))
    '(("\\Justfile\\'" . just-ts-mode))
    auto-mode-alist)))

(use-package markdown-ts-mode
  :init
  (setq auto-mode-alist (append
    '(("\\.md\\'" . markdown-ts-mode))
    '(("\\.MD\\'" . markdown-ts-mode))
    auto-mode-alist)))

(use-package hyprlang-ts-mode
  :init (setq hyprlang-ts-mode-indent-offset 2))

(setq treesit-language-source-alist
 (append
  '((hyprlang    "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang")
    (qml         "https://github.com/yuja/tree-sitter-qmljs")
    (c           "https://github.com/tree-sitter/tree-sitter-c")
    (cpp         "https://github.com/tree-sitter/tree-sitter-cpp")
    (bash        "https://github.com/tree-sitter/tree-sitter-bash")
    (cmake       "https://github.com/uyha/tree-sitter-cmake")
    (css         "https://github.com/tree-sitter/tree-sitter-css")
    (go          "https://github.com/tree-sitter/tree-sitter-go")
    (html        "https://github.com/tree-sitter/tree-sitter-html")
    (javascript  "https://github.com/tree-sitter/tree-sitter-javascript")
    (json        "https://github.com/tree-sitter/tree-sitter-json")
    (make        "https://github.com/alemuller/tree-sitter-make")
    (markdown    "https://github.com/ikatyang/tree-sitter-markdown")
    (python      "https://github.com/tree-sitter/tree-sitter-python")
    (toml        "https://github.com/tree-sitter/tree-sitter-toml")
    (typescript  "https://github.com/tree-sitter/tree-sitter-typescript")
    (yaml        "https://github.com/ikatyang/tree-sitter-yaml")
    (elisp       "https://github.com/wilfred/tree-sitter-elisp")
    (just        "https://github.com/indianboy42/tree-sitter-just")
    (lua         "https://github.com/tjdevries/tree-sitter-lua")
    (zig         "https://github.com/maxxnino/tree-sitter-zig"))
 treesit-language-source-alist))

(setq auto-mode-alist
 (append
  '(("\\.toml\\'"         . toml-ts-mode)
    ("\\.c\\'"            . c-ts-mode)
    ("\\.C\\'"            . c-ts-mode)
    ("\\.h\\'"            . c-ts-mode)
    ("\\.H\\'"            . c-ts-mode)
    ("\\.cpp\\'"          . c++-ts-mode)
    ("\\.cxx\\'"          . c++-ts-mode)
    ("\\.hpp\\'"          . c++-ts-mode)
    ("\\.hxx\\'"          . c++-ts-mode)
    ("\\.ts\\'"           . typescript-ts-mode)
    ("\\.tsx\\'"          . typescript-ts-mode)
    ("\\.go\\'"           . go-ts-mode)
    ("\\go.mod\\'"        . go-mod-ts-mode)
    ("\\.js\\'"           . js-ts-mode)
    ("\\.jsx\\'"          . js-ts-mode)
    ("\\.css\\'"          . css-ts-mode)
    ("\\.sh\\'"           . bash-ts-mode)
    ("\\.bash\\'"         . bash-ts-mode)
    ("\\.java\\'"         . java-ts-mode)
    ("\\.class\\'"        . java-ts-mode)
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
    ("\\.pyi\\'"          . python-ts-mode)
    ("\\.pyd\\'"          . python-ts-mode)
    ("\\.pyo\\'"          . python-ts-mode)
    ("\\.pyw\\'"          . python-ts-mode)
    ("\\.pyz\\'"          . python-ts-mode)
    ("\\.lua\\'"          . lua-ts-mode)
    ("\\.v\\'"            . v-mode)
    ("\\v.mod\\'"         . v-mode)
    ("\\gitignore\\'"     . conf-mode)
    ("\\gitattributes\\'" . conf-mode)
    ("\\.conf\\'"         . conf-mode)
    ("\\.desktop\\'"      . conf-desktop-mode)
    ("\\.service\\'"      . conf-desktop-mode))
  auto-mode-alist))

(setq treesit-font-lock-level 4
      go-ts-mode-indent-offset 4)
