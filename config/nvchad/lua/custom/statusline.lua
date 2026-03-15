-- ~/.config/nvchad/lua/custom/statusline.lua

local colors = dofile(vim.g.base46_cache .. "colors")

-- ============================================================================
-- Cache & Constants
-- ============================================================================
local separators = {
  left = "",
  right = "",
  fill = "█",
  soft_left = "",
  soft_left_alt = "◥",
  soft_right = "",
  soft_right_alt = "",
}

local mode_map = {
  n = "󰊠 ",
  i = " ",
  R = " ",
  v = " ",
  V = " L",
  [""] = " B",
  c = " ",
  t = " ",
}

local icon_map = {
  modified = "  ",
  readonly = "  ",
  no_repo = " no repo",
  diagnostics = "󰞇 ",
  lsp = "",
  clock = "",
  file = "󰈤",
  column = "",
}

-- ============================================================================
-- Buffer Helpers
-- ============================================================================
function _G.stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

-- ============================================================================
-- Clock with optimization
-- ============================================================================
vim.g.current_time = os.date "%H:%M"
local clock_timer = nil

local function update_clock()
  vim.g.current_time = os.date "%H:%M"
  vim.cmd "redrawstatus"
end

if vim.o.laststatus == 2 or vim.o.laststatus == 3 then
  clock_timer = vim.loop.new_timer()
  clock_timer:start(0, 1000, vim.schedule_wrap(update_clock))
end

function _G.get_clock()
  return " " .. icon_map.clock .. " " .. vim.g.current_time .. " "
end

