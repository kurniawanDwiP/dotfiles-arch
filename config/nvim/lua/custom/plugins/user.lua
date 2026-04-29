return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    opts = {
      bold = true, -- enable bold fonts
      italics = true, -- enable italics
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      background = { -- map the value of 'background' option to a theme
        dark = "mist", -- try "zen", "mist" or "pearl" !
        light = "zen", -- try "zen", "mist" or "ink" !
      },
      foreground = "default", -- "default" or "saturated" (can also be a table like background)
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "LazyVim/LazyVim", opts = {
    colorscheme = "kanso-mist",
  } },
}
