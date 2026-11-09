return {
    {
        "folke/trouble.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {},

        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Workspace diagnostics",
            },

            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer diagnostics",
            },

            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Document symbols",
            },

            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP definitions and references",
            },
        },
    },
}
