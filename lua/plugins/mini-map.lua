return {
  "nvim-mini/mini.map",
  dependencies = { "lewis6991/gitsigns.nvim" },
  keys = {
    { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" },
    { "<leader>uM", function() require("mini.map").toggle_focus() end, desc = "Toggle minimap focus" },
    { "<leader>uF", function() require("mini.map").toggle_side() end, desc = "Toggle minimap side" },
  },
  opts = function()
    local map = require("mini.map")
    return {
      integrations = {
        map.gen_integration.gitsigns(),
        map.gen_integration.diagnostic(),
        map.gen_integration.builtin_search(),
      },
      symbols = {
        encode = map.gen_encode_symbols.dot("4x2"),
      },
      window = {
        show_integration_count = false,
        width = 10,
        winblend = 25,
      },
    }
  end,
}
