return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["typescript"] = { "prettier", lsp_format = "fallback" },
        ["javascript"] = { "prettier", lsp_format = "fallback" },
        ["html"] = { "prettier", lsp_format = "fallback" },
        ["css"] = { "prettier" },
        lsp_format = "fallback",
        ["lua"] = { "stylua" },
        ["markdown"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["svelte"] = { "prettier" },
      },
    },
  },
}
