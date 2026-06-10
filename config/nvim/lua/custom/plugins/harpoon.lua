return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "harpoon",
        callback = function(args)
          local bufnr = args.buf
          for i = 1, 9 do
            vim.keymap.set("n", tostring(i), function()
              vim.api.nvim_win_set_cursor(0, { i, 0 })
              harpoon.ui:select_menu_item(harpoon:list())
            end, { buffer = bufnr, silent = true, desc = "Harpoon select " .. i })
          end
        end,
      })
    end,
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>ha",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
}
