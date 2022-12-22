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

opt.clipboard:append {'unnamedplus'}

-- vim.opt.list = true
-- vim.opt.listchars:append("multispace:⋅")
-- vim.opt.listchars:append("eol:↴")

opt.cmdheight = 0

g.neovide_cursor_animation_length=0
g.neovide_cursor_trail_length=0.2

vim.wo.signcolumn = "yes"
