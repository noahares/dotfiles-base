require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "lua", "bash", "python", "typescript", "javascript"},
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    -- maybe better keymaps?
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
}
