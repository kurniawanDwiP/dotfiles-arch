return {
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Grup semantic yang ingin ditebalkan
      local semantic_groups_to_bold = {
        -- "@lsp.type.type",
        -- "@lsp.type.class",
        -- "@lsp.type.interface",
        -- "@lsp.type.enum",
        -- "@lsp.type.struct",
        "@lsp.type.parameter",
        "@lsp.type.variable",
        -- "@lsp.type.property",
        "@lsp.type.function",
        "@lsp.type.method",
        -- "@lsp.type.namespace",
      }

      -- Grup string yang ingin dibuat italic
      local string_groups_to_italic = {
        "@string",
        "@string.regex",
        "@string.escape",
        "@string.special",
      }

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("CustomSemanticHighlight", { clear = true }),
        callback = function()
          -- Bold untuk semantic groups
          for _, group in ipairs(semantic_groups_to_bold) do
            local current_hl = vim.api.nvim_get_hl(0, { name = group, link = false }) or {}
            vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", current_hl, { bold = true }))
          end

          -- Italic untuk string groups
          for _, group in ipairs(string_groups_to_italic) do
            local current_hl = vim.api.nvim_get_hl(0, { name = group, link = false }) or {}
            vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", current_hl, { italic = true }))
          end
        end,
      })
    end,
  },
}
