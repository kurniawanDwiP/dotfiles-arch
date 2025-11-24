return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = "custom",
        layouts = {
          custom = {
            layout = {
              box = "vertical",
              backdrop = false,
              row = -1,
              width = 0,
              height = 0.2,
              border = "none",
              title = " {title} {live} {flags}",
              title_pos = "left",
              {
                box = "horizontal",
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", width = 0.6, border = "left" },
              },
              { win = "input", height = 1, border = "bottom" },
            },
          },
        },
        source = {
          grep = {},
        },
      },
    },
  },
}
