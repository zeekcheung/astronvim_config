return {
  "rafamadriz/friendly-snippets",
  event = "User AstroFile",
  config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
}
