vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'onsails/lspkind-nvim'}
  use {'p00f/clangd_extensions.nvim'}
  use {'simrat39/rust-tools.nvim'}
  use {'barreiroleo/ltex-extra.nvim'}

  use {'catppuccin/nvim', as = 'catppuccin'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}

  -- cmp
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rcarriga/cmp-dap' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'~/repos/telescope-bibtex',
    config = [[require"telescope".load_extension("bibtex")]],
    ft = {'tex', 'markdown'}
  }
  use {
    'debugloop/telescope-undo.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension("undo")
    end,
  }
  use {'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      select = {
        get_config = function(opts)
          if opts.kind == "codeaction" then
            return {
              telescope = require("telescope.themes").get_cursor(),
            }
          end
        end,
      },
    })
  end}
  use {'nvim-telescope/telescope-symbols.nvim'}

  -- dap
  use { 'mfussenegger/nvim-dap' }

  -- other essentials
  use {'tpope/vim-fugitive'}
  use {"rafamadriz/friendly-snippets"}
  use {'L3MON4D3/LuaSnip'}
  use {'folke/todo-comments.nvim'}
  use {'numToStr/Comment.nvim'}
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    requires = {{"nvim-lua/plenary.nvim"}, {"nvim-neorg/neorg-telescope"}}
  }
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup{
      open_mapping = '<leader>t',
    }
  end}
  use({
    'https://github.com/nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
      })
    end
  })

  -- misc
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'kyazdani42/nvim-web-devicons'}
  use {'tpope/vim-surround'}
  -- use { 'tamton-aquib/duck.nvim' }
  -- use { 'eandrju/cellular-automaton.nvim' }
end)
