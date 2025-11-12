return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    -- `main` is untested, please open a PR if you've confirmed it works as expected
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = {
        list = {
          selection = {
            preselect = function(ctx)
              return not require("blink.cmp").snippet_active({ direction = 1 })
            end,
          },
        },
        menu = {
          max_height = 8,
          border = "rounded",
          scrollbar = false,
          winblend = 100,
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          window = {
            border = "rounded",
            winblend = 100,
          },
        },
      },
      snippets = { preset = "luasnip" },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { "snippets", "lsp", "path" },
      },
    },
  },
}
