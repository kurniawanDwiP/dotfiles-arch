github("folke/which-key.nvim")
require("which-key").setup({
	enabled = false,
	preset = "helix",
	icons = {
		group = "",
		separator = "|",
		mappings = false,
	},
})

local wk = require("which-key")
wk.add({
	{ "<leader>h", group = "[H]arpoon" },
	{ "<leader>f", group = "[F]ind [Telescope]" },
	{ "<leader>c", group = "[C]ode [Trouble]" },
	{ "<leader>g", group = "[G]it [Octo]" },
})
