github("pwntester/octo.nvim")
require("octo").setup({
	enable_builtin = true,
	default_to_projects_v2 = false,
	default_merge_method = "squash",
	picker = "telescope",
	ssh_aliases = {
		["github.com-private"] = "github.com",
		["github.com-public"] = "github.com",
	},
})

local map = vim.keymap.set

map("n", "<leader>gi", "<cmd>Octo issue list<CR>", { desc = "List Issues (Octo)" })
map("n", "<leader>gI", "<cmd>Octo issue search<CR>", { desc = "Search Issues (Octo)" })
map("n", "<leader>gp", "<cmd>Octo pr list<CR>", { desc = "List PRs (Octo)" })
map("n", "<leader>gP", "<cmd>Octo pr search<CR>", { desc = "Search PRs (Octo)" })
map("n", "<leader>gr", "<cmd>Octo repo list<CR>", { desc = "List Repos (Octo)" })
map("n", "<leader>gS", "<cmd>Octo search<CR>", { desc = "Search (Octo)" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "octo",
	callback = function()
		local opts = { buffer = true, silent = true }

		map("n", "<localleader>a", "", { desc = "+assignee", buffer = true })
		map("n", "<localleader>c", "", { desc = "+comment/code", buffer = true })
		map("n", "<localleader>l", "", { desc = "+label", buffer = true })
		map("n", "<localleader>i", "", { desc = "+issue", buffer = true })
		map("n", "<localleader>r", "", { desc = "+react", buffer = true })
		map("n", "<localleader>p", "", { desc = "+pr", buffer = true })
		map("n", "<localleader>v", "", { desc = "+review", buffer = true })
		map("n", "<localleader>g", "", { desc = "+goto_issue", buffer = true })

		map("i", "@", "@<C-x><C-o>", opts)
		map("i", "#", "#<C-x><C-o>", opts)
	end,
})
