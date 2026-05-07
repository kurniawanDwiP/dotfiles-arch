vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/theprimeagen/harpoon", version = "harpoon2" },
})
local harpoon = require("harpoon")
local map = vim.keymap.set

harpoon:setup()

map("n", "<leader>ha", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add to List" })

map("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu" })

for i = 1, 9 do
	map("n", "<leader>h" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Harpoon to File " .. i })
end
