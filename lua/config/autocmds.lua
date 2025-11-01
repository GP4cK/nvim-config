-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    vim.fn.system("wezterm set-user-var IS_NVIM true")
    local cwd = vim.fn.getcwd()
    vim.fn.chansend(vim.v.stderr, string.format("\027]7;file://%s%s\027\\", vim.uv.os_gethostname(), cwd))
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.system("wezterm set-user-var IS_NVIM false")
  end,
})
