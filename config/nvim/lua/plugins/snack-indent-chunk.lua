return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config,
    opts = {
      ---@class snacks.indent.Config
      ---@field enabled? boolean
      indent = {
        indent = {
          enabled = true,
          char = "│",
        },
        chunk = {
          enabled = true,
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
