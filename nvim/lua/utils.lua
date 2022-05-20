local Utils = {}

Utils.load = function(module)
  package.loaded[module] = nil
  return require(module)
end

function Utils.map(type, key, value, opts)
  local options = opts or {}
  vim.api.nvim_set_keymap(type, key, value, options)
end

function Utils.noremap(type, key, value, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(type,key,value, options)
end

function Utils.nnoremap(key, value, opts)
  Utils.noremap('n', key, value, opts)
end

function Utils.inoremap(key, value, opts)
  Utils.noremap('i', key, value, opts)
end

function Utils.vnoremap(key, value, opts)
  Utils.noremap('v', key, value, opts)
end

function Utils.xnoremap(key, value, opts)
  Utils.noremap('x', key, value, opts)
end

function Utils.tnoremap(key, value, opts)
  Utils.noremap('t', key, value, opts)
end

function Utils.cnoremap(key, value, opts)
  Utils.noremap('c', key, value, opts)
end

function Utils.nmap(key, value, opts)
  Utils.map('n', key, value, opts)
end

function Utils.imap(key, value, opts)
  Utils.map('i', key, value, opts)
end

function Utils.vmap(key, value, opts)
  Utils.map('v', key, value, opts)
end

function Utils.tmap(key, value, opts)
  Utils.map('t', key, value, opts)
end

P = function(stuff) return print(vim.inspect(stuff)) end

return Utils
