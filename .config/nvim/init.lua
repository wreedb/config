local set      = vim.opt
local g        = vim.g
local theme    = vim.cmd.colorscheme
local ft       = vim.filetype
local nvimpath = vim.fn.stdpath
local cmd      = vim.cmd
local lsp      = vim.lsp

require "functions"
require "config.settings"
require "config.lazy"
require "config.filetypes"
require "config.keys"
require "config.treesitter"
require "config.neovide"

g.gruvbox_baby_background_color = "hard"
g.gruvbox_contrast_dark = "hard"
theme "tokyonight-night"

require "lines.evil"

lsp.config['clangd'] = {
    cmd = {"clangd"},
    filetypes = {"c", "cpp"},
    root_markers = {{ "compile_commands.json", "meson.build" }}
}

-- lsp.enable("clangd")
