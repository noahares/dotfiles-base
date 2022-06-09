local map = vim.keymap.set

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

map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>o', '<cmd>Telescope find_files<cr>')
map('n', '<leader>h', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>c', '<cmd>Telescope commands<cr>')
map('n', '<leader>ch', '<cmd>Telescope command_history<cr>')
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>z', '<cmd>Telescope spell_suggest<cr>')
map('','<F1>', '<cmd>Telescope help_tags<cr>')
