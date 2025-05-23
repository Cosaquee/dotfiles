require'nvim-tree'.setup {
  view = {
    width = 30,
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

local keymap = vim.keymap
local uv = vim.uv
