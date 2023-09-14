local hl = require "astronvim.utils.status.hl"
local status_utils = require "astronvim.utils.status.utils"

local utils = require "astronvim.utils"
local extend_tbl = utils.extend_tbl
local is_available = utils.is_available

local M = {}

M.event = "User"
M.pattern = "CodeiumChanged"

M.watch_state = function()
  -- define custom event
  vim.api.nvim_create_autocmd(M.event, {
    pattern = M.pattern,
    callback = function() end,
  })
  -- watch codeium state
  local timer = require("user.utils").watch(
    function() return vim.fn["codeium#GetStatusString"]() end,
    1000,
    M.event .. " " .. M.pattern
  )
  return timer
end

--- A function to build a set of children components for a codeium section
---@param opts? table options for configuring codeium and the overall padding
---@return table # The Heirline component table
function M.heirline_component(opts)
  opts = extend_tbl({
    str = {
      str = "Codeium" .. vim.fn["codeium#GetStatusString"](),
      icon = { kind = "DiagnosticHint", padding = { right = 1 } },
    },
    surround = {
      separator = "right",
      color = "treesitter_bg",
      -- condition = condition.treesitter_available,
    },
    hl = hl.get_attributes "treesitter",
    -- update = { "User", pattern = "GitSignsUpdate" },
    update = {
      "ModeChanged",
      pattern = "*:*",
      callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
    },
    -- init = init.update_events { "BufEnter" },
    on_click = {
      name = "heirline_codeium",
      callback = function()
        if is_available "telescope.nvimcodeium.vim" then
          -- vim.defer_fn(function() require("telescope.builtin").git_branches() end, 100)
          vim.defer_fn(function() vim.api.nvim_command "Telescope diagnostics severity_bound=ERROR" end, 100)
        end
      end,
    },
  }, opts)
  return require("astronvim.utils.status.component").builder(status_utils.setup_providers(opts, { "str" }))
end

return M
