return {
    {
        "stevearc/conform.nvim",

        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },

                c = { "clang_format" },
                cpp = { "clang_format" },

                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },

                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },

        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,
                desc = "Format buffer",
            },
        },
    },
}
