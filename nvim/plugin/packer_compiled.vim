" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/ares/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/ares/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/ares/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/ares/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ares/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  gruvbox = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require"colorizer".setup()' },
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-commenter"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-commenter"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-luadev"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ares/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-bibtex"] = {
    config = { 'require"telescope".load_extension("bibtex")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/ares/.local/share/nvim/site/pack/packer/opt/telescope-bibtex"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/wal.vim"
  }
}

-- Config for: nvim-colorizer.lua
require"colorizer".setup()
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'telescope-bibtex'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'telescope-bibtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
