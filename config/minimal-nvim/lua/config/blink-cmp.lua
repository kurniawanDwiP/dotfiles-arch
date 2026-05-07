github("L3MON4D3/LuaSnip")
github("rafamadriz/friendly-snippets")
require("luasnip.loaders.from_vscode").lazy_load()
vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
require("blink-cmp").build():wait(60000)
require("blink-cmp").setup({
	keymap = { preset = "enter" },
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = {
				border = "single",
			},
		},
		menu = {
			border = "single",
			scrollbar = false,
			draw = {
				columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
			},
		},
		accept = {
			auto_brackets = { enabled = true },
		},
	},
	snippets = { preset = "luasnip" },
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
		providers = {
			snippets = {
				opts = {
					friendly_snippets = true,
				},
			},
		},
	},
	fuzzy = { implementation = "rust" },
})
