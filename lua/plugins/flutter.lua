return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  event = "BufReadPre *.dart",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("flutter-tools").setup({
      lsp = {
        color = {
          enabled = true,
        },
        on_attach = function(client)
          client.server_capabilities.inlayHintProvider = false
        end,
        settings = {
          lineLength = 160,
          analysisExcludedFolders = {
            ".dart_tool",
            "/Users/gautier/.pub-cache/",
            "/Users/gautier/fvm/",
          },
        },
      },
      fmv = true,
      default_run_args = { flutter = "--no-pub" },
      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },
    })
    require("telescope").load_extension("flutter")
  end,
}
