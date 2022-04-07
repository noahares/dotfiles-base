local utils = require("utils")

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
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

utils.nnoremap('<leader>vw', '<cmd>Telescope vimwiki<cr>')
utils.nnoremap('<leader>vg', '<cmd>Telescope vimwiki live_grep<cr>')
