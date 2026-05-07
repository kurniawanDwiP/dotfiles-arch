vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup({})

local map = vim.keymap.set

map("n", "<leader>cx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>cX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Trouble" })
map("n", "<leader>cL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
map("n", "<leader>cQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
