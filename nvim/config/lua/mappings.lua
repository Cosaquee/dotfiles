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

-- Project switching
local function switch_project(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.notify("Not found: " .. path, vim.log.levels.ERROR)
    return
  end
  vim.cmd.cd(path)
  local ok, tree_api = pcall(require, "nvim-tree.api")
  if ok then tree_api.tree.change_root(path) end
  vim.notify("→ " .. vim.fn.fnamemodify(path, ":t"))
end

keymap.set("n", "<leader>ph", function() switch_project("/Volumes/Code/helios") end,   { desc = "Project: helios" })
keymap.set("n", "<leader>pi", function() switch_project("/Volumes/Code/infraops") end, { desc = "Project: infraops" })
keymap.set("n", "<leader>pg", function() switch_project("/Volumes/Code/gitops") end,   { desc = "Project: gitops" })

-- Open journal at today's entry
keymap.set("n", "<leader>j", function()
  local path = vim.fn.expand("~/journal/journal-raw.md")
  vim.cmd("edit " .. path)
  local today = "# " .. os.date("%Y-%m-%d, %A")
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
  if first_line ~= today then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { today, "", "", "" })
  end
  vim.api.nvim_win_set_cursor(0, { 3, 0 })
  vim.cmd("startinsert")
end, { desc = "Open journal at today" })
