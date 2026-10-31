-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open a terminal in the directory of the current file
vim.keymap.set("n", "<leader>tf", function()
  Snacks.terminal(nil, {
    cwd = vim.fn.expand("%:p:h"),
  })
end, { desc = "Terminal (File Dir)" })

-- Return to normal mode from terminal
vim.keymap.set("t", "<C-n>", [[<C-\><C-n>]])

-- 42 formatter
vim.keymap.set("n", "<leader>4f", function()
  vim.cmd("write")
  vim.cmd("!c_formatter_42 " .. vim.fn.shellescape(vim.fn.expand("%:p")))
  vim.cmd("edit!")
end, { desc = "42 Format" })

-- 42 Norminette
vim.keymap.set("n", "<leader>4n", function()
  vim.cmd("write")
  vim.cmd("!norminette " .. vim.fn.shellescape(vim.fn.expand("%:p")))
end, { desc = "42 Norminette" })
