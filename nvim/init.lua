require "rocks"

local cmd = vim.cmd
local ft  = vim.filetype
local g   = vim.g

require "options"
require "keybinds"

ft.add { pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }
ft.add { pattern = { ["template"] = "bash" } }

-- g.everforest_background = "hard"
-- g.everforest_better_performance = 1
g.background = "dark"
-- g.gruvbox_italic = true
-- g.gruvbox_contrast_dark = "medium"


cmd "colorscheme onedark"
