return {
  { "barrettruth/midnight.nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = false, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
        custom = {
          saturation = "", -- "" | string representing an integer between 0 and 100
          light = "", -- "" | string representing an integer between 0 and 100
        },
      },
      ui = {
        borders = "none", -- "light" | "dark" | "none"
        aggressive_spell = false, -- true | false
      },
    },
  },
  { "LazyVim/LazyVim", opts = {
    colorscheme = "flow",
  } },
}
