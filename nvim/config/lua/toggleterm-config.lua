require('toggleterm').setup()

local Terminal = require('toggleterm.terminal').Terminal
local float_term = Terminal:new({ direction = 'float', hidden = true })

local legendary = require('legendary')
legendary.keymaps({
  {
    '<C-Enter>',
    function()
      float_term:toggle()
    end,
    mode = { 'n', 't' },
    description = 'Toggle float terminal',
  },
  {
    '<C-S-Enter>',
    function()
      Terminal:new({ direction = 'horizontal' }):open()
    end,
    mode = { 'n', 't' },
    description = 'Create a new terminal',
  },
})

legendary.autocmds({
  { 'TermOpen', 'setlocal signcolumn=no statuscolumn=', opts = { pattern = 'term://*' } },
  { 'BufEnter', 'startinsert', opts = { pattern = 'term://*' } },
})
