local utils = require('utils')

-- split resize
utils.nnoremap("<leader>-", "<cmd>vertical resize -10<CR>")
utils.nnoremap("<leader>+", "<cmd>vertical resize +10<CR>")
utils.nnoremap("<leader>_", "<cmd>resize -10<CR>")
utils.nnoremap("<leader>*", "<cmd>resize +10<CR>")

-- split navigation
utils.map("", "<C-h>", "<C-w>h")
utils.map("", "<C-j>", "<C-w>j")
utils.map("", "<C-k>", "<C-w>k")
utils.map("", "<C-l>", "<C-w>l")

-- run command in current line and paste stout into current buffer
utils.nnoremap("Q", "!!$SHELL<CR>")

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

-- nvim-commenter
utils.vnoremap("<leader>x", "<cmd>MultiCommenterToggle<cr>")
utils.nnoremap("<leader>x", "<cmd>SingleCommenterToggle<cr>")
--vim.api.nvim_set_keymap('t', '\'<C-R>', '<C-\\><C-N>"\'.nr2char(getchar()).\'pi\'', {expr = true})

-- terminal mappings
utils.tnoremap("<Esc>", "<C-\\><C-n>")
utils.nnoremap("<leader>t", "<cmd>sp | term<cr>")

-- termdebugger
utils.nnoremap("<leader>dd", ":TermdebugCommand")

-- smart cwd
utils.nnoremap("cf", "<cmd>cd %:p:h | pwd<cr>")
require("project_root")
utils.nnoremap("cr", "<cmd>lua find_project_root()<cr>")

-- tab for completion menu
utils.inoremap("<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
utils.inoremap("<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
