local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        ["typescript"] = { "prettier", lsp_format = "fallback" },
        ["javascript"] = { "prettier", lsp_format = "fallback" },
        ["html"] = { "prettier", lsp_format = "fallback" },
        ["css"] = { "prettier" },
        lsp_format = "fallback",
        ["markdown"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["svelte"] = { "prettier" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 300,
        lsp_fallback = true,
    },
}

return options
