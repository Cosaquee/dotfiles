require('gitblame').setup {
  enabled = false
}

require('legendary').keymaps({
  { '<Leader>l', ':GitBlameToggle<CR>', opts = { silent = true }, description = "Toggle Git Blame" },
})
