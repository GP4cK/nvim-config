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
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
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
    ---@type Flash.Config
    opts = {
      jumps = {
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
