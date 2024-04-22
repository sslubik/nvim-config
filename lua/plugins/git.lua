return {
    {
        "tpope/vim-fugitive"
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.cmd("Gitsigns toggle_current_line_blame")
        end,
        keys = {
            {
                "<leader>gc",
                "<cmd>Gitsigns preview_hunk<cr>",
                desc = "show local git changes"
            },
        }
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
}
