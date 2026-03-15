return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config,
    opts = {
      ---@class snacks.indent.config
      ---@field enabled? boolean
      indent = {
        indent = {
          enabled = true,
          char = "│",
        },
        chunk = {
          enabled = true,
          hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
          },
          char = {
            corner_top = "┌",
            corner_bottom = "└",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
      },
    },
  },
}
