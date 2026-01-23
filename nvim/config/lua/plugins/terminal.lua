return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-Enter>", desc = "Toggle float terminal" },
      { "<C-S-Enter>", desc = "Create horizontal terminal" },
    },
    config = function()
      require("toggleterm").setup()

      local Terminal = require("toggleterm.terminal").Terminal
      local float_term = Terminal:new({ direction = "float", hidden = true })

      vim.keymap.set({ "n", "t" }, "<C-Enter>", function()
        if float_term then
          float_term:toggle()
        else
          vim.notify("float_term is not defined", vim.log.levels.ERROR)
        end
      end, { desc = "Toggle float terminal" })

      vim.keymap.set({ "n", "t" }, "<C-S-Enter>", function()
        Terminal:new({ direction = "horizontal" }):open()
      end, { desc = "Create a new terminal" })

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          vim.opt_local.signcolumn = "no"
          vim.opt_local.statuscolumn = ""
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "term://*",
        callback = function()
          vim.cmd("startinsert")
        end,
      })
    end,
  },

  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle" },
  },

  {
    "mikavilpas/yazi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>-", "<cmd>Yazi<cr>", desc = "Toggle Yazi" },
    },
    config = function()
      require("yazi").setup({})
    end,
  },
}
