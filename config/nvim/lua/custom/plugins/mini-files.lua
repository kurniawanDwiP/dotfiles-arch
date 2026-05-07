return {
  {
    "nvim-mini/mini.files",
    version = false,
    enabled = true,
    config = function()
      require("mini.files").setup({
        mappings = {
          close = "q",
          go_in = "",
          go_in_plus = "<CR>",
          go_out = "",
          go_out_plus = "<BS>",
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
          width_focus = 30,
          width_nofocus = 15,
          width_preview = 40,
        },
        options = {
          permanent_delete = false,
        },
      })
    end,
  },
}
