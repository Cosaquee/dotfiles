require('gitblame').setup {
  enabled = false
}

require('legendary').keymaps({
  { '<Leader>g', ':GitBlameToggle<CR>', opts = { silent = true }, description = "Toggle Git Blame" },
})
