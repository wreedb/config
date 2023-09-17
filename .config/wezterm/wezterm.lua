local wezterm = require "wezterm";
local cfg = {};

cfg.font = wezterm.font_with_fallback { "JetBrains Mono", "Noto Color Emoji" };
cfg.term = "wezterm";
cfg.font_size = 15;
cfg.front_end = "OpenGL";
cfg.cell_width = 0.9;
cfg.prefer_egl = true;
cfg.line_height = 1;
cfg.color_scheme = "Dracula";
cfg.enable_tab_bar = false;
cfg.default_cursor_style = "BlinkingBar";
--cfg.default_prog = { '/bin/fish' };
cfg.window_decorations = "NONE";
cfg.anti_alias_custom_block_glyphs = true;
cfg.window_close_confirmation = "NeverPrompt";

return cfg;
