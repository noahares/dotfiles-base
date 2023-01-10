local map = vim.keymap.set

require('telescope').setup{
  defaults = {
    wrap_results = true,
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
    undo = {
      side_by_side = true,
    },
  }
}

local builtin = require("telescope.builtin")

map('n', '<leader>b', builtin.buffers)
map('n', '<leader>o', builtin.find_files)
map('n', '<leader>h', builtin.oldfiles)
map('n', '<leader>c', builtin.commands)
map('n', '<leader>ch', builtin.command_history)
map('n', '<leader>f', builtin.live_grep)
map('n', '<leader>z', builtin.spell_suggest)
map('','<F1>', builtin.help_tags)
map('i', '<leader>s', '<cmd>Telescope symbols<cr>')
map("n", "<leader>u", "<cmd>Telescope undo<cr>")
map('n', '<leader>ec', function() builtin.find_files({cwd = vim.fn.stdpath('config')}) end)
map('n', '<leader>ed', function() builtin.find_files({search_dirs = {'$HOME/dotfiles-base', '$HOME/dotfiles-extended'}}) end)
