local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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

-- Use Powershell as default shell on Windows
autocmd("VimEnter", {
  group = augroup("config_powershell", { clear = true }),
  callback = function()
    local os_type = vim.loop.os_uname().sysname
    if string.match(os_type, "Windows") then
      vim.opt.shell = "pwsh -nologo"
      vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"

      vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
      vim.opt.shellquote = ""
      vim.opt.shellxquote = ""
    end
  end,
})

-- config neovide
autocmd("VimEnter", {
  group = augroup("config_neovide", { clear = true }),
  callback = function() require("user.utils.neovide").config() end,
})
