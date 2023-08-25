-- vim:ft=lua:fileencoding=utf-8

local g     = vim.g
local set   = vim.opt
local theme = os.getenv('COLORSCHEME')


require 'options'
require 'lazysetup'

local plugins = require 'plugins'
local lazy = require 'lazy'

lazy.setup(plugins)

local ts = require 'nvim-treesitter.configs'
local lsp = require 'lspconfig'


ts.setup -- ensure_installed = 'all'
{ incremental_selection = { enable = true }
, highlight             = { enable = true }
, indent                = { enable = true }
}

g.markdown_fenced_languages = { 'ts=typescript' }

lsp.bashls.setup {}
lsp.zls.setup {}
lsp.clangd.setup {}
lsp.perlpls.setup {}
lsp.denols.setup {}
lsp.yamlls.setup {}
lsp.vls.setup {}
lsp.lua_ls.setup {}

g.zig_fmt_autosave = false

local onedark = require 'onedark'

onedark.setup { style = 'darker' }
onedark.load ()

-- vim.cmd(string.format('colorscheme %s', theme))

require 'keybinds'
