return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-dap.nvim',
        },

        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
        end,
    },

    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    },
                },
                require("telescope").load_extension("ui-select"),
            })
            require("telescope").load_extension("dap")
        end,
    },
}
