-- Telescope Settings
local keymap = vim.keymap
local uv = vim.uv

keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {
  silent = true,
  desc = "find files",
})

keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {
  silent = true,
  desc = "live grep",
})

keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {
  silent = true,
  desc = "buffers",
})

keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {
  silent = true,
  desc = "help tags",
})
