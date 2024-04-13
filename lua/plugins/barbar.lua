return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("barbar").setup({
			sidebar_filetypes = {
				["neo-tree"] = true,
				["nvim"] = true,
			},
			focus_on_close = "right",
		})

		vim.keymap.set("n", "<Tab>", ":BufferNext<CR>")
		vim.keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>")
		vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")
	end,
}
