return {
  { "tpope/vim-sensible", lazy = false },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "sQVe/sort.nvim",
    keys = {
      { "go", "<cmd>Sort<cr>", desc = "Sort lines" },
    },
    cmd = "Sort",
    config = function()
      require("sort").setup({})
    end,
  },

  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    config = function()
      require("cinnamon").setup({
        keymaps = {
          basic = true,
          extra = true,
        },
        options = { mode = "window" },
      })
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup({
        mappings = {
          "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>",
          "zt", "zz", "zb",
        },
        hide_cursor = false,
        stop_eof = true,
        respect_scrolloff = true,
        cursor_scrolls_alone = true,
      })
    end,
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  { "LnL7/vim-nix", ft = "nix" },
}
