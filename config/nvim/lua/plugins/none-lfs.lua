return {
  "nvimtools/none-ls.nvim",
  event = "LazyFile",
  dependencies = { "mason.nvim" },
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2" } }),
      nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.swiftformat,
      nls.builtins.diagnostics.gitlint,
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.markdownlint_cli2,
      nls.builtins.formatting.mdformat,
    })
  end,
}
