return {
  "rebelot/heirline.nvim",
  dependencies = { "Exafunction/codeium.vim" },
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    local status_utils = require "astronvim.utils.status.utils"
    local utils = require "astronvim.utils"
    local hl = require "astronvim.utils.status.hl"
    local is_available = utils.is_available

    local codeium_status_component = status.component.builder(status_utils.setup_providers({
      str = {
        str = "Codeium:" .. vim.fn["codeium#GetStatusString"](),
        icon = { kind = "DiagnosticHint", padding = { right = 1 } },
      },
      surround = {
        separator = "right",
        color = "treesitter_bg",
        condition = vim.fn["codeium#GetStatusString"]() == "ON",
      },
      hl = hl.get_attributes "treesitter",
      on_click = {
        name = "heirline_codeium",
        callback = function()
          local codeium_status = vim.fn["codeium#GetStatusString"]()
          local command = codeium_status == "ON" and "CodeiumDisable" or "CodeiumEnable"
          vim.api.nvim_command(command)

          vim.defer_fn(function() vim.cmd.redrawstatus() end, 2000)
        end,
      },
    }, { "str" }))

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info { filetype = {}, filename = false, file_modified = false },
      status.component.git_diff(),
      status.component.diagnostics {
        on_click = {
          name = "heirline_diagnostic",
          callback = function()
            if is_available "telescope.nvim" then
              vim.defer_fn(function() vim.api.nvim_command "Telescope diagnostics severity_bound=ERROR" end, 100)
            end
          end,
        },
      },

      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp { lsp_progress = false },

      status.component.treesitter(),
      codeium_status_component,
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
    }

    -- return the final configuration table
    return opts
  end,
}
