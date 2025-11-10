local wk = require "which-key"
local kbd = wk.add

require "telescope"
require "source.keymap"

kbd { leader "t", cmdx "Twilight", desc = "twilight: toggle" }

kbd { "<C-Up>",    ":resize -2<CR>" }
kbd { "<C-Down>",  ":resize +2<CR>" }
kbd { "<C-Left>",  ":vertical resize -2<CR>" }
kbd { "<C-Right>", ":vertical resize +2<CR>" }

kbd { "J", ":m '>+1<CR>gv=gv", mode = "v" }
kbd { "K", ":m '<-2<CR>gv=gv", mode = "v" }
kbd { "<", "<gv", mode = "v" }
kbd { ">", ">gv", mode = "v" }

kbd { "<TAB>",   ":bnext<CR>",     desc = "buffer: next" }
kbd { "<S-TAB>", ":bprevious<CR>", desc = "buffer: prev" }

kbd { leader "bk", ":bdelete<CR>", desc = "buffer: kill" }

kbd { leader "f", group = "telescope" }
kbd { leader "ff", cmdx "Telescope find_files",   desc = "tele: find files" }
kbd { leader "fr", cmdx "Telescope frecency",     desc = "tele: recent" }
kbd { leader "ft", cmdx "Telescope colorscheme",  desc = "tele: themes" }

kbd { leader "s", ":%s/", desc = "search/replace" }

kbd { leader "<Tab>", mode = "nv", desc = "comment" }

-- kbd { leader "<Tab><Tab>", "<CMD>gc<CR>", mode = "v", desc = "comment: visual region" }
--
-- vim.keymap.set("v", "<leader>/", ":<C-u>normal! gv<CR>gc", { noremap = true, desc = "comment: visual region" })
--
vim.keymap.set({"n", "v"}, leader "<Tab><Tab>", "gc", { remap = true, desc = 'comment: visual region' })
