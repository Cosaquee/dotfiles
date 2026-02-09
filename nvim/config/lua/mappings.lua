local keymap = vim.keymap
local uv = vim.uv

-- Save key strokes (now we do not need to press shift to enter command mode).
keymap.set({ "n", "x" }, ";", ":")

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
})

-- Go to start or end of line easier
keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")

-- Edit and reload nvim config file quickly
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})

keymap.set("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "reload init.lua",
})

-- Tab management
keymap.set("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true })
keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true })
keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- Buffer navigation
keymap.set("n", "<leader>[", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
keymap.set("n", "<leader>]", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
