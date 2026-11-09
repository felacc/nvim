return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",

        opts = {
            delay = 500,

            spec = {
                { "<leader>f", group = "Find / Format" },
                { "<leader>h", group = "Git hunks" },
                { "<leader>x", group = "Diagnostics" },
            },
        },
    },
}
