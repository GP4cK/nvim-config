return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        on_attach = function(client, bufnr)
          client.server_capabilities.inlayHintProvider = false
        end,
      },
    })
    require("telescope").load_extension("flutter")
  end,
}
