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
        -- `vim.ui.select` sizes its list box with `vim.o.lines * 0.8 - 10`, which is
        -- usually fractional. Fullscreen keeps that value, and `nvim_win_set_config`
        -- rejects it with "Invalid 'height': Number is not integral".
        select = {
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
