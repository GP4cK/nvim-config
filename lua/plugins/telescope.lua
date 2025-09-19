return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "smart" },
    },
  },
  keys = function(_, keys)
    vim.list_extend(keys, {
      {
        "<leader>p",
        function()
          LazyVim.pick("find_files", { root = true })()
        end,
        desc = "Find Files (root)",
      },
    })
  end,
}
