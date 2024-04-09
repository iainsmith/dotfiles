return {
  "echasnovski/mini.pairs",
  version = "*",
  enabled = true,
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^%)][^%a]" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^%]][^%a]" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
    },
  },
}
