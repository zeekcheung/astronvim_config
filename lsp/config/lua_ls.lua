return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        ignoreDir = {
          ".vscode",
          ".git",
        },
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      completion = {
        callSnippet = "Replace",
      },
      hint = {
        enable = true,
      },
      diagnostics = {
        enable = false,
        globals = {
          "vim",
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
