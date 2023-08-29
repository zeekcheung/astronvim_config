local M = {}

M.config = function()
  -- if vim.g.ts_organize_imports_on_save then M.organizeImportsOnSave() end
  M.organizeImportsOnSave()
end

M.organizeImportsOnSave = function()
  vim.api.nvim_create_augroup("AutoTSLspOrganize", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    desc = "Organize imports on save",
    group = "AutoTSLspOrganize",
    callback = function() vim.cmd "TSLspOrganize" end,
  })
end

return M
