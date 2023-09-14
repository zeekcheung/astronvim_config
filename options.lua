-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    swapfile = false,
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = false, -- disable notifications when toggling UI elements
    resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    inlay_hints_enabled = true, -- enable inlay hints
    tpipeline_autoembed = 1, -- enable tpipeline_autoembed
    noice_enable = true, -- enable noice.nvim
    indent_blankline_highlight = false, -- disable indent blankline hightlight
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { "b", "s" } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--   local_vim.opt.relativenumber = true -- sets vim.opt.relativenumber
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--   local_vim.opt.number = true -- sets vim.opt.number
--   local_vim.opt.spell = false -- sets vim.opt.spell
--   local_vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
--   local_vim.opt.wrap = false -- sets vim.opt.wrap
--   local_vim.opt.swapfile = false
--   local_vim.opt.list = true
--   local_vim.opt.listchars = { space = "⋅", eol = "eol:↴" }

--   local_vim.g.mapleader = " " -- sets vim.g.mapleader
--   local_vim.g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
--   local_vim.g.cmp_enabled = true -- enable completion at start
--   local_vim.g.autopairs_enabled = true -- enable autopairs at start
--   local_vim.g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
--   local_vim.g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
--   local_vim.g.gui_notifications_enabled = false -- disable notifications when toggling UI elements
--   local_vim.g.resession_enabled = true -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
--   local_vim.g.inlay_hints_enabled = true -- disable inlay hints
--   local_vim.g.tpipeline_autoembed = 1
--   local_vim.g.noice_enable = true

--   return local_vim
-- end
