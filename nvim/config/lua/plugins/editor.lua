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
  {
  "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  }
}
