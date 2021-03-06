-- Install packer (did not have that, so I shamelessly copied it)
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- mapping and settings helpers
local utils = {}

function utils.map(type, key, value, opts) -- the other functions are just for more vim-feel usage
  local options = opts or {}
  vim.api.nvim_set_keymap(type, key, value, options)
end
function utils.noremap(type, key, value, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(type,key,value, options)
end
function utils.nnoremap(key, value, opts)
  utils.noremap('n', key, value, opts)
end
function utils.inoremap(key, value, opts)
  utils.noremap('i', key, value, opts)
end
function utils.vnoremap(key, value, opts)
  utils.noremap('v', key, value, opts)
end
function utils.xnoremap(key, value, opts)
  utils.noremap('x', key, value, opts)
end
function utils.tnoremap(key, value, opts)
  utils.noremap('t', key, value, opts)
end
function utils.cnoremap(key, value, opts)
  utils.noremap('c', key, value, opts)
end
function utils.nmap(key, value, opts)
  utils.map('n', key, value, opts)
end
function utils.imap(key, value, opts)
  utils.map('i', key, value, opts)
end
function utils.vmap(key, value, opts)
  utils.map('v', key, value, opts)
end
function utils.tmap(key, value, opts)
  utils.map('t', key, value, opts)
end

P = function(stuff) return print(vim.inspect(stuff)) end

-- SET OPTS --> EG --> opt('b', 'expandtab', true)
local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}
function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- ===== real config starts here =====
local g = vim.g
local o = vim.o

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

-- ===== plugins =====
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-fugitive'}
  use {'dylanaraps/wal.vim'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-lua/completion-nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'~/repos/nvim-commenter'}
  use {'nvim-telescope/telescope-bibtex.nvim', config = [[require"telescope".load_extension("bibtex")]], ft = 'tex'}
end)
-- update plugins
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

-- ===== colorsheme settings =====
vim.cmd('syntax on')
vim.o.termguicolors = true
vim.g.gruvbox_contrast_dark="hard"
vim.cmd("colorscheme gruvbox")

-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])
-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.cmd([[autocmd BufWritePost *xresources !xrdb %]])
-- Update binds when sxhkdrc is updated.
vim.cmd([[autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd]])

-- ===== mappings =====
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
-- quote quickly
utils.inoremap('<leader>"', '<Esc>viw<Esc>a"<Esc>bi"<Esc>leli')
utils.vnoremap('<leader>"', '<Esc>`<i"<Esc>`>ea"<Esc>')
-- substitute shortcut
utils.nnoremap("S", ":%s//g<Left><Left>")
utils.vnoremap("S", ":s//g<Left><Left>")
-- quickfix navigation
utils.nnoremap("<leader>q", "<cmd>cnext<cr>")
utils.nnoremap("<leader>Q", "<cmd>cprev<cr>")
-- spellcheck
utils.nnoremap("<leader>sp", ":setlocal spell spelllang=de")
-- more reachable line start/end
utils.nnoremap("H", "^")
utils.nnoremap("L", "$")
-- write to ----READONLY---- files
utils.cnoremap("w!!",  "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")
-- nvim-commenter
utils.vnoremap("<leader>x", "<cmd>MultiCommenterToggle<cr>")
utils.nnoremap("<leader>x", "<cmd>SingleCommenterToggle<cr>")
-- terminal mappings
utils.tnoremap("<Esc>", "<C-\\><C-n>")
utils.nnoremap("<leader>t", "<cmd>sp | term<cr>")
-- termdebugger
utils.nnoremap("<leader>dd", ":TermdebugCommand")

-- ===== find project root for quick cd =====
local api = vim.api
function find_project_root()
  local id = [[.git]]
  local file = api.nvim_buf_get_name(0)
  local root = vim.fn.finddir(id, file .. ';')
  if root ~= "" then
    root = root:gsub(id, '')
    print(root)
    vim.api.nvim_set_current_dir(root)
  else
    print("No repo found.")
  end
