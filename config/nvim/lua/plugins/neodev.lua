return {
  {
    "folke/neodev.nvim",
    opts = {
      override = function(root_dir, library)
        library.enabled = true
        library.plugins = true
      end,
    },
  },
}
