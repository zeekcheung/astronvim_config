-- config neovide
if vim.g.neovide then require("user.utils.neovide").config() end

-- config pwsh
require("user.utils.pwsh").config()

-- config tsserver
-- require("user.utils.tsp-utils").config()

-- config rainbow-delimiters
require("user.utils.rainbow-delimiters").config()

-- config neo-tree
require("user.utils.neotree").config()
