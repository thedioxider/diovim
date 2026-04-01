---@type LazySpec
return {
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.poimandres-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { "Old-Farmer/noctis-nvim", lazy = true },
  { "MartelleV/kaimandres.nvim", lazy = true },
  {
    "neanias/everforest-nvim",
    lazy = true,
    config = function()
      require("everforest").setup({
        background = "medium",
        ui_contrast = "high",
        float_style = "dim",
      })
    end,
  },
}
