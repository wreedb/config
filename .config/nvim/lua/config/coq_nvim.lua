vim.g.coq_settings = { auto_start = "shut-up" }

local coq = require "coq"
local lsp = require "lspconfig"
local coq_ensure = coq.lsp_ensure_capabilities

lsp.perlpls.setup(coq_ensure())
lsp.fish_lsp.setup(coq_ensure())
lsp.yamlls.setup(coq_ensure())
lsp.pyright.setup(coq_ensure())
-- lsp.marksman.setup(coq_ensure())
lsp.mesonlsp.setup(coq_ensure())
lsp.gopls.setup(coq_ensure())
lsp.eslint.setup(coq_ensure())
lsp.clangd.setup(coq_ensure())
lsp.jsonls.setup(coq_ensure())
lsp.cssls.setup(coq_ensure())
-- lsp.v_analyzer.setup(coq_ensure())

lsp.lua_ls.setup {
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } }
  }
}

lsp.lua_ls.setup(coq_ensure())

-- vim.cmd "COQnow"
