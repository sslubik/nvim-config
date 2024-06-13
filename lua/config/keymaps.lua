vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader><leader>", ":noh<CR>", { desc = "undo search highlight" })

vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "vertical split" })
