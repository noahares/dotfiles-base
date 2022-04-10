local cmp = require"cmp"
vim.o.completeopt="menu,menuone,noselect"
cmp.setup{
  snippet = {
      expand = function(args)
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources{
    { name = 'buffer', keyword_length = 4 },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' },
  },
  formatting = {
  format = require("lspkind").cmp_format({with_text = true, menu = ({
      buffer = "[buf]",
      path = "[path]",
      nvim_lsp = "[lsp]",
      luasnip = "[LuaSnip]",
      ultisnips = "[ultisnips]",
      nvim_lua = "[api]",
      latex_symbols = "[latex]",
    })}),
  },
  experimental = {
    native_menu = false,
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
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}
