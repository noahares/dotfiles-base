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
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-commenter"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-commenter"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
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
    config = { "\27LJ\1\2K\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\vbibtex\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/ares/.local/share/nvim/site/pack/packer/start/telescope-bibtex"
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

-- Config for: telescope-bibtex
try_loadstring("\27LJ\1\2K\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\vbibtex\19load_extension\14telescope\frequire\0", "config", "telescope-bibtex")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
