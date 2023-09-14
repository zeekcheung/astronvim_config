local utils = require "astronvim.utils"

local M = {}

-- Find AstroNvim config files
M.find_config_files = function()
  local cwd = vim.fn.stdpath "config" .. "/.."
  local search_dirs = {}
  for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations
    if dir == astronvim.install.home then dir = dir .. "/lua/user" end -- don't search the astronvim core files
    if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
  end
  if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
    utils.notify("No user configuration files found", vim.log.levels.WARN)
  else
    if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
    require("telescope.builtin").find_files {
      prompt_title = "Config Files",
      search_dirs = search_dirs,
      cwd = cwd,
      follow = true,
    } -- call telescope
  end
end

return M
