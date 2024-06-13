return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Add dependencies for adapters for testing frameworks here
        "olimorris/neotest-phpunit",
        "rcasia/neotest-java",
    },

    config = function()
        require("neotest").setup({
            adapters = {
                -- Require the adapters here
                require("neotest-phpunit"),
                require("neotest-java"),
            }
        })

        require("neotest-plenary")
        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua", },
        })
    end,

    keys = {
        {
            "<leader>tr",
            "<cmd>require(\"neotest\").run.run()<cr>",
            desc = "run nearest test"
        },
    },
}
