require('gitblame').setup {
  enabled = false
}

local keymap = vim.keymap

-- Map '<Leader>l' to toggle Git Blame
keymap.set('n', '<Leader>l', ':GitBlameToggle<CR>', {
  silent = true,
  desc = 'Toggle Git Blame',
})

