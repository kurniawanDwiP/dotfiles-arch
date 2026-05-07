local function gh(repo, opts)
	opts = opts or {}
	opts.src = string.format("https://github.com/%s", repo)
	return vim.pack.add({ opts })
end

gh("windwp/nvim-ts-autotag")
require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})
