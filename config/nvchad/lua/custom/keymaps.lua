local map = vim.keymap.set
local wk = require "which-key"
wk.add {
  --- window
  { "<leader>w", proxy = "<C-w>", group = "window" },
  { "<C-h>", "<C-w>h", desc = "switch window left", mode = "n", hidden = true },
  { "<C-l>", "<C-w>l", desc = "switch window right", mode = "n", hidden = true },
  { "<C-j>", "<C-w>j", desc = "switch window down", mode = "n", hidden = true },
  { "<C-k>", "<C-w>k", desc = "switch window up", mode = "n", hidden = true },

  --- terminal
  -- { "<leader>t", group = "terminal" },
  -- {
  --   "<leader>th",
  --   function()
  --     require("nvchad.term").new { pos = "sp" }
  --   end,
  --   desc = "new horizontal terminal",
  --   mode = "n",
  -- },
  -- {
  --   "<leader>tv",
  --   function()
  --     require("nvchad.term").new { pos = "vsp" }
  --   end,
  --   desc = "new vertical terminal",
  --   mode = "n",
  -- },
  -- {
  --   "<leader>tf",
  --   function()
  --     require("nvchad.term").new { pos = "float" }
  --   end,
  --   desc = "new floating terminal",
  --   mode = "n",
  -- },
  -- {
  --   "<A-v>",
  --   function()
  --     require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
  --   end,
  --   desc = "toggle vertical terminal",
  --   mode = { "n", "t" },
  --   hidden = true,
  -- },
  -- {
  --   "<A-h>",
  --   function()
  --     require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  --   end,
  --   desc = "toggle horizontal terminal",
  --   mode = { "n", "t" },
  --   hidden = true,
  -- },
  -- {
  --   "<A-i>",
  --   function()
  --     require("nvchad.term").toggle { pos = "float", id = "htoggleTerm" }
  --   end,
  --   desc = "toggle floating terminal",
  --   mode = { "n", "t" },
  --   hidden = true,
  -- },
  -- { "<C-x>", "<C-\\><C-N>", desc = "terminal escape terminal mode", mode = "t", hidden = true },

  --- telescope
  { "<leader>f", group = "find/files", mode = { "n", "v" } },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "telescope find files", mode = "n" },
  { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "telescope live grep", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "telescope find buffers", mode = "n" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "telescope find help", mode = "n" },
  { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "telescope find marks", mode = "n" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "telescope find oldfiles", mode = "n" },
  {
    "<leader>fz",
    "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    desc = "telescope find in current buffer",
    mode = "n",
  },
  { "<leader>fe", "<cmd>Telescope terms<cr>", desc = "telescope find hidden terminal", mode = "n" },
  {
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
    desc = "telescope find all files",
    mode = "n",
  },
  {
    "<leader>fd",
    function()
      require("telescope.builtin").lsp_document_symbols {
        symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
      }
    end,
    desc = "telescope document symbols",
    mode = "n",
  },
  {
    "<leader>ft",
    "<cmd>TodoTelescope<CR>",
    desc = "telescope todo",
    mode = "n",
  },
  {
    "<leader>fs",
    function()
      require("rip-substitute").sub()
    end,
    mode = { "n", "x" },
    desc = "search & replace",
  },

  --- git
  { "<leader>g", group = "git" },
  { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit", mode = "n" },
  { "<leader>gm", "<cmd>Telescope git_commits<cr>", desc = "telescope git commits", mode = "n" },
  { "<leader>gt", "<cmd>Telescope git_status<cr>", desc = "telescope git status", mode = "n" },

  --- ui
  { "<leader>u", group = "ui" },
  { "<leader>un", "<cmd>nu!<cr>", desc = "toogle line number", mode = "n" },
  { "<leader>ur", "<cmd>nu!<cr>", desc = "toogle relative line number", mode = "n" },
  {
    "<leader>ut",
    function()
      require("nvchad.themes").open()
    end,
    desc = "nvchad themes",
    mode = "n",
  },
  { "<leader>uc", "<cmd>NvCheatsheet<cr>", desc = "nvcheatsheet", mode = "n" },
  {
    "<leader>uk",
    function()
      vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
    end,
    desc = "whichkey query lookup",
    mode = "n",
  },
  { "<leader>uK", "<cmd>WhichKey <cr>", desc = "whichkey all keymaps", mode = "n" },

  -- code
  { "<leader>c", group = "code" },
  {
    "<leader>cd",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "diagnostics",
    mode = "n",
  },

  -- {
  --   "<leader>ca",
  --   vim.lsp.buf.code_action,
  --   desc = "lsp code action",
  --   mode = "n",
  -- },
  -- {
  --   "<leader>cr",
  --   function()
  --     require "nvui.lsp.renamer"()
  --   end,
  --   desc = "lsp variable renamer",
  --   mode = "n",
  -- },

  --- utils-surround
  { "<leader>s", group = "surround", icon = {
    icon = " ",
    color = "purple",
  }, mode = { "n", "v" } },
  { "<leader>l", group = "lsp", desc = "file" },
  { "<leader>ra", hidden = true },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    wk.add {
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
        buffer = buf,
      },

      {
        "<leader>cr",
        require "nvchad.lsp.renamer",
        desc = "Rename (NvRenamer)",
        buffer = buf,
      },

      {
        "<leader>cf",
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = "Format",
        buffer = buf,
      },
      {
        "<leader>a",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
        end,
        desc = "LSP swap param next",
        mode = "n",
      },
      {
        "<leader>A",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
        end,
        desc = "LSP swap param prev",
        mode = "n",
      },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action { context = { only = { "source" }, diagnostics = {} } }
        end,
        desc = "lsp source action",
        mode = "n",
      },
    }
  end,
})

if require("nvconfig").ui.tabufline.enabled then
  local wb = require "which-key"
  wb.add {
    {
      "<leader>b",
      group = "buffer",
      expand = function()
        return require("which-key.extras").expand.buf()
      end,
    },
    { "<leader>bn", "<cmd>enew<CR>", desc = "buffer new", mode = "n" },
    {
      "<leader>bw",
      function()
        require("nvchad.tabufline").next()
      end,
      desc = "buffer goto next",
      mode = "n",
    },
    {
      "<leader>bb",
      function()
        require("nvchad.tabufline").prev()
      end,
      desc = "buffer goto prev",
      mode = "n",
    },
    {
      "<leader>bx",
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      desc = "buffer close",
      mode = "n",
    },
  }
end

---lsp

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- global lsp mappings
-- map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
