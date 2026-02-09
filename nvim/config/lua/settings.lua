local opt = vim.opt
local g = vim.g

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.scrolloff = 10
opt.wrap = false

opt.ignorecase = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

-- Set leader key (must be set before lazy.nvim loads)
g.mapleader = ' '
g.maplocalleader = ' '

opt.background = "dark"
opt.clipboard = "unnamedplus"

vim.diagnostic.config({
  virtual_text = true,  -- Disable inline virtual text
  signs = true,          -- Keep signs in the gutter
  underline = true,       -- Keep underline for errors
  update_in_insert = false,
  severity_sort = true,
  float = false,         -- Disable floating diagnostics
})

vim.opt.termguicolors = true
