-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Autocommand for everyime you enter a kotlin file.
-- cler out each time
--
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  command = "echo 'Hello Kotlin!'",
  pattern = { "*.kt" },
})
