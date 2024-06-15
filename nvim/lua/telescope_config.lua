local map = vim.keymap.set
local bibtex_actions = require('telescope-bibtex.actions')

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
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = '',
      -- Path to global bibliographies (placed outside of the project)
      global_files = {},
      -- Define the search keys to use in the picker
      search_keys = { 'author', 'year', 'title' },
      -- Template for the formatted citation
      citation_format = '{{author}} ({{year}}), {{title}}.',
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = false,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
      mappings = {
                i = {
                  ["<CR>"] = bibtex_actions.key_append('%s'), -- format is determined by filetype if the user has not set it explictly
                  ["<C-e>"] = bibtex_actions.entry_append,
                  ["<C-c>"] = bibtex_actions.citation_append('{{author}} ({{year}}), {{title}}.'),
                }
            },
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
