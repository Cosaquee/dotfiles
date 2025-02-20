require('barbar').setup {
}

local keymap = vim.keymap

keymap.set("n", "<leader>[", "<cmd>BufferPrevious<cr>", {
  silent = true,
  desc = "Switch to previous buffer",
})

keymap.set("n", "<leader>]", "<cmd>BufferNext<cr>", {
  silent = true,
  desc = "Switch to next buffer",
})
