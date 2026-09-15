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
        autojump = false,
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)

      local function set_label_highlight()
        vim.api.nvim_set_hl(0, "FlashLabel", {
          bg = "#ed8796", -- Catppuccin Macchiato red
          fg = "#24273a", -- Catppuccin Macchiato base
          bold = true,
        })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("flash_label_highlight", { clear = true }),
        callback = set_label_highlight,
      })
      set_label_highlight()
    end,
  },
  {
    "axelvc/template-string.nvim",
    opts = {
      remove_template_string = true,
    },
  },
  {
    "ChmaraX/herdr-nvim",
    opts = {
      prefix = "<leader>h",
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
    -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
    -- spec defers loading until a <leader>a* mapping is pressed and the commands
    -- would not exist yet.
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
      "ClaudeCodeTreeAdd",
      "ClaudeCodeStatus",
      "ClaudeCodeStart",
      "ClaudeCodeStop",
      "ClaudeCodeOpen",
      "ClaudeCodeClose",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
      "ClaudeCodeCloseAllDiffs",
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
