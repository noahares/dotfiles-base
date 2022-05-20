local utils = require("utils")

require('telescope').setup{
  defaults = {
    -- defaults here
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
    },
  },
  extensions = {
    bibtex = {
      depth = 1,
    },
  }
}

utils.nnoremap('<leader>b', '<cmd>Telescope buffers<cr>')
utils.nnoremap('<leader>o', '<cmd>Telescope find_files<cr>')
utils.nnoremap('<leader>h', '<cmd>Telescope oldfiles<cr>')
utils.nnoremap('<leader>c', '<cmd>Telescope commands<cr>')
utils.nnoremap('<leader>ch', '<cmd>Telescope command_history<cr>')
utils.nnoremap('<leader>f', '<cmd>Telescope live_grep<cr>')
utils.nnoremap('<leader>z', '<cmd>Telescope spell_suggest<cr>')
utils.noremap('','<F1>', '<cmd>Telescope help_tags<cr>')
