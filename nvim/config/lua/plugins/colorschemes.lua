return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
  },
  { "folke/tokyonight.nvim", lazy = true },
  { "rafamadriz/neon", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
}
