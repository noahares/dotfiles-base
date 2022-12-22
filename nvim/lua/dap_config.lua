local dap = require('dap')

-- dap.defaults.fallback.terminal_win_cmd = 'ToggleTerm'

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    -- program = function()
      --   return vim.ui.input({prompt = 'Path to executable: ', default = vim.fn.getcwd(), completion = 'file' }, function(input)
        --     return input
        --   end)
        -- end,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local argument_string = vim.fn.input('Program arguments: ')
      return vim.fn.split(argument_string, " ", true)
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    sourceLanguages = { 'rust' },
    showDisassembly = "never"
  },
}

vim.keymap.set('n', '<leader>db', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>db', function() require"dap".list_breakpoints() end)
vim.keymap.set('n', '<leader>dB', function()
  require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<leader>dR', function() require"dap".clear_breakpoints() end)
vim.keymap.set({'n', 't'}, '<leader>do', function() require"dap".step_out() end)
vim.keymap.set({'n', 't'}, "<leader>di", function() require"dap".step_into() end)
vim.keymap.set({'n', 't'}, '<leader>do', function() require"dap".step_over() end)
vim.keymap.set({'n', 't'}, '<leader>dc', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dt', function() require"dap".terminate() end)
vim.keymap
    .set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>ds', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>df', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>dk', function() require"dap".up() end)
vim.keymap.set('n', '<leader>dj', function() require"dap".down() end)
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

-- dap.configurations.cpp = dap.configurations.rust
