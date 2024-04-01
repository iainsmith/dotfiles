function diff_view_toggle(command)
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    -- Current tabpage is a Diffview; close it
    vim.cmd.DiffviewClose()
  else
    command()
  end
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>gd",
  ":lua diff_view_toggle(vim.cmd.DiffviewOpen)<CR>",
  { noremap = true, desc = "DiffView Toggle" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gl",
  ':lua diff_view_toggle(function() vim.cmd.DiffviewFileHistory("%") end)<CR>',
  { noremap = true, desc = "File History" }
)

return {
  "sindrets/diffview.nvim",
  hooks = {
    view_opened = function(view)
      print(("A new %s was opened on tab page %d!"):format(view.class:name(), view.tabpage))
    end,
  },
}
