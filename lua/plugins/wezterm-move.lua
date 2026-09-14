local herdr_directions = {
  h = "left",
  j = "down",
  k = "up",
  l = "right",
}

local function move(direction)
  local current_window = vim.fn.winnr()
  local target_window = vim.fn.winnr(direction)

  if current_window ~= target_window then
    vim.cmd("wincmd " .. direction)
    return
  end

  if vim.env.HERDR_ENV == "1" then
    vim.system({
      "herdr",
      "pane",
      "focus",
      "--direction",
      herdr_directions[direction],
      "--current",
    })
    return
  end

  require("wezterm-move").move(direction)
end

return {
  "letieu/wezterm-move.nvim",
  keys = vim.tbl_map(function(direction)
    return {
      "<C-" .. direction .. ">",
      function()
        move(direction)
      end,
      mode = { "n", "t" },
    }
  end, { "h", "j", "k", "l" }),
}
