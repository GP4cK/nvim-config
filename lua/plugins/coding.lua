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
}
