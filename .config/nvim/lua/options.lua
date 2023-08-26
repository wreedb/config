-- vim:ft=lua:fileencoding=utf-8
--
local set = vim.opt
local g   = vim.g

g.mapleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

set.number = true
set.wrap = false
set.expandtab = true
set.incsearch = true
set.termguicolors = true
set.smartcase = true
set.showmode = true
set.hlsearch = false
set.swapfile = false
set.updatetime = 300
set.backup = false
set.writebackup = false
set.cursorline = true
set.splitbelow = true
set.splitright = true
set.ignorecase = true
set.numberwidth = 4
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.scrolloff = 8
set.showtabline = 2
set.laststatus = 3
set.errorbells = false
set.signcolumn = 'yes'
set.mouse = 'a'
set.shell = os.getenv('SHELL')
set.syntax = 'ON'
set.encoding = 'utf-8'
set.backspace = 'indent,start,eol'
set.guifont = "JetBrains Mono:h14"

g.background = 'dark'
