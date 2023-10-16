return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = false,
      content_layout = "center",
    },
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
      bind_to_cwd = true,
      follow_current_file = { enabled = false },
      use_libuv_file_watcher = true,
    },
    event_handlers = {
      {
        event = "file_added",
        handler = function(file_path)
          -- vim.cmd("edit " .. file_path .. "| startinsert!")
          -- vim.cmd("Neotree Toggle")
        end,
      },
    },
    window = {
      mappings = {
        ["H"] = "prev_source",
        ["L"] = "next_source",
        ["s"] = "none", -- disable default mappings
        ["<leftrelease>"] = "open", -- open node with single left click
      },
    },
  },
}