end
-- smart cwd
utils.nnoremap("cf", "<cmd>cd %:p:h | pwd<cr>")
utils.nnoremap("cr", "<cmd>lua find_project_root()<cr>")
-- tab for completion menu
utils.inoremap("<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
utils.inoremap("<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

-- ===== statusline =====
local stl = {' %M', ' %y', ' %r', ' %{pathshorten(expand("%:p"))}', ' %{FugitiveStatusline()}',
  '%=', ' %c:%l/%L'
}
vim.o.statusline = table.concat(stl)

-- ===== telescope setup =====
require('telescope').setup{
  --defaults excluded to reduce lines :P
}
utils.nnoremap('<leader>b', '<cmd>Telescope buffers<cr>')
utils.nnoremap('<leader>o', '<cmd>Telescope find_files<cr>')
utils.nnoremap('<leader>h', '<cmd>Telescope oldfiles<cr>')
utils.nnoremap('<leader>c', '<cmd>Telescope commands<cr>')
utils.nnoremap('<leader>ch', '<cmd>Telescope command_history<cr>')
utils.nnoremap('<leader>f', '<cmd>Telescope live_grep<cr>')
utils.nnoremap('<leader>z', '<cmd>Telescope spell_suggest<cr>')
utils.noremap('','<F1>', '<cmd>Telescope help_tags<cr>')

-- ===== simple session management =====
local session_dir = vim.fn.stdpath('data') .. '/sessions/'
utils.nnoremap('<leader>ss', ':mks! ' .. session_dir)
utils.nnoremap('<leader>sr', ':%bd | so ' .. session_dir)

-- ===== completion settings =====
vim.o.completeopt="menuone,noinsert,noselect"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_ignore_case = 1
vim.g.completion_trigger_keyword_length = 3

-- ===== snippets =====
vim.g.UltiSnipsExpandTrigger='<leader>s'
vim.g.UltiSnipsListSnippets='<c-l>'
vim.g.UltiSnipsJumpForwardTrigger='<c-b>'
vim.g.UltiSnipsJumpBackwardTrigger='<c-z>'
vim.g.UltiSnipsEditSplit='vertical'

-- ===== lsp setup =====
local custom_attach = function(client)
	print("LSP started.");
	require'completion'.on_attach(client)
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, update_in_insert = false }
  )
  -- automatic diagnostics popup
  vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
  -- speedup diagnostics popup
  vim.o.updatetime=1000
  utils.nnoremap('gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap('<c-]>','<cmd>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('K','<cmd>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('gr','<cmd>lua vim.lsp.buf.references()<CR>')
  utils.nnoremap('gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  utils.nnoremap('gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap('<F5>','<cmd>lua vim.lsp.buf.code_action()<CR>')
  utils.nnoremap('<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  utils.nnoremap('<leader>d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.nnoremap('<leader>D', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
end
-- setup all lsp servers here
local nvim_lsp = require'lspconfig'
nvim_lsp.clangd.setup{on_attach=custom_attach}
nvim_lsp.bashls.setup{on_attach=custom_attach}
nvim_lsp.texlab.setup{on_attach=custom_attach}
nvim_lsp.pyls.setup{on_attach=custom_attach}
nvim_lsp.tsserver.setup{on_attach=custom_attach}
nvim_lsp.sumneko_lua.setup{
  cmd = {'lua-language-server'},
  on_attach=custom_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = { vim.split(package.path, ';') },
      },
      completion = { keywordSnippet = "Disable", },
      diagnostics = {enable = true, globals = {"vim","describe","it","before_each","after_each"}
      },
      workspace = {
        library = { [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true},
        maxPreload = 1000,
        preloadFileSize = 1000,
      }
    }
  }
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "lua", "bash", "python", "typescript", "javascript"},
  highlight = { enable = true },
}
