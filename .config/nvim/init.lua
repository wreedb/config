require "rocks"

local cmd = vim.cmd
local ft  = vim.filetype
local g   = vim.g

require "options"
require "keybinds"

ft.add { pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }

g.everforest_background = "hard"
g.everforest_better_performance = 1

cmd "colorscheme rose-pine"

local autocmd = vim.api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("config.autocmds", { clear = true })

autocmd("VimEnter", {
    command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
    command = ":silent !kitty @ set-spacing padding=8 margin=0",
})
