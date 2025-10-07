return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufRead",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)

      -- Helper function to get the current fold range
      local function get_current_fold_range()
        local cursor_line = vim.fn.line(".")
        local start_line = cursor_line
        local end_line = cursor_line

        -- Find the start of the current fold
        while start_line > 1 do
          local prev_indent = vim.fn.indent(start_line - 1)
          local curr_indent = vim.fn.indent(start_line)
          if prev_indent < curr_indent then
            break
          end
          start_line = start_line - 1
        end

        -- Find the end of the current fold
        local last_line = vim.fn.line("$")
        while end_line < last_line do
          local next_indent = vim.fn.indent(end_line + 1)
          local curr_indent = vim.fn.indent(start_line)
          if next_indent <= curr_indent and vim.fn.getline(end_line + 1):match("%S") then
            break
          end
          end_line = end_line + 1
        end

        return start_line, end_line
      end

      -- Fold everything except current block and its contents
      local function fold_except_current()
        -- First, fold everything
        require("ufo").closeAllFolds()

        -- Get the range of the current block
        local start_line, end_line = get_current_fold_range()

        -- Open all folds within the current block range
        for line = start_line, end_line do
          vim.fn.cursor(line, 1)
          local fold_start = vim.fn.foldclosed(line)
          if fold_start ~= -1 then
            vim.cmd("foldopen")
          end
        end

        -- Ensure we're back to the original cursor position and the current fold is visible
        vim.cmd("normal! zv")
      end

      -- VSCode-like folding keymaps - multiple options
      vim.keymap.set("n", "<leader>zf", function()
        fold_except_current()
      end, { desc = "Focus: fold everything except current block" })

      vim.keymap.set("n", "<leader>zo", function()
        require("ufo").openAllFolds()
      end, { desc = "Open all folds" })
    end,
  },
}

