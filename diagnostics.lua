-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
return {
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  float = {
    header = false,
    border = "rounded",
    focusable = true,
  },
}
