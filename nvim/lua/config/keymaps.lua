-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-a>", function()
  vim.cmd("normal! gg")
  vim.defer_fn(function()
    vim.cmd("normal! VG")
  end, 100)
end)

