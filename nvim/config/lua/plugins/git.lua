return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({})
    end,
  },

  {
    "f-person/git-blame.nvim",
    keys = {
      { "<leader>l", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
    },
    cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameDisable" },
    config = function()
      require("gitblame").setup({
        enabled = false,
      })
    end,
  },

  {
    "jreybert/vimagit",
    cmd = "Magit",
  },
}
