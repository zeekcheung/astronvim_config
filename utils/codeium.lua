local hl = require "astronvim.utils.status.hl"
local status_utils = require "astronvim.utils.status.utils"

local utils = require "astronvim.utils"
local extend_tbl = utils.extend_tbl
local is_available = utils.is_available

local M = {}

M.event = "User"
M.pattern = "CodeiumChanged"

M.is_available = function() return is_available "codeium.vim" end

M.get_state = function() return vim.fn["codeium#GetStatusString"]() end

M.toggle = function()
  if M.get_state() == "OFF" then
    vim.cmd "CodeiumEnable"
  else
    vim.cmd "CodeiumDisable"
  end
end

--- A function to build a set of children components for a codeium section
---@param opts? table options for configuring codeium and the overall padding
---@return table # The Heirline component table
function M.heirline_component(opts)
  opts = extend_tbl({
    init = function(self) self.state = M.get_state() end,
    provider = function(self) return utils.get_icon "Codeium" .. self.state end,
    update = {
      M.event,
      pattern = M.pattern,
      callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
    },
    surround = {
      separator = "right",
      color = "treesitter_bg",
      condition = M.is_available,
    },
    hl = hl.get_attributes "treesitter",
    on_click = {
      name = "heirline_codeium",
      callback = function()
        M.toggle()
        M.trigger_event()
      end,
    },
  }, opts)

  return require("astronvim.utils.status.component").builder(status_utils.setup_providers(opts, {}))
end

M.config = function()
  if M.is_available() then
    vim.api.nvim_create_augroup("codeium", { clear = true })
    vim.api.nvim_create_autocmd(M.event, {
      group = "codeium",
      pattern = M.pattern,
      callback = function() end,
    })
  end
end

M.trigger_event = function() vim.cmd("doautocmd " .. M.event .. " " .. M.pattern) end

return M
