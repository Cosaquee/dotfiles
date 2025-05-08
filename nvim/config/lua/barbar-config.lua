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

keymap.set("n", "<leader>bd", "<cmd>BufferClose<cr>", {
  silent = true,
  desc = "Close buffer",
})

keymap.set("n", "<leader>bp", "<cmd>BufferPin<cr>", {
  silent = true,
  desc = "Pin buffer",
})

keymap.set("n", "<leader>bl", "<cmd>BufferCloseAllButCurrentOrPinned<cr>", {
  silent = true,
  desc = "Close all but current or pinned buffer",
})
