return {
    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pyright",
                "ts_ls",
            },

            automatic_enable = true,
        },

        config = function(_, opts)
            -- Configure Lua's language server
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- LSP keybindings
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map_opts = { buffer = event.buf, silent = true }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)
                end,
            })

            require("mason-lspconfig").setup(opts)
        end,
    },
}
