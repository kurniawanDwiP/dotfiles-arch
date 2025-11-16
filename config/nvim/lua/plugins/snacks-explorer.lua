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
            layout = "custom",
            layouts = {
              custom = {
                layout = {
                  backdrop = false,
                  width = 30,
                  min_width = 30,
                  height = 0,
                  title = "{title} {live} {flags}",
                  title_pos = "left",
                  position = "left",
                  border = "rounded",
                  box = "vertical",
                  { win = "list", border = "none" },
                  {
                    win = "input",
                    height = 1,
                    border = true,
                    title = "{title} {live} {flags}",
                    title_pos = "left",
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}
