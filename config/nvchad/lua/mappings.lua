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
end, { desc = "move to next buffer" })
map({ "n" }, "H", function()
    require("nvchad.tabufline").prev()
end, { desc = "move to next buffer" })

map({ "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux down" })
map({ "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux up" })
map({ "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux left" })
map(
    { "n", "t" },
    "<c-l>",
    "<cmd>TmuxNavigateRight<cr>",
    { desc = "tmux right" }
)
map(
    "n",
    "<leader> ",
    "<cmd>Telescope find_files<cr>",
    { desc = "Telescope find files" }
)
--- del keymap
del({ "n" }, "<leader>ds")
del({ "n" }, "<leader>ma")
del({ "n" }, "<leader>rn")
del({ "n" }, "<leader>pt")
del({ "n" }, "<leader>cm")
del({ "n" }, "<leader>th")
