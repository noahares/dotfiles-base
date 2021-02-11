let mapleader=","

" vim-plug {{{
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'norcalli/nvim-colorizer.lua'
Plug '~/repos/nvim-commenter'
Plug '~/repos/telescope-bibtex'
call plug#end()
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=1
augroup END
" }}}

" basic settings {{{

set termguicolors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" colorizer
lua require'colorizer'.setup()

augroup vimrcEx
  autocmd!
  " disable auto comment in newline
  autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  " remove trailing whitespaces
  autocmd BufWritePre * %s/\s\+$//e
  " remove trailing newline
  autocmd BufWritepre * %s/\n\+\%$//e
  " Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *xresources !xrdb %
  " Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END

augroup git
  autocmd!
  autocmd FileType gitcommit setlocal tw=72
augroup END

" relative line numbers
set number relativenumber
" faster macros
set lazyredraw
" matching parenthesis
set showmatch
" switch buffer without saving them
set hidden

" show lines bellow cursor
set scrolloff=5
set sidescrolloff=5

" tab config
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" search
set nohlsearch

" split in reasonable positions
set splitbelow splitright


" folds for most languages
augroup folds
  autocmd!
"  autocmd FileType java,c,cpp,h,bash,tex setlocal foldmethod=syntax
"  autocmd FileType java,c,cpp,h,bash,tex setlocal foldlevelstart=0
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set foldlevelstart=99
augroup END
" }}}

" general mappings {{{
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" run command in current line and paste stout into current buffer
noremap Q !!$SHELL<CR>

" move lines up and down in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" useful bindings
inoremap kj <Esc>
noremap <Space> :
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" word case toggle visual ~

" quote quickly
inoremap <leader>" <Esc>viw<Esc>a"<Esc>bi"<Esc>lela
vnoremap <leader>" <Esc>`<i"<Esc>`>ea"<Esc>

" substitute shortcut
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" quickfix navigation
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>

" spellcheck
noremap <leader>sp :setlocal spell spelllang=de

" }}}

" dont use arrow keys you filthy casual {{{
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
nnoremap H ^
nnoremap L $
" }}}

" status line {{{
" left side
set statusline=
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %{pathshorten(expand('%:p'))}
set statusline+=\ %{FugitiveStatusline()}

" right side
set statusline+=%=
set statusline+=\ %c:%l/%L
" }}}

" telescope {{{
lua require('telescope_config')
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope oldfiles<cr>
nnoremap <leader>c <cmd>Telescope commands<cr>
nnoremap <leader>ch <cmd>Telescope command_history<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>z <cmd>Telescope spell_suggest<cr>
noremap <F1> <cmd>Telescope help_tags<cr>
" }}}

" latex {{{
lua require"telescope".load_extension("bibtex")
let g:tex_flavor = "latex" " treat all tex as latex
augroup filetype_tex
  autocmd!
  " format tex files on save
  autocmd BufWritePre *.tex :normal gg=G``
  autocmd FileType tex inoremap <leader>cr <cmd>Telescope bibtex<cr>
augroup END
" }}}

" mutt settings {{{
augroup mutt
  autocmd!
  " expand mfg in mail
  autocmd BufRead /tmp/neomutt-* :iabbrev mfg Mit freundlichen Grüßen,<CR>Noah Wahl
  autocmd BufRead /tmp/neomutt-* set tw=72
  autocmd BufRead /tmp/neomutt-* :setlocal spell spelllang=de
augroup END
" }}}

" smart cwd {{{
nnoremap cf :cd %:p:h \| pwd<CR>
nnoremap cr :call <SID>CdToRepoRoot()<CR>
let g:markers = split('.git')
fun s:CdToRepoRoot() abort
  for marker in g:markers
    let root = finddir(marker, expand('%:p:h') . ';')
    if !empty(root)
      let root = fnamemodify(root, ':h')
      execute 'cd' fnameescape(root)
      echo 'cd ' . root . ' (found ' . marker . ')'
      return
    endif
  endfor
  echoerr 'No repo root found.'
endfun
" }}}

" sessions {{{
" TODO maybe use v:this_session
let g:session_dir = expand(stdpath('data') . '/sessions')
exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '/'
" TODO bufdo bd too clear all buffers before loading session
exec 'nnoremap <leader>sr :so ' . g:session_dir . '/'
" }}}

" completion {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_ignore_case = 1
let g:completion_trigger_keyword_length = 3
" }}}

" snippets {{{
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" lsp {{{
lua require('lsp_config')
" }}}

" treesitter {{{
lua require('ts_config')
" }}}

" cpp/h setings {{{
augroup filetype_cpp_h
  autocmd!
  autocmd FileType cpp,h nnoremap <buffer> <F4> <cmd>ClangdSwitchSourceHeader<cr>
  autocmd FileType cpp,h packadd termdebug
  autocmd FileType cpp,h setlocal cindent
  "autocmd FileType cpp,h setlocal equalprg=clang-format\ -style=Google
  autocmd FileType cpp,h setlocal cino=j1,(0,ws,Ws,N+s,t0,g0,+0
augroup END
" }}}

" nvim terminal {{{
tnoremap <Esc> <C-\><C-n>
" simulate behaviour of <c-r> in insert mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" quickly pull up a terminal in a split
noremap <leader>t <cmd>sp \| term<cr>
" }}}

" nvim-commenter {{{
vnoremap <leader>x :MultiCommenterToggle<cr>
nnoremap <leader>x :SingleCommenterToggle<cr>
" }}}

" termdebugger {
nnoremap <leader>dd :packadd termdebug \| TermdebugCommand
" }
