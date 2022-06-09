vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'tpope/vim-fugitive'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use { 'saadparwaiz1/cmp_luasnip' }
  use {'onsails/lspkind-nvim'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'~/repos/telescope-bibtex',
    config = [[require"telescope".load_extension("bibtex")]],
    ft = {'tex', 'markdown'}
  }
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {'honza/vim-snippets'}
  use { 'L3MON4D3/LuaSnip' }
  use { 'folke/todo-comments.nvim' }
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'bfredl/nvim-luadev'}
  use {'numToStr/Comment.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'tpope/vim-surround'}
  use {
    "nvim-neorg/neorg",
    requires = {{"nvim-lua/plenary.nvim"}, {"nvim-neorg/neorg-telescope"}}
  }
  use { 'p00f/clangd_extensions.nvim' }
  use {'simrat39/rust-tools.nvim'}
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup{
      open_mapping = '<leader>t',
    }
  end}
end)
