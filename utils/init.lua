local M = {}

local utils = require "astronvim.utils"

--- Find astronvim config files
M.find_config = function()
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

function M.fg(name)
  ---@type {foreground?:number}?
  local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl_by_name(name, true)
  ---@diagnostic disable-next-line: need-check-nil, undefined-field
  local fg = hl and hl.fg or hl.foreground
  return fg and { fg = string.format("#%06x", fg) }
end

--- setup an interval
M.watch = function(fn, interval, event_name)
  local status = fn()
  local timer = vim.loop.new_timer()

  vim.notify "Start to watch codeium stat"

  local function check()
    local new_status = fn()
    if new_status ~= status then
      status = new_status
      local command = "doautocmd " .. event_name
      vim.api.nvim_command(command)
    end
  end

  -- ---@diagnostic disable-next-line: need-check-nil
  timer:start(0, interval, check)
  --
  -- return timer
end

return M
