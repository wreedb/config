-- main neovim settings
local set = vim.opt
local g   = vim.g

g.mapleader = " "
g.maplocalleader = " "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

set.number = true

set.wrap = false
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true

set.splitbelow = true
set.splitright = true
set.hlsearch = false
set.smartcase = true
set.incsearch = true

set.showmode = true
set.showtabline = 2
set.laststatus = 3

set.errorbells = false
set.backup = false
set.writebackup = false
set.swapfile = false
set.updatetime = 300

set.shell = "/usr/bin/bash"
set.backspace = "indent,start,eol"
set.encoding = "utf-8"
set.signcolumn = "yes"
set.syntax = "enable"
set.mouse = "a"

g.background = "dark"

set.termguicolors = true

set.timeout = true
set.timeoutlen = 300
