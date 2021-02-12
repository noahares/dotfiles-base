local Utils = {}

function Utils.map(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, {})
end

function Utils.noremap(type, key, value)
  vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true})
end

function Utils.nnoremap(key, value)
  Utils.noremap('n', key, value)
end

function Utils.inoremap(key, value)
  Utils.noremap('i', key, value)
end

function Utils.vnoremap(key, value)
  Utils.noremap('v', key, value)
end

function Utils.tnoremap(key, value)
  Utils.noremap('t', key, value)
end

function Utils.nmap(key, value)
  Utils.map('n', key, value)
end

function Utils.imap(key, value)
  Utils.map('i', key, value)
end

function Utils.vmap(key, value)
  Utils.map('v', key, value)
end

function Utils.tmap(key, value)
  Utils.map('t', key, value)
end

P = function(stuff) return print(vim.inspect(stuff)) end

-- SET OPTS --> EG --> opt('b', 'expandtab', true)
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
function Utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

return Utils
