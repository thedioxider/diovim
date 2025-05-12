return {
  { "cseelus/vim-colors-lucid" },
  { "xfyuan/nightforest.nvim" },
  { "mathofprimes/nightvision-nvim" },
  { "everviolet/nvim" },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_better_performance = true
      vim.g.everforest_background = 'hard'
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "evergarden-spring",
    },
  }
}
