local set      = vim.opt
local g        = vim.g
local theme    = vim.cmd.colorscheme
local ft       = vim.filetype
local nvimpath = vim.fn.stdpath
local cmd      = vim.cmd

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
