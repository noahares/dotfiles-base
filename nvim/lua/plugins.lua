vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-fugitive'}
  --use {'dylanaraps/wal.vim'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'hrsh7th/nvim-compe'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'bfredl/nvim-luadev'}
  use {'~/repos/nvim-commenter'}
  use {'~/repos/telescope-bibtex',
    config = [[require"telescope".load_extension("bibtex")]],
    ft = {'tex', 'markdown'}
  }
  use {'vimwiki/vimwiki'}
  use {'ElPiloto/telescope-vimwiki.nvim',
    config = [[require"telescope".load_extension("vimwiki")]]
  }
  --use {'kyazdani42/nvim-web-devicons'}
end)
