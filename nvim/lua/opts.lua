local g = vim.g
local o = vim.o
local b = vim.bo
local w = vim.wo

g.mapleader = ','

w.number = true
w.relativenumber = true
-- faster macros
o.lazyredraw = true
-- matching parenthesis
o.showmatch = true
-- switch buffer without saving them
o.hidden = true
-- better searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- show lines bellow cursor
o.scrolloff = 5
o.sidescrolloff = 5

-- tab config
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

-- split in reasonable positions
o.splitright = true
o.splitbelow = true

--folds
w.foldmethod = 'expr'
w.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevelstart = 99

o.formatoptions = o.formatoptions:gsub("r", ""):gsub("o", "")
