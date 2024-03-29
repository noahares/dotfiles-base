vim.cmd('syntax on')

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  dim_inactive = {
    enable = true,
    shade = 'dark',
    percentage = 0.1,
  },
})
vim.cmd [[colorscheme catppuccin]]
