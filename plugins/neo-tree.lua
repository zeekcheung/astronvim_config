return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
    event_handlers = {
      {
        event = require("neo-tree.events").FILE_ADDED,
        handler = function(file_path)
          -- open file
          vim.cmd("edit " .. file_path)
          -- close explorer
          vim.cmd "Neotree close"
        end,
      },
    },
  },
}
