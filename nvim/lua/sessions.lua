local map = vim.keymap.set
local session_dir = vim.fn.stdpath('data') .. '/sessions/'

map('n', '<leader>ss', ':mks! ' .. session_dir)
map('n', '<leader>sr', ':%bd | so ' .. session_dir)
