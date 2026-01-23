return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        auto_install = true,
        ensure_installed = {
          "bash",
          "lua",
          "python",
          "javascript",
          "typescript",
          "json",
          "yaml",
          "html",
          "css",
          "markdown",
          "nix",
          "terraform",
          "hcl",
          "vim",
          "vimdoc",
        },
      })
    end,
  },

  {
    "RRethy/nvim-treesitter-textsubjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textsubjects = {
          enable = true,
          prev_selection = ",",
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = { "textsubjects-container-inner", desc = "Select inside containers" },
          },
        },
      })
    end,
  },
}
