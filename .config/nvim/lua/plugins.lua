-- vim:ft=lua

local set = vim.opt

local plugins =
--  { themes }
{   { 'rose-pine/neovim',      name = 'rose-pine'  }
,   { 'morhetz/gruvbox',       name = 'gruvbox'    }
,   { 'sainnhe/everforest',    name = 'everforest' }
,   { 'mofiqul/dracula.nvim',  name = 'dracula'    }
,   { 'navarasu/onedark.nvim', name = 'onedark'    }

--  { functionality }
,   { 'nvim-lua/plenary.nvim',       name = 'plenary'      }
,   { 'b0o/mapx.nvim',               name = 'mapx'         }
,   { 'nvim-tree/nvim-web-devicons', name = 'web-devicons' }
,   { 'windwp/windline.nvim',        name = 'windline'     }

,   { 'nvim-tree/nvim-tree.lua'
    , name = 'nvim-tree'
    , init = function() require 'nvim-tree'.setup() end }

,   { 'lewis6991/gitsigns.nvim'
    , name = 'gitsigns'
    , init = function() require 'gitsigns'.setup() end }

,   { 'norcalli/nvim-colorizer.lua'
    , name = 'colorizer'
    , init = function() require 'colorizer'.setup() end }

,   { 'windwp/nvim-autopairs'
    , name = 'autopairs'
    , event = 'InsertEnter'
    , opts = { } }

,   { 'glepnir/dashboard-nvim'
    , name = 'dashboard'
    , init = function() require 'dashboard'.setup() end }

,   { 'neovim/nvim-lspconfig', name = 'lspconfig' }
,   { 'ms-jpq/chadtree', name = 'chadtree' }

,   { 'nvim-treesitter/nvim-treesitter'
    , name = 'treesitter'
    , init = function()
        require 'nvim-treesitter.configs'.setup
        { incremental_selection = { enable = true }
        , highlight             = { enable = true }
        , indent                = { enable = true } } end }

,   { 'akinsho/bufferline.nvim'
    , name = 'bufferline'
    , version = "*"
    , dependencies = 'nvim-tree/nvim-web-devicons'
    , init = function() require 'bufferline'.setup() end }

,   { 'folke/which-key.nvim'
    , name = 'which-key'
    , event = 'VeryLazy'
    , init = function() set.timeout = true; set.timeoutlen = 300; end }

,   { 'nvim-telescope/telescope.nvim'
    , name = 'telescope'
    , config = function() require 'telescope'.setup( { pickers = { find_files = { hidden = true } } } ) end }

--  { code completion }
,   { 'ms-jpq/coq_nvim',       name = 'coq',            branch = 'coq'       }
,   { 'ms-jpq/coq.artifacts',  name = 'coq-artifacts',  branch = 'artifacts' }
,   { 'ms-jpq/coq.thirdparty', name = 'coq-thirdparty', branch = '3p'        }

--  { language support }
,   { 'ziglang/zig.vim',          name = 'zig'  }
,   { 'noahtheduke/vim-just',     name = 'just' }
,   { 'elkowar/yuck.vim',         name = 'yuck' }
,   { 'ollykel/v-vim',            name = 'v'    }
,   { 'alaviss/nim.nvim',         name = 'nim'  }
,   { 'khaveesh/vim-fish-syntax', name = 'fish' }
}

return plugins
