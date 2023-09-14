return {
  "rebelot/heirline.nvim",
  dependencies = {
    "Exafunction/codeium.vim",
  },
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    local hl = require "astronvim.utils.status.hl"
    local codeium_status_component = require("user.utils.codeium").heirline_component()

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
      status.component.file_info {
        file_icon = { hl = hl.file_icon "statusline", padding = { left = 0, right = 1 } },
        filetype = false,
        filename = {},
        file_modified = false,
      },
      status.component.git_branch { git_branch = { icon = { kind = "GitBranch", padding = { right = 1 } } } },
      status.component.git_diff { added = { icon = { kind = "GitAdd", padding = { left = 0, right = 1 } } } },
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),

      status.component.fill(),
      status.component.lsp(),
      codeium_status_component,
      status.component.nav { ruler = { padding = { left = 0 } } },
      -- remove the 2nd mode indicator on the right
    }
    -- return the final configuration table
    return opts
  end,
}
