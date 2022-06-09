local map = vim.keymap.set

local opts = { silent = true }

-- split resize
map("n", "<leader>-", "<cmd>vertical resize -10<CR>", opts)
map("n", "<leader>+", "<cmd>vertical resize +10<CR>", opts)
map("n", "<leader>_", "<cmd>resize -10<CR>", opts)
map("n", "<leader>*", "<cmd>resize +10<CR>", opts)

-- split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- move lines up and down in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- useful bindings
map("i", "kj", "<Esc>", opts)
map("", "<Space>", ":")
map("n", "<leader>ev", "<cmd>vs $MYVIMRC<CR>", opts)
map("n", "<leader>sv", "<cmd>source $MYVIMRC<CR>")

-- substitute shortcut
map("n", "<leader>s", ":%s//g<Left><Left>")
map("v", "<leader>s", ":s//g<Left><Left>")

-- quickfix navigation
map("n", "<leader>q", "<cmd>cnext<cr>", opts)
map("n", "<leader>Q", "<cmd>cprev<cr>", opts)

-- spellcheck
map("n", "<leader>sp", ":setlocal spell spelllang=de")

-- dont use arrow keys you filthy casual
map({"n", "i", "v"}, "<Up>", "<NOP>", opts)
map({"n", "i", "v"}, "<Down>", "<NOP>", opts)
map({"n", "i", "v"}, "<Left>", "<NOP>", opts)
map({"n", "i", "v"}, "<Right>", "<NOP>", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- write to ----READONLY---- files
map("c", "w!!",  "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- terminal mappings
map("t", "<Esc>", "<C-\\><C-n>", opts)
-- map("n", "<leader>t", "<cmd>sp | term<cr>", opts)

-- smart cwd
map("n", "cf", "<cmd>cd %:p:h | pwd<cr>")
map("n", "cr", function() require("project_root").find_project_root() end)

-- better shift
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)
