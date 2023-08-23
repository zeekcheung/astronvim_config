local denols = function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
  -- opts.single_file_support = true
  return opts
end

return denols
