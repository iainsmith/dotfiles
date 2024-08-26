return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      on_colors = function(colors)
        colors.border = colors.orange
      end,
    })
  end,
}
