local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP
  {'neovim/nvim-lspconfig'},
  {'onsails/lspkind-nvim'},
  {'p00f/clangd_extensions.nvim'},
  {'simrat39/rust-tools.nvim'},
  {'barreiroleo/ltex-extra.nvim'},

  {'catppuccin/nvim', name = 'catppuccin'},

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  },
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
  end
  },
  {'kaarmu/typst.vim', ft = {'typst'}},

  -- cmp
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-nvim-lua'},
  {'hrsh7th/cmp-nvim-lsp'},
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rcarriga/cmp-dap' },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  },
  { dir = '~/repos/telescope-bibtex',
    config = function()
      require"telescope".load_extension("bibtex")
    end
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },
  -- {'stevearc/dressing.nvim',
  -- config = function()
  --   require('dressing').setup({
  --     select = {
  --       get_config = function(opts)
  --         if opts.kind == "codeaction" then
  --           return {
  --             telescope = require("telescope.themes").get_cursor(),
  --           }
  --         end
  --       end,
  --     },
  --   })
  -- end},
  {'nvim-telescope/telescope-symbols.nvim'},

  -- dap
  { 'mfussenegger/nvim-dap' },

  -- other essentials
  {'tpope/vim-fugitive'},
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {"rafamadriz/friendly-snippets"},
  {'L3MON4D3/LuaSnip'},
  {'folke/todo-comments.nvim'},
  {'numToStr/Comment.nvim'},
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {{"nvim-lua/plenary.nvim"}, {"nvim-neorg/neorg-telescope"}}
  },
  -- use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --   require("toggleterm").setup{
  --     open_mapping = '<leader>t',
  --   }
  -- end}
  {
    'https://github.com/nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
      })
    end
  },
  {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  },

  -- misc
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        disable = {
          filetypes = { "TelescopePrompt" },
        },
      }
    end
  },
  {'norcalli/nvim-colorizer.lua', config = function() require"colorizer".setup() end},
  {'kyazdani42/nvim-web-devicons'},
  {'tpope/vim-surround'},
  {'mechatroner/rainbow_csv'},
  -- {'willothy/flatten.nvim', config = function()
  --   require"flatten".setup{
  --       callbacks = {
  --         -- pre_open = function()
  --         --   -- Close toggleterm when an external open request is received
  --         --   require("toggleterm").toggle(0)
  --         -- end,
  --         post_open = function(bufnr, winnr, ft)
  --           if ft == "gitcommit" then
  --             -- If the file is a git commit, create one-shot autocmd to delete it on write
  --             -- If you just want the toggleable terminal integration, ignore this bit and only use the
  --             -- code in the else block
  --             vim.api.nvim_create_autocmd(
  --             "BufWritePost",
  --             {
  --               buffer = bufnr,
  --               once = true,
  --               callback = function()
  --                 -- This is a bit of a hack, but if you run bufdelete immediately
  --                 -- the shell can occasionally freeze
  --                 vim.defer_fn(
  --                 function()
  --                   vim.api.nvim_buf_delete(bufnr, {})
  --                 end,
  --                 50
  --                 )
  --               end
  --             }
  --             )
  --           -- else
  --           --   -- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
  --           --   -- This gives the appearance of the window opening independently of the terminal
  --           --   require("toggleterm").toggle(0)
  --           --   vim.api.nvim_set_current_win(winnr)
  --           end
  --         end,
  --         -- block_end = function()
  --         --   -- After blocking ends (for a git commit, etc), reopen the terminal
  --         --   require("toggleterm").toggle(0)
  --         -- end
  --       },
  --       block_for = {
  --         gitcommit = true,
  --       },
  --       window = {
  --         open = "current",
  --         focus = "first"
  --       }
  --     }
  -- end},
  {'imsnif/kdl.vim'},
  { "theRealCarneiro/hyprland-vim-syntax",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    'KaitlynEthylia/TreePin',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    keys = {
      { "<leader>tp", "<cmd>TPPin<cr>", desc = "TreePin" },
      { "gp", "<cmd>TPGo<cr>", desc = "go to TreePin" },
      { "<leader>tg", "<cmd>TPGrow<cr>", desc = "Grow TreePin" },
      { "<leader>ts", "<cmd>TPShrink<cr>", desc = "Shrink TreePin" },
      { "<leader>tc", "<cmd>TPClear<cr>", desc = "Clear TreePin" },
    },
    config = function() require('treepin').setup({
      separator = '-',
    })
    end,
  },
  -- use {
  --   'nosduco/remote-sshfs.nvim',
  --   requires = { {'nvim-telescope/telescope.nvim'} },
  --   config = function()
  --     require('remote-sshfs').setup({})
  --     require('telescope').load_extension 'remote-sshfs'
  --   end
  -- }
  -- use { 'tamton-aquib/duck.nvim' }
  -- use { 'eandrju/cellular-automaton.nvim' }
})
