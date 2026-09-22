return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    opts.current_line_blame = true
    opts.current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 300,
    }
    opts.current_line_blame_formatter = "<author>, <author_time:%R> - <summary>"

    -- LazyVim maps <leader>ghp to preview_hunk_inline; use the float instead.
    local on_attach = opts.on_attach
    opts.on_attach = function(buffer)
      if on_attach then
        on_attach(buffer)
      end
      vim.keymap.set("n", "<leader>ghp", function()
        require("gitsigns").preview_hunk()
      end, { buffer = buffer, desc = "Preview Hunk", silent = true })
    end
  end,
}
