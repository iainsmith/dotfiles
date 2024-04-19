-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local n_keymap = function(lhs, rhs, desc)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

n_keymap(";", ":", "Command mode")
n_keymap("<leader>x", ":q", "Quit")
n_keymap("<leader>bq", "<cmd>lua require('mini.bufremove').delete()<CR>", "Delete Buffer")
n_keymap("<leader>o", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", "Find Files")
n_keymap("<leader>wq", "<C-W>q", "Close Window")
