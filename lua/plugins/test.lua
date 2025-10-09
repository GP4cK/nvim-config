return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local neotest = require("neotest")
      local adapters = {}

      -- Conditionally register adapters
      if vim.fn.filereadable("jest.config.js") == 1 or vim.fn.filereadable("jest.config.ts") == 1 then
        table.insert(
          adapters,
          require("neotest-jest")({
            filter_dir = function(_, rel_path)
              return not rel_path:match("dist") and not rel_path:match("node_modules")
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
