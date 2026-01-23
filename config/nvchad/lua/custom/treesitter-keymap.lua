local wk = require "which-key"

-- helpers ---------------------------------------------------------------
local select = function(capture, query)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(capture, query or "textobjects")
  end
end

local move = function(fn, capture, query)
  return function()
    require("nvim-treesitter-textobjects.move")[fn](capture, query or "textobjects")
  end
end

local swap = function(fn, capture)
  return function()
    require("nvim-treesitter-textobjects.swap")[fn](capture)
  end
end

-- select textobjects ----------------------------------------------------
wk.add {
  { "am", select "@function.outer", desc = "Function Outer", mode = { "x", "o" } },
  { "im", select "@function.inner", desc = "Function Inner", mode = { "x", "o" } },

  { "ac", select "@class.outer", desc = "Class Outer", mode = { "x", "o" } },
  { "ic", select "@class.inner", desc = "Class Inner", mode = { "x", "o" } },

  { "as", select("@local.scope", "locals"), desc = "Local Scope", mode = { "x", "o" } },

  { "aa", select "@parameter.outer", desc = "Parameter Outer", mode = { "x", "o" } },
  { "ia", select "@parameter.inner", desc = "Parameter Inner", mode = { "x", "o" } },
}

-- swap ------------------------------------------------------------------
wk.add {}

-- move (next) ------------------------------------------------------------
wk.add {
  { "]m", move("goto_next_start", "@function.outer"), desc = "Next Function Start", mode = { "n", "x", "o" } },
  { "]]", move("goto_next_start", "@class.outer"), desc = "Next Class Start", mode = { "n", "x", "o" } },

  {
    "]o",
    move("goto_next_start", { "@loop.inner", "@loop.outer" }),
    desc = "Next Loop Start",
    mode = { "n", "x", "o" },
  },

  { "]s", move("goto_next_start", "@local.scope", "locals"), desc = "Next Local Scope", mode = { "n", "x", "o" } },
  { "]z", move("goto_next_start", "@fold", "folds"), desc = "Next Fold", mode = { "n", "x", "o" } },

  { "]M", move("goto_next_end", "@function.outer"), desc = "Next Function End", mode = { "n", "x", "o" } },
  { "][", move("goto_next_end", "@class.outer"), desc = "Next Class End", mode = { "n", "x", "o" } },
}

-- move (previous) --------------------------------------------------------
wk.add {
  { "[m", move("goto_previous_start", "@function.outer"), desc = "Prev Function Start", mode = { "n", "x", "o" } },
  { "[[", move("goto_previous_start", "@class.outer"), desc = "Prev Class Start", mode = { "n", "x", "o" } },

  { "[M", move("goto_previous_end", "@function.outer"), desc = "Prev Function End", mode = { "n", "x", "o" } },
  { "[]", move("goto_previous_end", "@class.outer"), desc = "Prev Class End", mode = { "n", "x", "o" } },
}

-- conditional ------------------------------------------------------------
wk.add {
  { "]d", move("goto_next", "@conditional.outer"), desc = "Next Conditional", mode = { "n", "x", "o" } },
  { "[d", move("goto_previous", "@conditional.outer"), desc = "Prev Conditional", mode = { "n", "x", "o" } },
}

-- repeatable move --------------------------------------------------------
local repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

wk.add {
  { ";", repeat_move.repeat_last_move_next, desc = "Repeat Move Forward", mode = { "n", "x", "o" } },
  { ",", repeat_move.repeat_last_move_previous, desc = "Repeat Move Backward", mode = { "n", "x", "o" } },
  --
  -- { "f", repeat_move.builtin_f_expr, mode = { "n", "x", "o" }, expr = true },
  -- { "F", repeat_move.builtin_F_expr, mode = { "n", "x", "o" }, expr = true },
  -- { "t", repeat_move.builtin_t_expr, mode = { "n", "x", "o" }, expr = true },
  -- { "T", repeat_move.builtin_T_expr, mode = { "n", "x", "o" }, expr = true },
}

return true
