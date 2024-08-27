require("sort").setup({})

local keymap = vim.keymap

-- Map 'go' to execute the ':Sort' command
keymap.set('n', 'go', ':Sort<CR>', {
  noremap = true,
  silent = true,
  desc = 'Sort lines in the current buffer',
})
