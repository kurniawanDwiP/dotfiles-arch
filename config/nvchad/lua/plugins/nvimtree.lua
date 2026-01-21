return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require "nvim-tree.api"

    -- helper
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    -- l → open file / expand folder
    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- folder
        api.node.open.edit()
      else
        -- file
        api.node.open.edit()
      end
    end

    -- L → vsplit preview, keep focus on tree
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        api.node.open.edit()
      else
        api.node.open.vertical()
      end

      api.tree.focus()
    end

    require("nvim-tree").setup {
      on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)

        local function bufopts(desc)
          return vim.tbl_extend("force", opts(desc), { buffer = bufnr })
        end

        -- h j k l navigation
        vim.keymap.set("n", "l", edit_or_open, bufopts "Edit or Open")
        vim.keymap.set("n", "L", vsplit_preview, bufopts "Vsplit Preview")
        vim.keymap.set("n", "h", api.node.navigate.parent_close, bufopts "Close Folder")
      end,
    }
  end,
}