-- ============================================================================
-- Highlights
-- ============================================================================
local highlights = {
  Normal = { fg = "#f4f4f4", bg = colors.one_bg },
  Separator = { fg = colors.one_bg, bg = colors.black },
  Separator2 = { fg = colors.black, bg = colors.one_bg },
  ModeText = { fg = "#956dca", bg = colors.one_bg },
  PathText = { fg = "#956dca", bg = colors.one_bg },
  FileText = { fg = "#f4f3ee", bg = colors.one_bg },
  FileType = { fg = "#69bfce", bg = colors.one_bg },
  BranchName = { fg = "#e37e4f", bg = colors.one_bg },
  LineText = { fg = "#e34f4f", bg = colors.one_bg },
  ColumnText = { fg = "#5679e3", bg = colors.one_bg },
  PercentageText = { fg = "#5599e2", bg = colors.one_bg },
  TotalLineText = { fg = "#956dca", bg = colors.one_bg },
  DiagnosticsText = { fg = "#67b0e8", bg = colors.one_bg },
  LSPColor = { fg = "#8ccf7e", bg = colors.one_bg },

  DiagError = { fg = "#e06c75", bg = colors.one_bg },
  DiagWarn = { fg = "#e5c07b", bg = colors.one_bg },
  DiagInfo = { fg = "#61afef", bg = colors.one_bg },
  DiagHint = { fg = "#98c379", bg = colors.one_bg },
  ClockText = { fg = colors.red, bg = colors.one_bg },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- ============================================================================
-- Mode-based color management
-- ============================================================================
local last_mode = ""
local color_map = {
  n = {
    mode = { fg = "#5599e2" },
    sep = { bg = "#5599e2" },
    sep_left = { fg = "#5599e2" },
  },
  i = {
    mode = { fg = "#e34f4f" },
    sep = { bg = "#e34f4f" },
    sep_left = { fg = "#e34f4f" },
  },
  R = {
    mode = { fg = "#e34f4f" },
    sep = { bg = "#e34f4f" },
    sep_left = { fg = "#e34f4f" },
  },
  v = {
    mode = { fg = "#e37e4f" },
    sep = { bg = "#e37e4f" },
    sep_left = { fg = "#e37e4f" },
  },
  V = {
    mode = { fg = "#e37e4f" },
    sep = { bg = "#e37e4f" },
    sep_left = { fg = "#e37e4f" },
  },
  ["\22"] = {
    mode = { fg = "#e37e4f" },
    sep = { bg = "#e37e4f" },
    sep_left = { fg = "#e37e4f" },
  },
  c = {
    mode = { fg = "#5679e3" },
    sep = { bg = "#5679e3" },
    sep_left = { fg = "#5679e3" },
  },
  t = {
    mode = { fg = "#5679e3" },
    sep = { bg = "#5679e3" },
    sep_left = { fg = "#5679e3" },
  },
}

local function update_mode_highlights(mode)
  local colors_for_mode = color_map[mode]
  if not colors_for_mode then
    return
  end

  vim.api.nvim_set_hl(
    0,
    "ModeText",
    { fg = colors_for_mode.mode.fg, bg = colors.one_bg }
  )
  vim.api.nvim_set_hl(
    0,
    "SeparatorMode",
    { fg = colors.one_bg, bg = colors_for_mode.sep.bg }
  )
  vim.api.nvim_set_hl(
    0,
    "SeparatorModeLeft",
    { fg = colors_for_mode.sep_left.fg, bg = colors.black }
  )
end

function _G.RecolorByMode()
  local mode = vim.fn.mode()
  if mode == last_mode then
    return ""
  end
  last_mode = mode
  update_mode_highlights(mode)
  return ""
end

-- ============================================================================
-- Mode text
-- ============================================================================
function _G.GetModeText()
  local mode = vim.fn.mode()
  return mode_map[mode] or (" " .. mode .. " ")
end

-- ============================================================================
-- File info with caching
-- ============================================================================
local last_file_info =
  { bufnr = -1, name = "", icon = "", modified = false, readonly = false }

function _G.file()
  local bufnr = _G.stbufnr()
  local path = vim.api.nvim_buf_get_name(bufnr)
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

  if last_file_info.bufnr == bufnr and last_file_info.name == name then
    return " "
      .. last_file_info.icon
      .. " "
      .. last_file_info.name
      .. (last_file_info.modified and icon_map.modified or "")
      .. (last_file_info.readonly and icon_map.readonly or "")
  end

  local icon = icon_map.file
  if name ~= "Empty" then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    if devicons_present then
      local ft_icon = devicons.get_icon(name)
      icon = (ft_icon ~= nil and ft_icon) or icon
    end
  end

  last_file_info = {
    bufnr = bufnr,
    name = name,
    icon = icon,
    modified = vim.bo[bufnr].modified,
    readonly = vim.bo[bufnr].readonly,
  }

  return " "
    .. icon
    .. " "
    .. name
    .. (last_file_info.modified and icon_map.modified or "")
    .. (last_file_info.readonly and icon_map.readonly or "")
end

-- ============================================================================
-- Git info with error handling
-- ============================================================================
function _G.git()
  local bufnr = _G.stbufnr()

  local ok, git_data = pcall(function()
    return {
      head = vim.b[bufnr].gitsigns_head,
      status = vim.b[bufnr].gitsigns_status_dict,
    }
  end)

  if not ok or not git_data.head or not git_data.status then
    return icon_map.no_repo
  end

  local git_status = git_data.status
  local parts = { " " .. (git_status.head or "unknown") }

  if git_status.added and git_status.added ~= 0 then
    table.insert(parts, "  " .. git_status.added)
  end
  if git_status.changed and git_status.changed ~= 0 then
    table.insert(parts, "  " .. git_status.changed)
  end
  if git_status.removed and git_status.removed ~= 0 then
    table.insert(parts, "  " .. git_status.removed)
  end

  return " " .. table.concat(parts, "") .. " "
end

-- ============================================================================
-- Diagnostics - PERBAIKAN
-- ============================================================================
function _G.diagnostics_color()
  if not rawget(vim, "lsp") then
    return ""
  end

  local bufnr = _G.stbufnr()
  local diagnostics = {
    err = #vim.diagnostic.get(
      bufnr,
      { severity = vim.diagnostic.severity.ERROR }
    ),
    warn = #vim.diagnostic.get(
      bufnr,
      { severity = vim.diagnostic.severity.WARN }
    ),
    info = #vim.diagnostic.get(
      bufnr,
      { severity = vim.diagnostic.severity.INFO }
    ),
    hint = #vim.diagnostic.get(
      bufnr,
      { severity = vim.diagnostic.severity.HINT }
    ),
  }

  -- Jika tidak ada diagnostics, kembalikan string kosong
  if
    diagnostics.err == 0
    and diagnostics.warn == 0
    and diagnostics.info == 0
    and diagnostics.hint == 0
  then
    return "%#FileType#" .. icon_map.diagnostics
  end

  local parts = {}
  if diagnostics.err > 0 then
    table.insert(parts, "%#DiagError# " .. diagnostics.err .. " %*")
  end
  if diagnostics.warn > 0 then
    table.insert(parts, "%#DiagWarn# " .. diagnostics.warn .. " %*")
  end
  if diagnostics.info > 0 then
    table.insert(parts, "%#DiagInfo#󰋼 " .. diagnostics.info .. " %*")
  end
  if diagnostics.hint > 0 then
    table.insert(parts, "%#DiagHint#󰛩 " .. diagnostics.hint .. " %*")
  end

  return table.concat(parts, " ")
end

