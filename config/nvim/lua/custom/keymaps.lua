local map = vim.keymap.set
local minifiles = require("mini.files")
local minifiles_toggle = function()
  if not minifiles.close() then
    minifiles.open(vim.api.nvim_buf_get_name(0))
  end
end
local wk = require("which-key")
wk.add({
  { "<leader>h", group = "harpoon" },
})

map("i", "hh", "<ESC>")
map("i", "jk", "<C-o>")
map({ "n", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux down" })
map({ "n", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux up" })
map({ "n", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux left" })
map({ "n", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux right" })
map({ "n", "i" }, "<c-e>", function()
  minifiles_toggle()
end)
-- map({ "n", "i" }, "<c-f>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (cwd)" })
map({ "n", "x", "o" }, "gh", "^")
map({ "n", "x", "o" }, "gl", "$")
