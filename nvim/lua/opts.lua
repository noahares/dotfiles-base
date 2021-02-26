local g = vim.g
local o = vim.o
local utils = require('utils')

g.mapleader = ','
g.tex_flavor = "latex"

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
-- faster macros
utils.opt('o', 'lazyredraw', true)
-- matching parenthesis
utils.opt('o', 'showmatch', true)
-- switch buffer without saving them
utils.opt('o', 'hidden', true)
-- better searching
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'hlsearch', false)

-- show lines bellow cursor
utils.opt('o', 'scrolloff', 5)
utils.opt('o', 'sidescrolloff', 5)

-- tab config
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', 2)
utils.opt('b', 'tabstop', 2)
utils.opt('b', 'softtabstop', 2)

-- split in reasonable positions
utils.opt('o', 'splitright', true)
utils.opt('o', 'splitbelow', true)

--folds
utils.opt('w', 'foldmethod', 'expr')
utils.opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')
utils.opt('o', 'foldlevelstart', 99)

o.formatoptions = o.formatoptions:gsub("r", ""):gsub("o", "")
