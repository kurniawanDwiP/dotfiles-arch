return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      "rafamadriz/friendly-snippets",
    },
    build = function()
      require("blink.cmp").build():wait(60000)
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "enter" },
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = "single",
          },
        },
        menu = { border = "single", scrollbar = false },
        accept = {
          auto_brackets = { enabled = false },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "single",
        },
      },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "rust" },
    },
  },
}
