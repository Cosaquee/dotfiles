require'nvim-tree'.setup {
  view = {
    preserve_window_proportions = false,
    width = function()
      return math.floor(vim.o.columns * 0.20)
    end,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
  },
}
