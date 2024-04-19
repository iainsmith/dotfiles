-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = false

local indent = 2
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = indent
opt.softtabstop = indent
opt.tabstop = indent
opt.autoindent = true
opt.smartindent = true -- Autoindent new lines

opt.undofile = true -- Save undo history
opt.timeoutlen = 300
opt.swapfile = false -- Don't use swapfile

opt.autoread = true
opt.winminwidth = 12
