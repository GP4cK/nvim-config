return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        fullscreen = true,
      },
      win = {
        input = {
          keys = {
            ["<c-y>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        preview = {
          keys = {
            ["<c-y>"] = "focus_input",
          },
        },
      },
      sources = {
        explorer = {
          layout = {
            fullscreen = false,
          },
        },
      },
    },
    styles = {
      lazygit = {
        height = 0,
        width = 0,
      },
    },
  },
}
