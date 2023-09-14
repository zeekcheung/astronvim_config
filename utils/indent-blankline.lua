local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local utils = require "astronvim.utils"
local is_available = utils.is_available

local M = {}

M.set_highlight = function()
  if vim.g.indent_blankline_highlight then
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  end
end

M.hack = function()
  -- HACK: indent blankline doesn't properly refresh when scrolling the window
  -- remove when fixed upstream: https://github.com/lukas-reineke/indent-blankline.nvim/issues/489
  autocmd("WinScrolled", {
    desc = "Refresh indent blankline on window scroll",
    group = augroup("indent_blankline_refresh_scroll", { clear = true }),
    callback = function()
      -- TODO: remove neovim version check when dropping support for Neovim 0.8
      -- if vim.fn.has "nvim-0.9" ~= 1 or vim.v.event.all.leftcol ~= 0 then pcall(vim.cmd.IndentBlanklineRefresh) end
      if vim.fn.has "nvim-0.9" ~= 1 then pcall(vim.cmd.IndentBlanklineRefresh) end
    end,
  })
end

M.config = function()
  if is_available "indent-blankline.nvim" then
    M.hack()
    M.set_highlight()
  end
end

return M
