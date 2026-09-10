return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
      keymap = {
        preset = "super-tab",
      },
    },
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "nvim-treesitter/nvim-treesitter-context", -- [c to jump to context
    event = "VeryLazy",
    opts = {
      enable = true, -- enable this plugin (true/false)
      max_lines = 3, -- how many lines the context window should show (0 = unlimited)
      trim_scope = "outer", -- which context lines to discard if max_lines is exceeded
      mode = "cursor", -- line used to calculate context (cursor|topline)
      multiline_threshold = 20, -- max number of lines for a single context
      zindex = 20, -- priority of the context window
    },
  },
  {
    "fredrikaverpil/pr.nvim",
    lazy = true,
    version = "*",
    opts = {},
    keys = {
      {
        "<leader>gv",
        function()
          require("pr").view()
        end,
        desc = "View PR in browser",
      },
    },
    cmd = { "PRView" },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    -- `keys` is a lazy.nvim spec field, not a flash option: it must stay outside `opts`.
    keys = {
      { "S", mode = { "x" }, false },
    },
    ---@module 'flash'
    opts = {
      jump = {
        autojump = true,
      },
    },
  },
  {
    "axelvc/template-string.nvim",
    opts = {
      remove_template_string = true,
    },
  },
}
