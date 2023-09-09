return {
  "rebelot/heirline.nvim",
  dependencies = { "Exafunction/codeium.vim" },
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    local codeium_status_component = {
      provider = require("astronvim.utils.status").provider.str {
        str = "Codeium:" .. vim.fn["codeium#GetStatusString"](),
        padding = { left = 1, right = 1 },
      },
    }

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info { filetype = {}, filename = false, file_modified = false },
      status.component.git_diff(),
      status.component.diagnostics(),

      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      codeium_status_component,
      status.component.lsp { lsp_progress = false },

      status.component.treesitter(),
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
    }

    -- return the final configuration table
    return opts
  end,
}
