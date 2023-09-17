-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------
local gears = require 'gears'
local themes_path = require 'gears.filesystem'.get_configuration_dir() .. 'theme/'
local rnotification = require 'ruled.notification'
local dpi = require 'beautiful.xresources'.apply_dpi

local ui_font = 'Roboto Condensed Medium 12'
-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "background.png"
-- }}}

-- {{{ Styles
theme.font      = ui_font

-- {{{ Colors
theme.fg_normal   = "#E0DEF4"
theme.fg_focus    = "#E0DEF4"
theme.fg_occupied = "#403D52"
theme.fg_urgent   = "#000000"
theme.bg_normal   = "#191724"
theme.bg_focus    = "#C4A7E7"
theme.bg_urgent   = "#EB6F92"
theme.bg_systray  = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(1)
theme.border_color_normal = "#6E6A86"
theme.border_color_active = "#C4A7E7"
-- }}}


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_shape = gears.shape.squircle
theme.taglist_bg_focus    = '#C4A7E7'
theme.taglist_fg_focus    = '#191724'
theme.taglist_bg_occupied = '#26233A'
theme.taglist_fg_occupied = '#E0DEF4'
theme.taglist_fg_empty    = '#6E6A86'


theme.tasklist_bg_focus = "#26233A"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(150)
-- }}}

-- {{{ Misc
-- }}}

theme.layout_tile       = themes_path .. 'layouts/tile.png'
theme.layout_fullscreen = themes_path .. 'layouts/fullscreen.png'
theme.layout_magnifier  = themes_path .. 'layouts/magnifier.png'
theme.layout_floating   = themes_path .. 'layouts/floating.png'

  -- {{  HOTKEY POPUP
theme.hotkeys_font = 'Myosevka Medium 14'
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_shape = gears.shape.rounded_rect
theme.hotkeys_border_color = '#6E6A86'
theme.hotkeys_bg = '#191724'
theme.hotkeys_fg = '#E0DEF4'
theme.hotkeys_modifiers_fg = '#31748F'
theme.hotkeys_label_bg = '#EBBCBA'
theme.hotkeys_label_fg = '#E0DEF4'
theme.hotkeys_description_font = 'Myosevka Medium 12'
theme.hotkeys_group_margin = 10


-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
