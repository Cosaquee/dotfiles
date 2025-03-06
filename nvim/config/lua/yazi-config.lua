require('yazi').setup({})

local keymap = vim.keymap
local uv = vim.uv

keymap.set("n", "<leader>-", "<cmd>Yazi<cr>", {
  silent = true,
  desc = "Yazi: Toggle",
})
