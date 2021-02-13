vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-fugitive'}
  use {'dylanaraps/wal.vim'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-lua/completion-nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'~/repos/nvim-commenter'}
  use {'~/repos/telescope-bibtex',
  config = function()
    require"telescope".load_extension("bibtex")
  end
}
end)
