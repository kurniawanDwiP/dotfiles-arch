vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

configs.setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"bash",
		"python",
	},
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},
})
