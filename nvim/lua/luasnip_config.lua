local ls = require('luasnip')

ls.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  -- enable_autosnippets = true,
})

vim.keymap.set({'i', 's'}, "<c-k>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, {silent = true})

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
local sn = ls.snippet_node
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node

ls.cleanup()

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets(nil, {
  norg = {
    s({trig="project", desc="neorg project"},
    fmt(
    [[
    * <>

    *Project description*: <>

    *Associated Tasks*:

    ]],
    { i(1, "project name"),
      i(2, "project description")
    },
    { delimiters = "<>" })),

    s({trig="task", desc="neorg task"},
    fmt(
    [[
    - (<><> <>) <>
    ]],
    { i(3, " "), t("|#"), i(1, "context"), i(2, "task") },
    { delimiters = "<>" }))
  },
})
