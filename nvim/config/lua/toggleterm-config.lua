require('toggleterm').setup()

local Terminal = require('toggleterm.terminal').Terminal
local float_term = Terminal:new({ direction = 'float', hidden = true })

local keymap = vim.keymap

-- Toggle float terminal
keymap.set({ 'n', 't' }, '<C-Enter>', function()
  if float_term then
    float_term:toggle()
  else
    -- Assuming `float_term` is defined somewhere in your config
    vim.notify("float_term is not defined", vim.log.levels.ERROR)
  end
end, {
  desc = 'Toggle float terminal',
})

-- Create a new horizontal terminal
keymap.set({ 'n', 't' }, '<C-S-Enter>', function()
  local Terminal = require('toggleterm.terminal').Terminal
  Terminal:new({ direction = 'horizontal' }):open()
end, {
  desc = 'Create a new terminal',
})

-- Set autocmds for terminal
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  callback = function()
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.statuscolumn = ''
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*',
  callback = function()
    vim.cmd('startinsert')
  end,
})
