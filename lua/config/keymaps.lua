-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-x>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>vb", "viwf(%", { desc = "Select till )" })
vim.keymap.set("n", "<leader>vB", "viwf{%", { desc = "Select till }" })
vim.keymap.set({ "i", "v", "c" }, "<C-c>", "<Esc>", { desc = "Exit to normal mode" })
vim.keymap.set("n", "<Char-0xAA>", "ggVG", { desc = "Select entire buffer" })
vim.keymap.set({ "n", "i" }, "<Char-0xAB>", "<cmd>write<cr>", { desc = "Save current file" })

vim.keymap.set({ "n", "i" }, "<Char-0xAC>", ":bprevious<CR>")
vim.keymap.set({ "n", "i" }, "<Char-0xAD>", ":bnext<CR>")

vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Go to end of line" })

-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.set({ "n", "v" }, "<C-j>", "5gjzz", { desc = "Scroll 5 lines down" })
--
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.set({ "n", "v" }, "<C-k>", "5gkzz", { desc = "Scroll 5 lines down" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "gd", "gdzz", { desc = "Go to definition" })

vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Yank file path" })

-- Buffer navigation by number
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "Go to buffer " .. i })
end
