-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local n_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end

n_keymap("<leader>f", ":Rg <CR>")
n_keymap("<leader>F", ":Rg <C-R><C-W><CR>")
n_keymap(";", ":")
n_keymap("<leader>x", ":q")
n_keymap("<leader>O", ":Files")
