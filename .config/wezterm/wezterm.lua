-- vim:ft=lua:number:nowrap:shiftwidth=4:tabstop=4:softtabstop=4
--
local wezterm = require "wezterm";

local conf = {};

conf.font = wezterm.font_with_fallback {
    "JetBrains Mono",
	"Noto Emoji",
	"Symbols Nerd Font Mono"
};

conf.bold_brightens_ansi_colors = "No";
-- conf.dpi = 96;

conf.font_size = 14.00;
conf.cell_width = 1;

--conf.font_shaper = "Harfbuzz";

--conf.front_end = "OpenGL";
-- conf.hide_tab_bar_if_only_one_tab = true;
-- conf.window_decorations = "NONE";
conf.window_close_confirmation = "NeverPrompt";
-- conf.enable_scroll_bar = false;
-- conf.default_cursor_style = "SteadyBar";

conf.window_padding = {
	left = 10,
    right = 10,
	top = 10,
    bottom = 10
};

-- conf.color_scheme = "alice";

conf.default_prog = { "/usr/bin/env", "fish" }
--conf.term = "wezterm";
conf.term = "xterm-256color";

return conf;
