local g = vim.g
local opt = vim.opt

g.mapleader = ','
g.tex_flavor = "latex"

opt.switchbuf = "usetab"

opt.number = true
opt.relativenumber = true
-- faster macros
opt.lazyredraw = true
-- matching parenthesis
opt.showmatch = true
-- switch buffer without saving them
opt.hidden = true
-- better searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

--Save undo history
vim.opt.undofile = true

-- show lines bellow cursor
opt.scrolloff = 5
opt.sidescrolloff = 5

-- tab config
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- split in reasonable positions
opt.splitright = true
opt.splitbelow = true

--folds
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99

opt.formatoptions:remove {'r', 'o'}

opt.clipboard:append {'unnamedplus'}
