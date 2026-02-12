require "nvchad.autocmds"
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    callback = function()
        vim.lsp.buf.code_action {
            apply = true,
            context = {
                only = { "source.organizeImports" },
                diagnostics = vim.diagnostic.get(
                    0,
                    { lnum = vim.fn.line "." - 1 }
                ),
            },
        }
    end,
})

--- Lua
vim.o.autowriteall = true
vim.api.nvim_create_autocmd(
    { "InsertLeavePre", "TextChanged", "TextChangedP" },
    {
        pattern = "*",
        callback = function()
            vim.cmd "silent! write"
        end,
    }
)
