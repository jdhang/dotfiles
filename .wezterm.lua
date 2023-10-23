local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- fonts
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrainsMono Nerd Font',
    italic = false,
    style = 'Normal',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  'PingFang SC',
}
config.font_size = 13.0

-- color scheme
config.color_scheme = 'Builtin Pastel Dark'

-- enable scrollbar
config.enable_scroll_bar = true

-- tab bar
config.hide_tab_bar_if_only_one_tab = true

return config
