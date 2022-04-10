vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-fugitive'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'quangnguyen30192/cmp-nvim-ultisnips'}
  use {'onsails/lspkind-nvim'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'bfredl/nvim-luadev'}
  --use {'~/repos/nvim-commenter'}
  use {'numToStr/Comment.nvim'}
  use {'~/repos/telescope-bibtex',
    config = [[require"telescope".load_extension("bibtex")]],
    ft = {'tex', 'markdown'}
  }
  use {'vimwiki/vimwiki', branch = 'dev'}
  use {'ElPiloto/telescope-vimwiki.nvim',
    config = [[require"telescope".load_extension("vimwiki")]]
  }
  use {'kyazdani42/nvim-web-devicons'}
  use {'tpope/vim-surround'}
  use { 'p00f/clangd_extensions.nvim' }
end)
