-- vim:ft=lua:fileencoding=utf-8

local plugs =
{ { 'rose-pine/neovim', name = 'rose-pine' }
, { 'morhetz/gruvbox', name = 'gruvbox' }
, { 'mofiqul/dracula.nvim', name = 'dracula' }
, { 'b0o/mapx.nvim', name = 'mapx' }
, { 'windwp/windline.nvim', name = 'windline', config = function() require 'wlsample.evil_line' end }
, { 'lewis6991/gitsigns.nvim', name = 'gitsigns', config = function() require 'gitsigns'.setup() end }
, { 'nvim-tree/nvim-web-devicons', name = 'devicons' }
, { 'norcalli/nvim-colorizer.lua', name = 'colorizer', config = function() require 'colorizer'.setup() end }
, { 'startup-nvim/startup.nvim', name = 'startup', config = function() require 'startup'.setup() end }
, { 'windwp/nvim-autopairs', name = 'autopairs', event = 'InsertEnter', opts = {} }
, { 'nvim-treesitter/nvim-treesitter', name = 'treesitter' }
, { 'voldikss/vim-floaterm', name = 'floaterm' }
, { 'nvim-lua/plenary.nvim', name = 'plenary' }
, { 'folke/which-key.nvim', name = 'which-key', event = 'VeryLazy', opts = {}, init = function() vim.o.timeout = true; vim.o.timeoutlen = 300; end }
, { 'nvim-telescope/telescope.nvim', name = 'telescope', config = function() require 'telescope'.setup( { pickers = { find_files = { hidden = true } } } ) end }
, { 'neovim/nvim-lspconfig', name = 'lspconfig' }
, { 'neoclide/coc.nvim', name = 'coc' }
, { 'ms-jpq/chadtree', name = 'chadtree' }
, { 'ziglang/zig.vim', name = 'zig' }
, { 'noahtheduke/vim-just', name = 'just' }
, { 'elkowar/yuck.vim', name = 'yuck' }
, { 'ollykel/v-vim', name = 'v' }
, { 'waycrate/swhkd-vim', name = 'swhkd' }
}

return plugs
