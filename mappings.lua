-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the

-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local ression = require "resession"
local utils = require "astronvim.utils"
local get_icon = utils.get_icon

return {
  -- normal mode
  n = {
    -- Disable default keymaps
    ["<leader>pA"] = false,
    ["<leader>pl"] = false,
    ["<leader>pv"] = false,
    ["<leader>lS"] = false,
    ["<leader>lh"] = false,
    ["<leader>S"] = false,
    ["<leader>Sl"] = false,
    ["<leader>Ss"] = false,
    ["<leader>St"] = false,
    ["<leader>Sd"] = false,
    ["<leader>Sf"] = false,
    ["<leader>S."] = false,

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- select all text in file
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    -- paste from clipboard
    ["C-v"] = { ":+p<cr>", desc = "Paste from Clipboard" },
    -- undo
    ["C-z"] = { "u", desc = "Undo" },
    -- goto line start
    ["gs"] = { "^", desc = "Goto line start" },
    -- clear search with <esc>
    ["<esc>"] = { "<cmd>noh<cr><esc>", desc = "Escape and clear hlsearchA," },

    -- AstroNvim
    ["<leader>A"] = { name = get_icon("ActiveLSP", 1, true) .. "AstroNvim" },
    -- version
    ["<leader>Av"] = { "<cmd>AstroVersion", desc = "AstroVersion" },
    -- reload
    ["<leader>Ar"] = { "<cmd>AstroReload", desc = "AstroReload" },
    -- update
    ["<leader>Au"] = { "<cmd>AstroUpdate", desc = "AstroUpdate" },
    -- changelog
    ["<leader>Ac"] = { "<cmd>AstroChangelog", desc = "AstroChangelog" },
    -- rollback
    ["<leader>AR"] = { "<cmd>AstroRollback", desc = "AstroRollback" },

    -- Buffers
    ["<leader>b"] = { name = "Buffers" },
    -- previous buffer
    ["L"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    -- next buffer
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- Open Alpha Automatically When No More Buffers
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    -- split window
    ["\\"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["|"] = { "<cmd>split<cr>", desc = "Horizontal Split" },

    -- Find
    -- find project
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find Projects" },
    -- find manual pages
    ["<leader>fM"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" },
    -- find marks
    ["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" },
    -- find diagnostics
    ["<leader>fd"] = { "<cmd>Telescope diagnostics severity_bound=ERROR<cr>", desc = "Find diagnostics" },

    -- Session
    ["<leader>s"] = { name = get_icon("Session", 1, true) .. "Session" },
    ["<leader>sl"] = { function() ression.load "Last Session" end, desc = "Load last session" },
    ["<leader>ss"] = { function() ression.save() end, desc = "Save this session" },
    ["<leader>st"] = { function() ression.save_tab() end, desc = "Save this tab's session" },
    ["<leader>sd"] = { function() ression.delete() end, desc = "Delete a session" },
    ["<leader>sf"] = { function() ression.load() end, desc = "Load a session" },
    ["<leader>s."] = {
      function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end,
      desc = "Load current directory session",
    },

    -- Lsp
    ["<leader>lo"] = { "<cmd>AerialToggle<cr>", desc = "Toggle outline" },

    -- Refactor
    ["<leader>r"] = { name = get_icon("Refresh", 1, true) .. "Refactor" },

    -- UI/UX
    -- toggle neovide fullscreen
    ["<F11>"] = { function() require("user.utils.neovide").toggle_fullScreen() end, desc = "Toggle Neovide Fullscreen" },
    -- toggle Trouble
    ["<leader>uD"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
  },
  -- visual mode
  v = {
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", desc = "Save File" },
    -- select all text in file
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    -- goto line start
    ["gs"] = { "^", desc = "Goto line start" },
  },
  -- visula line mode
  x = {
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", desc = "Save File" },
    -- select all text in file
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    -- goto line start
    ["gs"] = { "^", desc = "Goto line start" },
  },
  -- insert mode
  i = {
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", desc = "Save File" },
    -- select all text in file
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    -- undeo
    ["C-z"] = { "<esc>u", desc = "Undo" },

    -- clear search with <esc>
    ["<esc>"] = { "<cmd>noh<cr><esc>", desc = "Escape and clear hlsearchA," },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
