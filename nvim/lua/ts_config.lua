require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "c", "lua", "bash", "python", "typescript", "javascript", "norg", "norg_meta", "norg_table", "rust", "latex"},
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    }
  },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@swappable",
      },
      swap_previous = {
        ["<leader>A"] = "@swappable",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
    },

    lsp_interop = {
      enable = true,
      border = 'rounded',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
      },
    },
  },
}
