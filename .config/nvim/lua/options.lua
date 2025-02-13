local set = vim.opt
local cmd = vim.cmd
local g   = vim.g

g.mapleader = " "
g.maplocalleader = "\\"

set.number = true
set.wrap = false
set.fileencoding = "utf-8"
set.shell = "fish"

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.backspace = "indent,start,eol"
set.smartcase = true

set.incsearch = true
set.hlsearch = false
set.ignorecase = true

set.backup = false
set.swapfile = false
set.writebackup = false

-- focus follows mouse
set.mousefocus = true
-- mouse works, but not in insert mode
set.mouse = "nv"

-- try to keep me centered by roughly 12 lines
set.scrolloff = 12
set.showtabline = 2
set.laststatus = 3
set.colorcolumn = "80"
set.signcolumn = "number"
set.cursorline = false
set.syntax = "on"
set.errorbells = false
set.termguicolors = true
set.guifont = "WBR Mono:h14"

g.background = "dark"
