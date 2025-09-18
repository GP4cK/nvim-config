-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-n>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>vb", "viwf(%", { desc = "Select till )" })
vim.keymap.set("n", "<leader>vB", "viwf{%", { desc = "Select till }" })
vim.keymap.set({ "i", "v", "c" }, "<C-c>", "<Esc>", { desc = "Exit to normal mode" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
