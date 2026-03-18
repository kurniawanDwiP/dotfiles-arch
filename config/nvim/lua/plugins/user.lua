return {
  { "barrettruth/midnight.nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    opts = {
      bold = true, -- enable bold fonts
      italics = true, -- enable italics
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = {},
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      background = { -- map the value of 'background' option to a theme
        dark = "ink", -- try "zen", "mist" or "pearl" !
        light = "zen", -- try "zen", "mist" or "ink" !
      },
      foreground = "saturated", -- "default" or "saturated" (can also be a table like background)
      minimal = false,
    },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "high", -- "default" | "high"
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
