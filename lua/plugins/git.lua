return {
    {
        "tpope/vim-fugitive"
    },

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.cmd("Gitsigns toggle_current_line_blame")

			vim.keymap.set("n", "<leader>gc", ":Gitsigns preview_hunk<CR>")
		end,
	},
}
