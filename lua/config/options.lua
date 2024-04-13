-- Absolute/Relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tabs config
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Indent options
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- Enable the sign column by default
vim.opt.signcolumn = "yes"

-- Enable line cursor
vim.opt.cursorline = true

-- Enable visual column at 80th character position
vim.opt.colorcolumn = "80"

-- Enable access to system clipboard
-- (make sure to implement a proper clipboard for your OS)
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable 10 lines of buffer when cursor is near top/bottom edge of the window
vim.opt.scrolloff = 10

-- Enable winbar for each lanuched window
vim.g.winbar_exclude = { "neo-tree" }
vim.opt.winbar = "%f%m"

-- Enable hidden for keeping not discarding terminal windows
vim.g.hidden = true

