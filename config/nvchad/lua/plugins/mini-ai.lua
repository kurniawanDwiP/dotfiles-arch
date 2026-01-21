return {
  {
    "nvim-mini/mini.ai",
    version = "*",
    lazy = false,
    enabled = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
}
