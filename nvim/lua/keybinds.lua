-- ~/.config/nvim/lua/config/keybinds
-- keybind definitions

local wk = require "which-key"
wk.add {

	{ "<leader>s", ":%s/", desc = "search/replace" },
	{ "<leader><tab>", group = "TAB" },

	{ -- { TAB+N: new tab }
		"<leader><tab>n",
		":tabnew<Cr>",
		desc = "TAB: new"
	},

	{
		"<leader><tab><Right>",
		":tabnext<Cr>",
		desc = "TAB: next"
	},

	{ "<leader><tab><Left>", ":tabprev<Cr>", desc = "TAB: prev" },

    { "<leader>-", ":Oil<cr>", desc = "FILEMANAGER: parent directory" }

}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("v", "<", "<gv")
map("v", ">", ">gv")











