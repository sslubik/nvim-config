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
                "<leader>gc", "<cmd>Gitsigns preview_hunk<cr>", desc = "show hunk"
            },
            {
                "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset hunk"
            },
            {
                "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "stage hunk"
            },
            {
                "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "stage hunk"
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
            {
                "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit"
            },
        }
    },
}
