return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },

        config = function()
            local cmp = require("cmp")

            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noselect",
            }

            cmp.setup({
                -- Use Neovim's built-in snippet support
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },

                -- Completion keybindings
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<CR>"] = cmp.mapping.confirm({
                        select = false,
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                -- Completion sources
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            })
        end,
    },
}
