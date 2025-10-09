-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-x>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>vb", "viwf(%", { desc = "Select till )" })
vim.keymap.set("n", "<leader>vB", "viwf{%", { desc = "Select till }" })
vim.keymap.set({ "i", "v", "c" }, "<C-c>", "<Esc>", { desc = "Exit to normal mode" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })

vim.keymap.del("n", "<C-j>")
vim.keymap.set("n", "<C-j>", "5gjzz", { desc = "Scroll 5 lines down" })

vim.keymap.del("n", "<C-k>")
vim.keymap.set("n", "<C-k>", "5gkzz", { desc = "Scroll 5 lines down" })

vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Yank file path" })

-- Buffer navigation by number
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "Go to buffer " .. i })
end
