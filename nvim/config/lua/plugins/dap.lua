return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
      { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
      { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step into" },
      { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step over" },
      { "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "Step out" },
      { "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", desc = "Open REPL" },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
    },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    event = "LspAttach",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
}
