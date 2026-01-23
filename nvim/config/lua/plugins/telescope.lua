return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Resume last search" },
    },
    cmd = "Telescope",
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dc", "<cmd>Telescope dap commands<cr>", desc = "DAP commands" },
      { "<leader>db", "<cmd>Telescope dap list_breakpoints<cr>", desc = "DAP breakpoints" },
    },
  },
}
