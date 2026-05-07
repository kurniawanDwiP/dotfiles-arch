github("MunifTanjim/nui.nvim")
github("rcarriga/nvim-notify")
github("folke/noice.nvim")
require("noice").setup({
	views = {
		cmdline_popup = {
			border = {
				style = "single",
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
	lsp = {
		signature = {
			enabled = false,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				any = {
					{ find = "written" },
					{ find = "%d+L, %d+B" },
				},
			},
			opts = { view = "notify", skip = false },
		},
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
-- Set nvim-notify sebagai default notify Neovim
vim.notify = require("notify")

-- Opsional: Konfigurasi tampilan toast agar lebih ramping
require("notify").setup({
	stages = "static", -- atau "fade"/"slide" untuk animasi
	timeout = 2000, -- toast hilang dalam 2 detik
	render = "compact", -- tampilan lebih kecil agar tidak mengganggu coding
})
