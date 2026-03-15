-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<ESC>")
map("i", "jk", "<C-o>")
map({ "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux down" })
map({ "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux up" })
map({ "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux left" })
map({ "n", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux right" })
map({ "n", "i" }, "<c-e>", "<cmd>Neotree toggle<cr>")
