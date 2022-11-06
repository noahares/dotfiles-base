local map = vim.keymap.set

local custom_attach = function(_)
	print("LSP started.");

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      update_in_insert = false,
    }
  )

  map('n', 'gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n', 'K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', '<F2>', '<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')
  map('n', '<F5>','<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n', '<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>=', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
  map('v', '<leader>=', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
  map('n', '<leader>d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  map('n', '<leader>D', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

  map('n', '<c-]>','<cmd>Telescope lsp_definitions<CR>')
  map('n', 'gr','<cmd>Telescope lsp_references<CR>')
  map('n', 'gi','<cmd>lua Telescope lsp_implementations<CR>')
end

-- vim.lsp.set_log_level("debug")
require('vim.lsp.log').set_format_func(vim.inspect)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- setup all lsp servers here
local nvim_lsp = require'lspconfig'
nvim_lsp.bashls.setup{
  capabilities = capabilities,
  on_attach=custom_attach
}
nvim_lsp.texlab.setup{
  capabilities = capabilities,
  on_attach=custom_attach,
  cmd = {'texlab'},
  --name = "texlab_fancy";
  settings = {
    latex = {
      rootDirectory = '.',
      build = {
        args = {
          '-pdf',
          '-interaction=nonstopmode',
          '--shell-escape',
          '-synctex=1',
          '-output-directory=build',
          '-lualatex',
          '-pvc',
          '%f',
        },
        onSave = true,
        forwardSearchAfter = true,
        outputDirectory = './build',
        executable = 'latexmk',
      },
      forwardSearch = {
        executable = 'zathura',
        args = {
          '--synctex-forward',
          '%l:1:%f',
          '%p' },
        onSave = true,
      },
    }
  }
}
nvim_lsp.pylsp.setup{
  capabilities = capabilities,
  on_attach=custom_attach
}
nvim_lsp.tsserver.setup{
  capabilities = capabilities,
  on_attach=custom_attach
}
nvim_lsp.sumneko_lua.setup{
  capabilities = capabilities,
  cmd = {'lua-language-server'},
  on_attach=custom_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          vim.split(package.path, ';'),
        },
      },
      -- completion = { keywordSnippet = "Disable", },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        maxPreload = 1000,
        preloadFileSize = 1000,
        checkThirdParty = false,
      }
    }
  }
}
nvim_lsp.cmake.setup{
  capabilities = capabilities,
  on_attach=custom_attach
}

require("clangd_extensions").setup {
  server = {
    -- options to pass to nvim-lspconfig
    -- i.e. the arguments to require("lspconfig").clangd.setup({})
    capabilities = capabilities,
    on_attach=custom_attach,
    filetypes = {"c", "cpp", "objc", "objcpp", "hpp", "h"},
    cmd = {
      "clangd",
      "--completion-style=detailed",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--header-insertion-decorators"
    },
    root_dir = nvim_lsp.util.root_pattern('.git'),
    single_file_support = true,
  },
  extensions = {
    -- defaults:
    -- Automatically set inlay hints (type hints)
    autoSetHints = true,
    -- Whether to show hover actions inside the hover window
    -- This overrides the default hover handler
    hover_with_actions = true,
    -- These apply to the default ClangdSetInlayHints command
    inlay_hints = {
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause  higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },

      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },

      highlights = {
        detail = "Comment",
      },
      memory_usage = {
        border = "none",
      },
      symbol_info = {
        border = "none",
      },
    },
  }
}
require('rust-tools').setup({
  server = {
    capabilities = capabilities,
    on_attach = custom_attach
  }
})
nvim_lsp.ltex.setup({
  capabilities = capabilities,
  on_attach=custom_attach,
  settings = {
    ltex = {
      -- additionalRules = {
      --   enablePickyRules = true,
      --   motherTongue = "de-DE",
      -- },
      completionEnabled = true,
      enabledRules = {
        ["en-US"] = {
          "PUNCTUATION",
          "COMPOUNDING",
          "GRAMMAR",
        },
      }
    },
  },
})
