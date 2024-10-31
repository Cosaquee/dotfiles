local opt = vim.opt
local g = vim.g

-- global options --
opt.incsearch = true    -- Find the next match as we type the search
opt.hlsearch = true     -- Hilight searches by default
opt.viminfo = "'100,f1" -- Save up to 100 marks, enable capital marks
opt.ignorecase = true   -- Ignore case when searching...
opt.smartcase = true    -- ...unless we type a capital
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.relativenumber = false
opt.number = true
opt.signcolumn="yes:2"

-- Set leader key
g.mapleader = ' '

-- Color Scheme Settings
vim.cmd("syntax enable")
opt.background="dark"
g.nord_italic = false

vim.cmd[[colorscheme tokyonight-storm]]

opt.clipboard = "unnamedplus"
