-- update plugins
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

-- remove trailing whitespaces
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\s\+$//e]],
})
-- remove trailing newline
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\n\+\%$//e]],
})
-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*xresources',
  command = '!xrdb %',
})
-- Update binds when sxhkdrc is updated.
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*sxhkdrc',
  command = '!pkill -USR1 sxhkd',
})
-- formatopts
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() vim.opt.formatoptions:remove {'r', 'o'} end,
})
