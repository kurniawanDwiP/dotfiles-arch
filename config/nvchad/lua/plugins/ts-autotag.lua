return {
  -- Modify Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Add nvim-ts-autotag
      {
        "windwp/nvim-ts-autotag",

        config = function()
          require("nvim-ts-autotag").setup {
            opts = {
              enable_close = true,
              enable_rename = true,
              enable_close_on_slash = false,
            },
          }
        end,
      },
    },
    event = { "BufReadPre" },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "fish",
        "rust",
        "tsx",
        "html",
        "jsx",
      })
      return vim.tbl_deep_extend("force", opts, {
        autotag = {
          enable = true,
        },
      })
    end,
  },
}
