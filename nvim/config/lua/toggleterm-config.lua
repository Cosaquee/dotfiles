require('toggleterm').setup()

require('legendary').keymaps({
        { '<leader>o', ':ToggleTerm direction=float<CR>', opts = { silent = true }, description = "Toggle Terminal" },
})
