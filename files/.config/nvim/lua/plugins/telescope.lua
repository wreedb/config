return {
    {
        url = github "nvim-telescope/telescope.nvim",
        name = "telescope",
        enabled = true,
        lazy = false,
        config = function()
            local tele = require "telescope"
            local prev = require "telescope.previewers"
            tele.setup {
                defaults = {
                    file_previewer = prev.vim_buffer_cat.new,
                    grep_previewer = prev.vim_buffer_cat.new,
                    qflist_previewer = prev.vim_buffer_cat.new,
                },
                pickers = {
                    find_files = { previewer = prev.vim_buffer_cat.new }
                }
            }
        end
    },

    {
        url = github "nvim-telescope/telescope-file-browser.nvim",
        name = "telescope-file-browser",
        enabled = true,
        lazy = false
    },

    {
        url = github "nvim-telescope/telescope-frecency.nvim",
        name = "telescope-frecency",
        enabled = true,
        lazy = false,
        config = function()
            require "telescope".load_extension "frecency"
        end
    }

};
