local function gh(user, repo, opts)
	opts = opts or {}
	opts.src = string.format("https://github.com/%s/%s", user, repo)
	return vim.pack.add({ opts })
end

gh("nvim-mini", "mini.pairs", {})
require("mini.pairs").setup()
