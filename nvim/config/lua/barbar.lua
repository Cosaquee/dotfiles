require('barbar').setup {
  enable = true,
  options = {
    show_tab_indicators = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = "thin",
  }
}

require('legendary').keymaps({
  { '<Leader>]', ':GitBlameToggle<CR>', opts = { silent = true }, description = "Toggle Git Blame" },
})
