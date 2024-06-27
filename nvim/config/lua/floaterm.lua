require('floaterm').setup()

require('legendary').keymaps({
  { '<Leader>o', ':FloatermNew --wintype=float<CR>', opts = { silent = true }, description = "Toggle Terminal" },
})
