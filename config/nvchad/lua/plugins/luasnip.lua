return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = "make install_jsregexp",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip").filetype_extend("javascriptreact", { "javascript" })
          require("luasnip").filetype_extend("typescript", { "javascript" })
          require("luasnip").filetype_extend("typescriptreact", { "javascript" })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
}
