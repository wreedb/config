local treesitter = require "nvim-treesitter"
local cache = os.getenv "XDG_CACHE_HOME" or os.getenv "HOME" .. "/cache"

treesitter.setup { install_dir = cache .. "/nvim/treesitter" };

vim.api.nvim_create_autocmd('User', {
    pattern = "TSUpdate",
    callback = function()
        require "nvim-treesitter.parsers".god = {
            install_info = {
                url = "https://github.com/wreedb/tree-sitter-god",
                revision = "3ec1cd11a5acb6053bedf9ff876be838a06f3b86",
                branch = "main",
                queries = "queries"
            }
        }
    end
})
