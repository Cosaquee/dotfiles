require('neoscroll').setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {
    '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = false, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window is not focused
})
