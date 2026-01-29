return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
      { "<leader>nr", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh NvimTree" },
      { "<leader>nf", "<cmd>NvimTreeFocus<cr>", desc = "Focus NvimTree" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh" },
    config = function()
      require("nvim-tree").setup({
        view = {
          preserve_window_proportions = false,
          width = function()
            return math.floor(vim.o.columns * 0.20)
          end,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
        },
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle Trouble diagnostics" },
    },
    cmd = "Trouble",
    config = function()
      require("trouble").setup({
        position = "bottom",
        icons = {},
        mode = "document_diagnostics",
        fold_open = "",
        fold_closed = "",
        group = true,
        padding = true,
        action_keys = {
          close = "q",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          toggle_mode = "m",
          toggle_preview = "P",
          hover = "H",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "l",
          next = "k",
        },
        indent_lines = true,
        auto_open = true,
        auto_close = true,
        auto_preview = true,
        auto_fold = false,
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠",
        },
        use_diagnostic_signs = true,
      })
    end,
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25,
          color = { "Normal", "#ffffff" },
        },
        context = 10,
        treesitter = true,
        expand = {
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {},
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  {
    'nanozuki/tabby.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    config = function()
      require('tabby').setup({
        preset = 'active_wins_at_tail',
        option = {
          nerdfont = true,
          lualine_theme = nil,
        },
      })
      -- Keymaps for tab management
      vim.keymap.set('n', '<leader>ta', ':$tabnew<CR>', { desc = 'New tab' })
      vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
      vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Close other tabs' })
      vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next tab' })
      vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Previous tab' })
      vim.keymap.set('n', '<leader>tmp', ':-tabmove<CR>', { desc = 'Move tab left' })
      vim.keymap.set('n', '<leader>tmn', ':+tabmove<CR>', { desc = 'Move tab right' })
    end,
  },
}
