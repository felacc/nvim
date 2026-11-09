return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "bash",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
            },

            auto_install = true,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        },

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
