local utils = require("utils")
local session_dir = vim.fn.stdpath('data') .. '/sessions/'

utils.nnoremap('<leader>ss', ':mks! ' .. session_dir)
utils.nnoremap('<leader>sr', ':%bd | so ' .. session_dir)
