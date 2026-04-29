return {
  {
    "nvim-mini/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({
        mappings = {
          close = "q",
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "<BS>",
          go_out_plus = "H",
          mark_goto = "'",
          mark_set = "m",
          reset = "<esc>",
          reveal_cwd = "@",
          show_help = "g?",
          synchronize = "<C-s>",
          trim_left = "<",
          trim_right = ">",
        },
        windows = {
          preview = true,
          width_focus = 20,
          width_nofocus = 20,
          width_preview = 40,
        },
      })
    end,
  },
}
