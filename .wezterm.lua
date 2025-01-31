local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- fonts
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrainsMono Nerd Font Mono',
    italic = false,
    style = 'Normal',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  'PingFang SC',
}
config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'JetBrainsMono Nerd Font Mono',
      italic = false,
      style = 'Normal',
      weight = 'Bold',
    }
  },
  {
    intensity = 'Half',
    italic = true,
    font = wezterm.font {
      family = 'JetBrainsMono Nerd Font Mono',
      italic = false,
      style = 'Normal',
      weight = 'ExtraLight',
    }
  },
  {
    intensity = 'Normal',
    italic = true,
    font = wezterm.font {
      family = 'JetBrainsMono Nerd Font Mono',
      italic = false,
      style = 'Normal',
    }
  }
}
config.font_size = 15.0

-- color scheme
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Builtin Pastel Dark'

-- enable scrollbar
config.enable_scroll_bar = true

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- disable close confirmation
config.window_close_confirmation = 'NeverPrompt'

-- background opacity
config.window_background_opacity = 0.85

return config
