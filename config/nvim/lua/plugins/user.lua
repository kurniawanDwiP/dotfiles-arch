return {
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {
      border = true,
      size = { h = 60, w = 70 },

      -- to use, make this func(buf)
      mappings = { sidebar = nil, term = nil },

      -- Default sets of terminals you'd like to open
      terminals = {
        { name = "Terminal" },
        -- cmd can be function too
        { name = "Terminal", cmd = "neofetch" },
        -- More terminals
      },
    },
    cmd = "FloatermToggle",
  },
  {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    cmd = "TimerlyToggle",
    opts = {}, -- optional
  },
}
