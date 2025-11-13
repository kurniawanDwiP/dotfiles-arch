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
                  position = "left",
                  border = "none",
                  box = "vertical",
                  { win = "list", border = "rounded" },
                  {
                    win = "input",
                    height = 1,
                    border = true,
                    title = "{title} {live} {flags}",
                    title_pos = "center",
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
