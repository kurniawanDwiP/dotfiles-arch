require "nvchad.mappings"
require "custom.keymaps"
require "custom.treesitter-keymap"
-- local wk = require "which-key"
--
-- wk.add { "<leader>gg", "<cmd>LazyGit<cr>", desc = "lazygit", mode = "n", icon = " " }
-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<C-o>")
map({ "i" }, "jj", "<ESC>")
map({ "t" }, "jj", "<C-\\><C-n>")
del({ "n" }, "<leader>ds")
del({ "n" }, "<leader>ma")
del({ "n" }, "<leader>rn")
del({ "n" }, "<leader>pt")
-- map({ "n" }, "<C-p>", "<cmd>FloatermToggle<CR>", { silent = true })
-- map({ "i" }, "<C-p>", "<cmd>FloatermToggle<CR>", { silent = true })
-- map({ "n" }, "<leader>tt", "<cmd>TimerlyToggle<CR>", { silent = true, desc = "TimerlyToggle" })
-- map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })
-- map("n", "]t", function()
--   require("todo-comments").jump_next()
-- end, { desc = "Next todo comment" })
--
-- map("n", "[t", function()
--   require("todo-comments").jump_prev()
-- end, { desc = "Previous todo comment" })
--
-- -- You can also specify a list of valid jump keywords
--
-- map("n", "]t", function()
--   require("todo-comments").jump_next { keywords = { "ERROR", "WARNING", "FIX" } }
-- end, { desc = "Next error/warning todo comment" })
--
-- map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "telescope todo" })
-- map("n", "<leader>fd", function()
--   require("telescope.builtin").lsp_document_symbols {
--     symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
--   }
-- end, { desc = "telescope document symbols" })
--
-- map("n", "<leader>cd", function()
--   require("telescope.builtin").diagnostics()
-- end, { desc = "diagnostics" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
