-- vim:ft=lua

local g       = vim.g
local set     = vim.opt
local plugins = require 'plugins'

require 'options'
require 'lazy_setup'

local lazy = require 'lazy'

lazy.setup(plugins)

require 'keybinds'

require 'wlsample.bubble'

g.coq_settings = { auto_start = 'shut-up' }

local lsp        = require 'lspconfig'
local coq        = require 'coq'
local coq_ensure = coq.lsp_ensure_capabilities

require 'nu'.setup {}

--[[
lsp.pkgbuild_language_server.setup(coq_ensure())
lsp.nim_langserver.setup(coq_ensure())
lsp.v_analyzer.setup(coq_ensure())
lsp.marksman.setup(coq_ensure())
lsp.tsserver.setup(coq_ensure())
lsp.pyright.setup(coq_ensure())
lsp.perlpls.setup(coq_ensure())
lsp.eslint.setup(coq_ensure())
lsp.lua_ls.setup(coq_ensure())
lsp.clangd.setup(coq_ensure())
lsp.jsonls.setup(coq_ensure())
lsp.cssls.setup(coq_ensure())
lsp.html.setup(coq_ensure())

g.everforest_background = 'hard'
g.everforest_better_performance = 1
]]

g.zig_fmt_autosave = false

vim.cmd 'colorscheme rose-pine'
