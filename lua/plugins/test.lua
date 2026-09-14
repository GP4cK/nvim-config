return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- Temporary fix: ensure treesitter module is loaded before neotest
      -- https://github.com/nvim-neotest/neotest/issues/527#issuecomment-3172813483
      -- Remove when this gets merged and try to run a jest test
      -- https://github.com/neovim/neovim/pull/35195
      pcall(vim.treesitter.get_parser)
      local neotest = require("neotest")
      local adapters = {}

      -- Conditionally register adapters
      if vim.fn.filereadable("jest.config.js") == 1 or vim.fn.filereadable("jest.config.ts") == 1 then
        table.insert(
          adapters,
          require("neotest-jest")({
            -- Resolve the config without vim.fn.glob(), which neotest-jest calls
            -- in a fast event context and which then fails with E5560.
            jestConfigFile = function()
              local cwd = vim.uv.cwd()
              local ts = cwd .. "/jest.config.ts"

              return vim.uv.fs_stat(ts) and ts or cwd .. "/jest.config.js"
            end,
            env = { NODE_OPTIONS = "--experimental-vm-modules" },
            filter_dir = function(_, rel_path)
              return not rel_path:match("dist") and not rel_path:match("node_modules")
            end,
            isTestFile = function(file_path)
              if not file_path then
                return false
              end

              return file_path:match("%.e2e%.spec%.ts$")
            end,
          })
        )
      end

      if vim.fn.filereadable("vitest.config.ts") == 1 or vim.fn.filereadable("vitest.config.js") == 1 then
        table.insert(
          adapters,
          require("neotest-vitest")({
            filter_dir = function(_, rel_path)
              return not rel_path:match("dist") and not rel_path:match("node_modules")
            end,
            is_test_file = function(file_path)
              return file_path:match("%.spec%.ts$") and not file_path:match("%.e2e%.spec%.ts")
            end,
          })
        )
      end

      if vim.fn.filereadable("pubspec.yaml") == 1 then
        table.insert(
          adapters,
          require("neotest-dart")({
            command = "fvm flutter",
            use_lsp = true,
            custom_test_method_names = { "testMobileWidgets", "testWebWidgets" },
          })
        )
      end

      ---@diagnostic disable-next-line: missing-fields
      neotest.setup({ adapters = adapters, diagnostic = { enabled = true } })
    end,
    keys = {
      {
        "<leader>tg",
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("neotest").run.run({ extra_args = { "--update-goldens" } })
        end,
        desc = "Run Nearest (Update Goldens)",
      },
      {
        "<leader>tG",
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("neotest").run.run({ vim.fn.expand("%"), extra_args = { "--update-goldens" } })
        end,
        desc = "Run File (Update Goldens)",
      },
    },
  },

  -- adapters declared separately so they lazy-load when required
  { "nvim-neotest/neotest-jest", lazy = true },
  { "marilari88/neotest-vitest", lazy = true },
  { "sidlatau/neotest-dart", lazy = true },
}
