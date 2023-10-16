return {
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = {
      lazy = true,
      version = false, -- always use the latest git commit
    },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
    checker = {
      enabled = true,
      notify = false, -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
    },
    change_detection = {
      enabled = true,
      notify = false, -- get a notification when changes are found
    },
    performance = {
      cache = {
        enabled = true,
        -- disable_events = {},
      },
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  },
}
