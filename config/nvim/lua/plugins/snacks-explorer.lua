return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            git_status = true,
            layout = {
              preset = "sidebar",
              layout = {
                position = "left",
                width = 30,
                min_width = 30,
              },
            },
          },
        },
      },
    },
  },
}
