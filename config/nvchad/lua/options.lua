require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local o = vim.o
o.relativenumber = true

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
-- vim.opt.columns = 80
vim.opt.wrap = true
vim.opt.tabstop = 4 -- tampilan tab = 4 spasi
vim.opt.shiftwidth = 4 -- indent (>>, <<, autoindent) = 4
vim.opt.softtabstop = 4 -- jumlah spasi saat tekan <Tab>
vim.opt.expandtab = true -- tab jadi spasi
