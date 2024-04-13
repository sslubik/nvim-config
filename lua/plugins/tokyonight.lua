return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("tokyonight").setup()
    vim.cmd.colorscheme "tokyonight-night"

    -- Change colorline color
    vim.cmd('highlight ColorColumn ctermbg=none ctermfg=none guibg=#37394e')
  end,

  opts = {}
}
