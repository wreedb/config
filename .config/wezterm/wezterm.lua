local wezterm = require "wezterm"
local userhome = wezterm.home_dir
-- local userfonts = userhome .. "/.local/share/fonts"
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
    "JetBrains Mono",
    "Noto Emoji",
    "Symbols Nerd Font Mono"
}

config.font_size = 14.00
config.font_shaper = "Harfbuzz"

-- only use fonts from these directories
-- in the order listed
-- config.font_dirs = { userfonts, "/usr/local/share/fonts", "/usr/share/fonts" }
-- config.font_locator = "ConfigDirsOnly"

config.cell_width = 1.00
config.bold_brightens_ansi_colors = "No"

config.dpi = 96

-- graphical performance
config.animation_fps = 120
config.front_end = "OpenGL"
config.enable_wayland = true

-- hide ui elements I won't use
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
-- avoid "Quit? [y/N]" message
config.window_close_confirmation = "NeverPrompt"
-- 10px padding all around
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10
}

config.default_cursor_style = "BlinkingBar"

config.color_scheme = "alice"
-- use fish as the interactive shell
config.default_prog = { "fish" }
-- specify TERMINFO
-- config.term = "wezterm"

return config
