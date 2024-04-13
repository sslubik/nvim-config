return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup{
      auto_install = true,
      hihglight = { enable = true },
      indent = { enable = true },
    }
  end,
}
