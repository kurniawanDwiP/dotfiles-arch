require "nvchad.autocmds"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line "." - 1 }),
      },
    }
  end,
})