-- ============================================================================
-- LSP info - PERBAIKAN
-- ============================================================================
function _G.lsp()
  if vim.o.columns < 80 then
    return ""
  end

  if rawget(vim, "lsp") then
    local bufnr = _G.stbufnr()
    local clients = vim.lsp.get_clients { bufnr = bufnr }
    if #clients > 0 then
      -- Ambil nama client pertama
      local client_name = clients[1].name
      if vim.o.columns > 100 then
        return "%#LSPColor# " .. icon_map.lsp .. " " .. client_name .. " %*"
      else
        return "%#LSPColor# " .. icon_map.lsp .. "  LSP %*"
      end
    end
  end
  return ""
end

-- ============================================================================
-- Column display
-- ============================================================================
function _G.HandleColumnGap()
  return icon_map.column .. " "
end

-- ============================================================================
-- Path display
-- ============================================================================
function _G.GetPath()
  local path = vim.fn.expand "%:p:h:t"
  return path ~= "" and path or ""
end

-- ============================================================================
-- Helper function to check if buffer has diagnostics
-- ============================================================================
function _G.has_diagnostics()
  if not rawget(vim, "lsp") then
    return false
  end
  local bufnr = _G.stbufnr()
  return #vim.diagnostic.get(bufnr) > 0
end

-- ============================================================================
-- Helper function to check if buffer has LSP
-- ============================================================================
function _G.has_lsp()
  if not rawget(vim, "lsp") then
    return false
  end
  local bufnr = _G.stbufnr()
  return #vim.lsp.get_clients { bufnr = bufnr } > 0
end

-- ============================================================================
-- Build statusline
-- ============================================================================
function _G.build_statusline()
  local components = {
    -- Panggil fungsi recolor dulu
    "%{v:lua.RecolorByMode()}",

    -- Mode section
    "%#SeparatorModeLeft# "
      .. separators.left
      .. separators.fill,
    "%#SeparatorMode#%{v:lua.GetModeText()}",
    "%#SeparatorModeLeft#" .. separators.fill .. separators.soft_right_alt,

    -- Clock section
    "%#Separator#" .. separators.soft_left,
    "%#ClockText#%{v:lua.get_clock()}",
    "%#Separator#" .. separators.soft_right_alt,

    -- Path section
    "%#Separator#"
      .. separators.soft_left
      .. separators.fill,
    "%#PathText#%{v:lua.GetPath()}",
    "%#Separator#" .. separators.fill .. separators.soft_right_alt,
  }

  -- Diagnostics section - hanya ditambahkan jika ada diagnostics
  local diag_text = _G.diagnostics_color()
  if diag_text ~= "" then
    table.insert(
      components,
      "%#Separator#" .. separators.soft_left .. separators.fill
    )
    table.insert(components, diag_text)
    table.insert(components, "%#Separator#" .. separators.right)
  end

  -- Spacer
  table.insert(components, "%=")

  -- File info section
  table.insert(components, "%#Separator#" .. separators.left)
  table.insert(components, "%#FileType#%{v:lua.file()}")
  table.insert(
    components,
    "%#Separator#" .. separators.fill .. separators.soft_right
  )

  -- Git section
  table.insert(
    components,
    "%#Separator#" .. separators.soft_left_alt .. separators.fill
  )
  table.insert(components, "%#BranchName#%{v:lua.git()}")
  table.insert(
    components,
    "%#Separator#" .. separators.fill .. separators.soft_right
  )

  -- LSP section - hanya ditambahkan jika ada LSP
  local lsp_text = _G.lsp()
  if lsp_text ~= "" then
    table.insert(
      components,
      "%#Separator#" .. separators.soft_left_alt .. separators.fill
    )
    table.insert(components, lsp_text)
  end

  -- Column section - dengan separator conditional
  if _G.has_lsp() then
    table.insert(components, "%#Separator#" .. separators.fill)
  end

  table.insert(components, "%#BranchName#%{v:lua.HandleColumnGap()}")
  table.insert(components, "%#ColumnText#%2c")

  table.insert(components, "%#Separator2#")
  table.insert(
    components,
    "%#Separator#" .. separators.fill .. separators.soft_right
  )

  -- Percentage section
  table.insert(
    components,
    "%#Separator#" .. separators.soft_left_alt .. separators.fill
  )
  table.insert(components, "%#PercentageText#%p%%")
  table.insert(components, "%#Separator#" .. separators.fill)

  -- Total lines section
  table.insert(components, "%#Separator2#  ")
  table.insert(components, "%#Separator#" .. separators.fill)
  table.insert(components, "%#TotalLineText#%L")
  table.insert(
    components,
    "%#Separator#" .. separators.fill .. separators.right .. " "
  )

  return table.concat(components)
end

-- ============================================================================
-- Set statusline
-- ============================================================================
vim.opt.statusline = "%!v:lua.build_statusline()"

-- ============================================================================
-- Cleanup
-- ============================================================================
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if clock_timer then
      clock_timer:stop()
      clock_timer:close()
    end
  end,
})
