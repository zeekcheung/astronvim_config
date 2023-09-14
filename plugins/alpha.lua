return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
      [[]],
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    local get_icon = require("astronvim.utils").get_icon
    local button = dashboard.button

    dashboard.section.buttons.val = {
      button("n", get_icon("FileNew", 2, true) .. "New File  ", ":ene <BAR> startinsert <CR>"),
      button("f", get_icon("Search", 2, true) .. "Find Files  ", ":Telescope find_files<CR>"),
      button("w", get_icon("WordFile", 2, true) .. "Find Words  ", ":Telescope live_grep<CR>"),
      button("o", get_icon("DefaultFile", 2, true) .. "Find Oldfiles ", ":Telescope oldfiles<CR>"),
      button("p", get_icon("FolderClosed", 2, true) .. "Find Projects  ", ":Telescope projects<CR>"),
      button("m", get_icon("Bookmarks", 2, true) .. "Find Bookmarks  ", ":Telescope marks<CR>"),
      button(
        "s",
        get_icon("Refresh", 2, true) .. "Last Session  ",
        [[:lua require("resession").load "Last Session"<cr>]]
      ),
      button(
        "c",
        get_icon("ActiveLSP", 2, true) .. "Config  ",
        [[:lua require("user.utils.astronvim").find_config_files() <cr>]]
      ),
      button("l", get_icon("Package", 2, true) .. "Lazy  ", ":Lazy<CR>"),
      button("q", get_icon("DapStopped", 2, true) .. "Quit  ", ":qa<CR>"),
    }
    for _, _button in ipairs(dashboard.section.buttons.val) do
      _button.opts.hl = "DashboardCenter"
      _button.opts.hl_shortcut = "DashboardShortcut"
    end

    local section = dashboard.section

    dashboard.config.layout = {
      { type = "padding", val = 1 },
      section.header,
      { type = "padding", val = 2 },
      section.buttons,
      { type = "padding", val = 0 },
      section.footer,
    }

    return dashboard
  end,

  config = require "plugins.configs.alpha",
}
