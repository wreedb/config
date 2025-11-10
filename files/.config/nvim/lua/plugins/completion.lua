return {

    {
        url = github "rafamadriz/friendly-snippets",
        name = "friendly-snippets",
        enabled = true
    },

    {
        url = github "saghen/blink.cmp",
        name = "blink.cmp",
        tag = "v1.7.0",
        pin = true,
        enabled = true,
        opts = {

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono"
            },

            keymap = {
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<S-Tab>"] = {
                    function(cmp)
                        return cmp.select_next()
                    end,
                    "snippet_forward",
                    fallback
                },
                ["<C-Tab>"] = {
                    function(cmp)
                        return cmp.select_prev()
                    end,
                    "snippet_backward",
                    "fallback"
                },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-up>"] = { "scroll_documentation_up", "fallback" },
                ["<C-down>"] = { "scroll_documentation_down", "fallback" }
            },
            
            completion = {
                -- list = { selection = function(ctx) return ctx.mode == "cmdline" and "auto_insert" or "preselect" end },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 250,
                    treesitter_highlighting = true,
                    window = { border = "rounded" }
                },

                accept = { auto_brackets = { enabled = true } },

                menu = {
                    border = "rounded",
                    cmdline_position = function()
                        if vim.g.ui_cmdline_pos ~= nil then
                            local pos = vim.g.ui_cmdline_pos
                            return { pos[1] - 1, pos[2] }
                        end
                        local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                        return { vim.o.lines - height, 0 }
                    end,

                    draw = {
                    
                        columns = {
                            { "kind_icon", "label", gap = 1 },
                            { "kind" }
                        },

                        components = {
                            label = {
                                text = function(item)
                                    return item.label
                                end,
                                highlight = "CmpItemAbbr"
                            },
                            kind = {
                                text = function(item)
                                    return item.kind
                                end,
                                highlight = "CmpItemKind"
                            }
                        }

                    }
                }
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        min_keyword_length = 2, -- Number of characters to trigger porvider
                        score_offset = 0, -- Boost/penalize the score of the items
                    },
                    path = { min_keyword_length = 0 },
                    snippets = { min_keyword_length = 2 },
                    buffer = {
                        min_keyword_length = 5,
                        max_items = 5,
                    },
                },
            },
            

        }
    }
}
