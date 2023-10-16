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
        maxPreload = 10000,
        preloadFileSize = 2000,
      },
      completion = {
        callSnippet = "Replace",
      },
      hint = {
        enable = true,
        arrayIndex = "Disable",
        setType = true,
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
