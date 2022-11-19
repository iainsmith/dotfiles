local opt = vim.opt -- Set options (global/buffer/windows-scoped)

opt.errorbells = false
opt.incsearch = true
opt.mouse = 'a' -- Enable mouse support
opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options

opt.number = true

