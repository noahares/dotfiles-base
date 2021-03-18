vim.cmd [[packadd packer.nvim]]

--local packer = nil
--local function init()
--  if packer == nil then
--    packer = require('packer')
--    packer.init()
--  end
--
--  local use = packer.use
--  packer.reset()
return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-fugitive'}
  use {'dylanaraps/wal.vim'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'hrsh7th/nvim-compe'}
  use {'nvim-telescope/telescope.nvim'}
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'bfredl/nvim-luadev'}
  use {'~/repos/nvim-commenter'}
  use {'~/repos/telescope-bibtex', config = [[require"telescope".load_extension("bibtex")]], ft = {'tex', 'markdown'}}
end)

--local plugins = setmetatable({}, {
--  __index = function(_, key)
--    init()
--    return packer[key]
--  end
--})
--
--return plugins
