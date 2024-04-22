return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Add dependencies for adapters for testing frameworks here
        "olimorris/neotest-phpunit",
    },

    config = function()
        require("neotest").setup({
            adapters = {
                -- Require the adapters here
                require("neotest-phpunit"),
            }
        })
    end,

    keys = {
        {
            "<leader>rt",
            "<cmd>require(\"neotest\").run.run()<cr>",
            desc = "run nearest test"
        },
    },
}
