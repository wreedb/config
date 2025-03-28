-- -*- lua-ts -*-
local wezterm = require "wezterm"
local userhome = wezterm.home_dir
local config = wezterm.config_builder()
local runtime_dir = os.getenv "XDG_RUNTIME_DIR"

-- I have shepherd handle my ssh-agent and it always
-- uses this socket specifically
local def_socket = runtime_dir .. "/ssh-agent/socket"

config.default_ssh_auth_sock = def_socket

config.font = wezterm.font_with_fallback {

    { family = "JetBrains Mono" },

    {
        family = "Noto Emoji",
        assume_emoji_presentation = true
    },

    { family = "Symbols Nerd Font Mono" },
    { family = "Noto Sans Math" },
    { family = "Noto Music" },

}

config.window_background_opacity = 0.95

config.font_size = 14.00
config.font_shaper = "Harfbuzz"

config.cell_width = 1.00
config.bold_brightens_ansi_colors = "No"

config.dpi = 96

-- graphical performance
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

config.default_cursor_style = "SteadyBar"
config.color_scheme = "alice"
-- use fish as the interactive shell
config.default_prog = { "fish" }
-- specify TERMINFO
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
