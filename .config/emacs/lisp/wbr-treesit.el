;; -*- lexical-binding: t; -*-

(require 'treesit)

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


(setq treesit-font-lock-level 4
      go-ts-mode-indent-offset 4)

(provide 'wbr-treesit)
