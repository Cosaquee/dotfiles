require('barbar').setup {
  enable = true,
  options = {
    show_tab_indicators = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = "thin",
  }
}

local keymap = vim.keymap

-- Barbar keybindings for buffer navigation and management

-- Move to the next buffer
keymap.set('n', '<Leader>bn', ':BufferNext<CR>', {
  silent = false,
  desc = 'Go to the next buffer',
})

-- Move to the previous buffer
keymap.set('n', '<Leader>bf', ':BufferPrevious<CR>', {
  silent = false,
  desc = 'Go to the previous buffer',
})

-- Close the current buffer
keymap.set('n', '<Leader>bc', ':BufferClose<CR>', {
  silent = true,
  desc = 'Close the current buffer',
})

-- Move the current buffer to the left
keymap.set('n', '<Leader>bl', ':BufferMovePrevious<CR>', {
  silent = true,
  desc = 'Move the buffer to the left',
})

-- Move the current buffer to the right
keymap.set('n', '<Leader>br', ':BufferMoveNext<CR>', {
  silent = true,
  desc = 'Move the buffer to the right',
})

-- Go to buffer 1 to 9 directly
for i = 1, 9 do
  keymap.set('n', '<Leader>' .. i, ':BufferGoto ' .. i .. '<CR>', {
    silent = true,
    desc = 'Go to buffer ' .. i,
  })
end

-- Pick a buffer from the buffer list
keymap.set('n', '<Leader>bb', ':BufferPick<CR>', {
  silent = true,
  desc = 'Pick a buffer from the list',
})

