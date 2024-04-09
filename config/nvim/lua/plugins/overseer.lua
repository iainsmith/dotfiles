return {
  "stevearc/overseer.nvim",
  dir = "~/Developer/personal/overseer.nvim",
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      task_list = {
        default_detail = 2,
        bindings = {
          ["?"] = "ShowHelp",
          ["g?"] = "ShowHelp",
          ["<CR>"] = "RunAction",
          ["<C-e>"] = "Edit",
          ["o"] = "Open",
          ["<C-v>"] = "OpenVsplit",
          ["<C-s>"] = "OpenSplit",
          ["<C-f>"] = "OpenFloat",
          ["<C-q>"] = "OpenQuickFix",
          ["p"] = "TogglePreview",
          ["<C-l>"] = false,
          ["<C-h>"] = false,
          ["L"] = "IncreaseAllDetail",
          ["H"] = "DecreaseAllDetail",
          ["["] = "DecreaseWidth",
          ["]"] = "IncreaseWidth",
          ["{"] = "PrevTask",
          ["}"] = "NextTask",
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["q"] = "Close",
        },
      },
      -- Aliases for bundles of components. Redefine the builtins, or create your own.oversoversovers
      component_aliases = {
        -- Most tasks are initialized with the default components
        default = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
          { "on_output_quickfix", open_on_match = true, items_only = true, set_diagnostics = true },
          { "on_result_diagnostics", remove_on_restart = true },
          { "on_result_diagnostics_quickfix", set_empty_results = true },
        },
      },
    })
  end,
}
