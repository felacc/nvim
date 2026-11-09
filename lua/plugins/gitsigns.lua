return {
    {
        "lewis6991/gitsigns.nvim",

        opts = {
            current_line_blame = false,
        },

        keys = {
            {
                "<leader>hs",
                function()
                    require("gitsigns").stage_hunk()
                end,
                desc = "Stage hunk",
            },

            {
                "<leader>hr",
                function()
                    require("gitsigns").reset_hunk()
                end,
                desc = "Reset hunk",
            },

            {
                "<leader>hp",
                function()
                    require("gitsigns").preview_hunk()
                end,
                desc = "Preview hunk",
            },

            {
                "<leader>hb",
                function()
                    require("gitsigns").blame_line()
                end,
                desc = "Blame current line",
            },

            {
                "<leader>hd",
                function()
                    require("gitsigns").diffthis()
                end,
                desc = "Diff current file",
            },
        },
    },
}
