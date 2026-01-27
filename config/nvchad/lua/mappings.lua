require "nvchad.mappings"
require "custom.keymaps"
require "custom.treesitter-keymap"
require "custom.todo-keymaps"
-- local wk = require "which-key"
--
-- wk.add { "<leader>gg", "<cmd>LazyGit<cr>", desc = "lazygit", mode = "n", icon = " " }
-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del
map("i", "jk", "<C-o>")
map({ "i" }, "jj", "<ESC>")
map({ "n" }, "L", function()
  require("nvchad.tabufline").next()
end)
map({ "n" }, "H", function()
  require("nvchad.tabufline").prev()
end)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
--- del keymap
del({ "n" }, "<leader>ds")
del({ "n" }, "<leader>ma")
del({ "n" }, "<leader>rn")
del({ "n" }, "<leader>pt")
del({ "n" }, "<leader>cm")
