function _G.github(repo, opts)
	opts = opts or {}
	opts.src = string.format("https://github.com/%s", repo)
	return vim.pack.add({ opts })
end

require("config.options")

require("config.lsp")
require("config.blink-cmp")
require("config.mini-files")
require("config.mini-pairs")
require("config.treesitter")
require("config.harpoon")
require("config.conform")
require("config.snacks-indent")
require("config.telescope")
require("config.trouble")
require("config.gitsigns")
require("config.nvim-ts-autotag")
require("config.lualine")
require("config.whichkey")
require("config.flash")
require("config.noice")
require("config.octo")

require("config.keymaps")
require("config.autocmds")

vim.pack.add({ "https://github.com/AvengeMedia/base46" })
require("base46").setup()
vim.cmd.colorscheme("base46-kanagawa")
