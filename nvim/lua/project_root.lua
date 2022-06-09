local api = vim.api

local M = {}

function M.find_project_root()
  local id = [[.git]]
  local file = api.nvim_buf_get_name(0)
  local root = vim.fn.finddir(id, file .. ';')
  root = root:gsub(id, '')
  if root ~= "" then
    print(root)
    vim.api.nvim_set_current_dir(root)
  elseif root ~= vim.fn.getcwd() then
    print("Already at root of project.")
  else
    print("No repo found.")
  end
end

return M
