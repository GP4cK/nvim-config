return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "macchiato",
      -- transparent_background = true,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Replace the branch component with a shortened version
      opts.sections.lualine_b = {
        {
          "branch",
          fmt = function(name)
            if not name then
              return ""
            end
            local max = 20
            if #name > max then
              return name:sub(1, max) .. "…"
            end
            return name
          end,
        },
      }

      opts.sections.lualine_c = {
        {
          "filename",
          path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
