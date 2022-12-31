-- Simulate vimwiki behavior (alternatively use <C-^> or <C-6>)
vim.keymap.set("n", "<Backspace>", "<cmd>b#<CR>", {silent = true})
-- insert link easily
vim.keymap.set({'i', 'n'}, '<leader>l', '<cmd>Telescope neorg insert_link<cr>')
-- cd for norg
local workspace = require'neorg'.modules.get_module('core.norg.dirman').get_current_workspace()
vim.fn.chdir(workspace[2])
