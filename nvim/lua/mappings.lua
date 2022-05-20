local utils = require('utils')

-- split resize
utils.nnoremap("<leader>-", "<cmd>vertical resize -10<CR>")
utils.nnoremap("<leader>+", "<cmd>vertical resize +10<CR>")
utils.nnoremap("<leader>_", "<cmd>resize -10<CR>")
utils.nnoremap("<leader>*", "<cmd>resize +10<CR>")

-- split navigation
utils.nnoremap("<C-h>", "<C-w>h")
utils.nnoremap("<C-j>", "<C-w>j")
utils.nnoremap("<C-k>", "<C-w>k")
utils.nnoremap("<C-l>", "<C-w>l")

-- move lines up and down in visual mode
utils.xnoremap("K", ":move '<-2<CR>gv-gv")
utils.xnoremap("J", ":move '>+1<CR>gv-gv")

-- useful bindings
utils.inoremap("kj", "<Esc>")
utils.noremap("", "<Space>", ":")
utils.nnoremap("<leader>ev", "<cmd>vs $MYVIMRC<CR>")
utils.nnoremap("<leader>sv", "<cmd>source $MYVIMRC<CR>")

-- substitute shortcut
utils.nnoremap("<leader>s", ":%s//g<Left><Left>")
utils.vnoremap("<leader>s", ":s//g<Left><Left>")

-- quickfix navigation
utils.nnoremap("<leader>q", "<cmd>cnext<cr>")
utils.nnoremap("<leader>Q", "<cmd>cprev<cr>")

-- spellcheck
utils.nnoremap("<leader>sp", ":setlocal spell spelllang=de")

-- dont use arrow keys you filthy casual
utils.nnoremap("<Up>", "<NOP>")
utils.nnoremap("<Down>", "<NOP>")
utils.nnoremap("<Left>", "<NOP>")
utils.nnoremap("<Right>", "<NOP>")
utils.inoremap("<Up>", "<NOP>")
utils.inoremap("<Down>", "<NOP>")
utils.inoremap("<Left>", "<NOP>")
utils.inoremap("<Right>", "<NOP>")
utils.vnoremap("<Up>", "<NOP>")
utils.vnoremap("<Down>", "<NOP>")
utils.vnoremap("<Left>", "<NOP>")
utils.vnoremap("<Right>", "<NOP>")
utils.nnoremap("H", "^")
utils.nnoremap("L", "$")

-- write to ----READONLY---- files
utils.cnoremap("w!!",  "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- terminal mappings
utils.tnoremap("<Esc>", "<C-\\><C-n>")
utils.nnoremap("<leader>t", "<cmd>sp | term<cr>")

-- smart cwd
utils.nnoremap("cf", "<cmd>cd %:p:h | pwd<cr>")
require("project_root")
utils.nnoremap("cr", "<cmd>lua find_project_root()<cr>")

-- part of switch to native keymap function
local opts = { noremap = true, silent = true }

-- better shift
vim.keymap.set('v', ">", ">gv", opts)
vim.keymap.set('v', "<", "<gv", opts)
