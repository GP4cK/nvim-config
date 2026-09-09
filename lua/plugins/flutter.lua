return {
  {
    "jedrzejboczar/exrc.nvim",
    dependencies = { "neovim/nvim-lspconfig" }, -- (optional)
    config = true,
    opts = { --[[ your config ]]
    },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("flutter-tools").setup({
        lsp = {
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
        debugger = {
          enabled = true,
        },
        decorations = {
          statusline = {
            device = true,
          },
        },
        default_run_args = { flutter = "--no-pub" },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
      })
      require("telescope").load_extension("flutter")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          vim.lsp.document_color.enable(true, { bufnr = ev.buf })
        end,
      })
    end,
  },
}
