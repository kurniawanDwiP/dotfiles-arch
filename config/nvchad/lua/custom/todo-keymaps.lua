local wk = require "which-key"
local function insert_tag(tag)
  local cs = vim.bo.commentstring
  if not cs or cs == "" then
    cs = "# %s"
  end
  local text = cs:gsub("%%s", tag .. ":")
  if text == cs then
    text = tag .. ":"
  end
  vim.api.nvim_feedkeys("O" .. text .. " ", "n", false)
end

vim.api.nvim_set_hl(0, "WKNoteIcon", { fg = "#fc9803" })
wk.add {
  {
    "<leader>i",
    group = "note",
    icon = {
      icon = " ",
      hl = "WKNoteIcon",
    },
  },
  {
    "<leader>it",
    function()
      insert_tag "TODO"
    end,
    desc = "insert todo",
  },
  {
    "<leader>in",
    function()
      insert_tag "NOTE"
    end,
    desc = "insert note",
  },
  {
    "<leader>if",
    function()
      insert_tag "FIX"
    end,
    desc = "insert fix",
  },
  {
    "<leader>iw",
    function()
      insert_tag "WARNING"
    end,
    desc = "insert warning",
  },
  {
    "<leader>ib",
    function()
      insert_tag "BUG"
    end,
    desc = "insert bug",
  },
}
