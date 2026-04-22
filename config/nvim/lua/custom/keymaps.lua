local map = vim.keymap.set

map("i", "hh", "<ESC>")
map("i", "jk", "<C-o>")
map({ "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux down" })
map({ "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux up" })
map({ "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux left" })
map({ "n", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux right" })
map({ "n", "i" }, "<c-e>", "<cmd>Neotree toggle<cr>")
map({ "n", "i" }, "<c-f>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (cwd)" })
