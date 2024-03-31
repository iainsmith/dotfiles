return {
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary", "neotest-python", "neotest-jest" } },
    dependencies = {
      { "nvim-neotest/neotest-plenary", opts = {} },
      { "nvim-neotest/neotest-python", opts = {} },
      { "nvim-neotest/neotest-jest", opts = {} },
    },
  },
}
