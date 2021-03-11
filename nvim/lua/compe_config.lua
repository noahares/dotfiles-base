local utils = require('utils')
vim.o.completeopt="menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    calc = true;
    buffer = {menu = '[BUF]'};
    ultisnips = {menu = '[SPT]'};
    nvim_lsp = {menu = '[LSP]'};
    nvim_lua = {menu = '[LUA]'};
    spell = true;
    --tags = true;
    --snippets_nvim = true;
    treesitter = true;
  };
}

utils.inoremap('<CR>', 'compe#confirm("<CR>")', {expr=true, silent=true})
utils.inoremap('<C-e>', 'compe#close("<C-e>")', {expr=true, silent=true})
