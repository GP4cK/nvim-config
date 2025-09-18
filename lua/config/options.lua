-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Get the directory from the command-line argument
    local path = vim.fn.argv()[1]
    if path and vim.fn.isdirectory(vim.fn.expand(path)) == 1 then
      vim.fn.chdir(vim.fn.expand(path))
    end
  end,
})
