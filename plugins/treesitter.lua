return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "prisma",
      "html",
      "css",
      "go",
      "c",
      "cpp",
      "rust",
      "sql",
      "yaml",
      "json",
      "toml",
      "dockerfile",
      "fish",
      "gitignore",
      "http",
      "bash",
      "markdown",
      "markdown_inline",
      "regex",
      "vim",
    })
  end,
}
