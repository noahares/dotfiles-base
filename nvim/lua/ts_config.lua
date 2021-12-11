require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "lua", "bash", "python", "typescript", "javascript"},
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
  }
}
