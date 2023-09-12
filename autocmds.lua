local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local utils = require "astronvim.utils"
local is_available = utils.is_available

-- config neovide
if vim.g.neovide then require("user.utils.neovide").config() end

-- config pwsh
require("user.utils.pwsh").config()

-- config tsserver
-- require("user.utils.tsp-utils").config()

-- config rainbow-delimiters
require("user.utils.rainbow-delimiters").config()

-- config neo-tree
require("user.utils.neotree").config()

-- HACK: indent blankline doesn't properly refresh when scrolling the window
-- remove when fixed upstream: https://github.com/lukas-reineke/indent-blankline.nvim/issues/489
if is_available "indent-blankline.nvim" then
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
