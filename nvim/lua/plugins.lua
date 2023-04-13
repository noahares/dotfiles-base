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
  use {'HiPhish/nvim-ts-rainbow2'}

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
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
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
      require("which-key").setup {
        disable = {
          filetypes = { "TelescopePrompt" },
        },
      }
    end
  }
  use {'norcalli/nvim-colorizer.lua', config = [[require"colorizer".setup()]]}
  use {'kyazdani42/nvim-web-devicons'}
  use {'tpope/vim-surround'}
  use {'mechatroner/rainbow_csv'}
  use {'willothy/flatten.nvim', config = function()
    require"flatten".setup{
        callbacks = {
          pre_open = function()
            -- Close toggleterm when an external open request is received
            require("toggleterm").toggle(0)
          end,
          post_open = function(bufnr, winnr, ft)
            if ft == "gitcommit" then
              -- If the file is a git commit, create one-shot autocmd to delete it on write
              -- If you just want the toggleable terminal integration, ignore this bit and only use the
              -- code in the else block
              vim.api.nvim_create_autocmd(
              "BufWritePost",
              {
                buffer = bufnr,
                once = true,
                callback = function()
                  -- This is a bit of a hack, but if you run bufdelete immediately
                  -- the shell can occasionally freeze
                  vim.defer_fn(
                  function()
                    vim.api.nvim_buf_delete(bufnr, {})
                  end,
                  50
                  )
                end
              }
              )
            else
              -- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
              -- This gives the appearance of the window opening independently of the terminal
              require("toggleterm").toggle(0)
              vim.api.nvim_set_current_win(winnr)
            end
          end,
          block_end = function()
            -- After blocking ends (for a git commit, etc), reopen the terminal
            require("toggleterm").toggle(0)
          end
        },
        block_for = {
          gitcommit = true,
        },
        window = {
          open = "current",
          focus = "first"
        }
      }
  end}
  use {'imsnif/kdl.vim'}
  use { "theRealCarneiro/hyprland-vim-syntax",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }
  -- use { 'tamton-aquib/duck.nvim' }
  -- use { 'eandrju/cellular-automaton.nvim' }
end)
