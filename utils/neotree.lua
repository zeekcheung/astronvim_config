local M = {}

M.update_codeium_status = function(delay)
  vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = ":Codeium*",
    callback = function()
      -- vim.schedule(function() vim.cmd.redrawstatus() end)
      vim.defer_fn(function() vim.cmd.redrawstatus() end, delay)
    end,
  })
end

M.config = function() M.update_codeium_status(5000) end

return M
