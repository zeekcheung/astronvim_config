return {
  "rcarriga/nvim-notify",
  opts = {
    top_down = false, -- show notifications at the top or bottom of the screen
    stages = "slide",
    timeout = 2000,
    max_height = function() return math.floor(vim.o.lines * 0.75) end,
    max_width = function() return math.floor(vim.o.columns * 0.75) end,
  },
}
