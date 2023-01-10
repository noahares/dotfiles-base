-- Simulate vimwiki behavior (alternatively use <C-^> or <C-6>)
vim.keymap.set("n", "<Backspace>", "<cmd>b#<CR>", {silent = true})
-- Quickly go to todays journal
vim.keymap.set("n", "<leader>nt", "<cmd>Neorg journal today<cr>", {silent = true})
-- insert links easily
vim.keymap.set({'i', 'n'}, '<leader>ll', '<cmd>Telescope neorg insert_link<cr>')
vim.keymap.set({'i', 'n'}, '<leader>lf', '<cmd>Telescope neorg insert_file_link<cr>')
-- cd for norg
local workspace = require'neorg'.modules.get_module('core.norg.dirman').get_current_workspace()
vim.fn.chdir(workspace[2])
