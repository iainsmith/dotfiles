local actions = require("telescope.actions")

return {
  {
    "iainsmith/telescope-spm.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    dir = "~/Developer/personal/telescope-spm.nvim",
    config = function()
      require("telescope").load_extension("spm")
      require("telescope_spm").setup({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root, hidden = true })
        end,
        desc = "Find Plugin File",
      },
    },

    dependencies = {
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    -- change some options
    opts = {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = { "truncate" },
        mappings = {
          i = {
            ["C-b"] = "preview_scrolling_up",
            ["<C-s>"] = actions.cycle_previewers_next,
          },
          n = {
            ["C-b"] = "preview_scrolling_up",
            ["<C-s>"] = actions.cycle_previewers_next,
          },
        },
      },
    },
  },
}
