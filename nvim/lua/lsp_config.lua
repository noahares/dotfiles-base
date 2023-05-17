local map = vim.keymap.set
local opts = { noremap=true, silent=true }

local custom_attach = function(_)
	print("LSP started.");

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      update_in_insert = false,
    }
  )

  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gs', vim.lsp.buf.signature_help, opts)
  map('n', '<leader>d', vim.diagnostic.open_float, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map('n', '<leader>r', vim.lsp.buf.rename, opts)
  map({'n', 'v'}, '<leader>=', function() vim.lsp.buf.format({ async = true }) end, opts)
  map('n', '[d', vim.diagnostic.goto_next, opts)
  map('n', ']d', vim.diagnostic.goto_prev, opts)

  map('n', '<c-]>','<cmd>Telescope lsp_definitions<CR>', opts)
  map('n', 'gr','<cmd>Telescope lsp_references<CR>', opts)
  map('n', 'gi','<cmd>lua Telescope lsp_implementations<CR>', opts)
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
nvim_lsp.pyright.setup{
  capabilities = capabilities,
  on_attach=custom_attach,
  root_dir = function()
    return vim.fn.getcwd()
  end,
}
nvim_lsp.tsserver.setup{
  capabilities = capabilities,
  on_attach=custom_attach
}
nvim_lsp.lua_ls.setup{
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
local rt = require"rust-tools"
rt.setup({
  server = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      custom_attach()
      map("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true
        },
      },
    },
  },
  -- dap = {
  --   adapter = require('rust-tools.dap').get_codelldb_adapter(
  --   '/usr/bin/codelldb/adapter/codelldb',
  --   '/usr/lib/liblldb.so')
  -- },
  hover_actions = {
    auto_focus = true
  }
})
nvim_lsp.ltex.setup({
  capabilities = capabilities,
  on_attach = function(_, _)
    custom_attach()
    require("ltex_extra").setup{
      load_langs = { "de-DE", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
      init_check = true, -- boolean : whether to load dictionaries on startup
      path = vim.fn.stdpath'config' .. '/spell', -- string : path to store dictionaries. Relative path uses current working directory
      log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
    }
  end,
  settings = {
    ltex = {
      -- language = "de-DE",
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
        ["de-DE"] = {
          "PUNCTUATION",
          "COMPOUNDING",
          "GRAMMAR",
        },
      }
    },
  },
})
