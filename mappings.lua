-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the

-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    -- ["<leader>bD"] = {
    --   function()
    --     require("astronvim.utils.status").heirline.buffer_picker(
    --       function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
    --     )
    --   end,
    --   desc = "Pick to close",
    -- },
    -- -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- yank all text in file
    ["<C-a>"] = { ":%y+<cr>", desc = "Yank All" },
    -- yank select text
    ["<C-c>"] = { ":y+<cr>", desc = "Yank Select" },
    -- paste from clipboard
    ["C-v"] = { ":+p<cr>", desc = "Paste from Clipboard" },
    -- Open Alpha Automatically When No More Buffers
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    -- find project
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find Projects" },
    -- find manual pages
    ["<leader>fM"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" },
    -- split window
    ["\\"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["|"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    -- toggle horizontal terminal
    ["`"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    -- find marks
    ["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
