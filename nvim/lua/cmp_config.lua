local cmp = require"cmp"
vim.o.completeopt="menu,menuone,noselect"
cmp.setup{
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources{
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'neorg' },
    { name = 'buffer', keyword_length = 4 },
  },
  formatting = {
  format = require("lspkind").cmp_format({with_text = true, menu = ({
      buffer = "[buf]",
      path = "[path]",
      nvim_lsp = "[lsp]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[api]",
      neorg = "[neorg]",
    })}),
  },
  experimental = {
    ghost_text = true,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  view = {
    entries = 'native'
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
    or require("cmp_dap").is_dap_buffer()
  end,
}
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }
