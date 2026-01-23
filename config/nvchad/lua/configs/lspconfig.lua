require("nvchad.configs.lspconfig").defaults()

vim.lsp.config.vtsls = {
  -- explicitly add default filetypes, so that we can extend
  -- them in related extras
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
  },
}

-- local servers = { "html", "cssls", "vtsls", "tailwindcss", "harper_ls" }
-- vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
