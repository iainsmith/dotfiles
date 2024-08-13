local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'

config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })

return config
