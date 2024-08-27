require('trouble').setup {
  auto_preview = true,
  auto_fold = true,
  use_lsp_diagnostic_signs = true,
}

local keymap = vim.keymap

-- Toggle Trouble
keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {
  silent = true,
  desc = 'Trouble: Toggle',
})

-- Toggle Trouble with LSP workspace diagnostics
keymap.set('n', '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', {
  silent = true,
  desc = 'Trouble: Toggle Workspace Diagnostics',
})

-- Toggle Trouble with LSP document diagnostics
keymap.set('n', '<leader>xd', '<cmd>TroubleToggle lsp_document_diagnostics<cr>', {
  silent = true,
  desc = 'Trouble: Toggle Document Diagnostics',
})

-- Toggle Trouble with location list
keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', {
  silent = true,
  desc = 'Trouble: Toggle Location List',
})

-- Toggle Trouble with quickfix list
keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', {
  silent = true,
  desc = 'Trouble: Toggle Quickfix',
})

-- Toggle Trouble with LSP references
keymap.set('n', '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', {
  silent = true,
  desc = 'Trouble: Toggle References',
})
