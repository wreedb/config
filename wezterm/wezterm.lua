-- -*- lua-ts -*-
local wezterm = require "wezterm"
local fontfb = wezterm.font_with_fallback
local config = wezterm.config_builder()

config.check_for_updates = false

config.freetype_load_flags = "NO_HINTING"

config.font = fontfb {
    { family = "JetBrains Mono", weight = "Medium" },
    { family = "Symbols Nerd Font Mono" },
    { family = "Noto Emoji" }
}

config.font_size = 15.00
config.bold_brightens_ansi_colors = "No"
config.window_background_opacity = 0.95

config.dpi = 96
config.animation_fps = 144

-- hide ui elements I won't use
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.default_prog = { "zsh" }
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 6000
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10
}

config.default_cursor_style = "BlinkingBar"
config.color_scheme = "alice"
config.term = "wezterm"

config.keys = {

    {   --  CTRL+SHIFT Enter: Split | | |
        key = "Enter",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },

    {   -- CTRL+SUPER Enter: Split |-|
        key = "Enter",
        mods = "CTRL|SUPER",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },

    {   -- CTRL+SHIFT W: close pane
        key = "w",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CloseCurrentPane { confirm = false }
    },

    {   -- CTRL+SHIFT J: Rotate panes clockwise
        key = "j",
        mods = "CTRL|SHIFT",
        action = wezterm.action.RotatePanes "Clockwise"
    },

    {   -- CTRL+SHIFT K: Rotate panes counter-clockwise
        key = "k",
        mods = "CTRL|SHIFT",
        action = wezterm.action.RotatePanes "CounterClockwise"
    },

    {   -- CTRL+SHIFT H: Increase pane size <-
        key = "h",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    
    {   -- CTRL+SHIFT L: Increase pane size ->
        key = "l",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    }

}

return config
