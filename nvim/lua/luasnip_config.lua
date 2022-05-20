local ls = require('luasnip')

ls.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  -- enable_autosnippets = true,
})

vim.keymap.set({'i', 's'}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    print("success")
    ls.expand_or_jump()
  end
end)

vim.keymap.set({'i', 's'}, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

vim.keymap.set({'i', 's'}, '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice()
  end
end, {silent = true})

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnip_config.lua<CR>")

-- snippets
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep
local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node

ls.cleanup()

ls.add_snippets(nil, {
  all = {
    s("date", f(function() return os.date("%Y-%m-%d") end)),
  },

  lua = {
    ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
    s("req", fmt([[local {} = require('{}')]], {
      f(function(name)
        local parts = vim.split(name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }),
    i(1) })),
  },
})
