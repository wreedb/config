-- awesome_mode: api-level=4:screen=on
pcall(require, "luarocks.loader")

local gears         = require "gears"
local awful         = require "awful"
local wibox         = require "wibox"
local pretty        = require "beautiful"
local bad           = require "naughty"
local ruled         = require "ruled"
local help          = require "awful.hotkeys_popup"

local fs = gears.filesystem
local layout = awful.layout.suit

require "awful.autofocus"
-- require "awful.hotkeys_popup.keys"

bad.connect_signal("request::display_error", function(message, startup)
    bad.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

pretty.init(fs.get_configuration_dir() .. "theme/theme.lua")

local terminal     = 'wlaunch terminal'
local editor       = 'wlaunch editor'
local browser      = 'wlaunch browser'
local image_viewer = 'wlaunch imageviewer'
local media_player = 'wlaunch mediaplayer'
local launcher     = 'wlaunch launcher'

local modkey = "Mod4"

local myawesomemenu =
{
    { "hotkeys",     function() help.show_help(nil, awful.screen.focused()) end },
    { "manual",      terminal .. "zsh -c 'man awesome'"                         },
    { "edit config", editor .. " " .. awesome.conffile                          },
    { "restart",     awesome.restart                                            },
    { "quit",        function() awesome.quit() end                              },
}

local mymainmenu = awful.menu({ items =
{
    { "awesome", myawesomemenu, pretty.awesome_icon },
    { "open terminal", terminal }

}})

mylauncher = awful.widget.launcher({ image = pretty.awesome_icon,
                                     menu = mymainmenu })

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts(
        {
            layout.tile,
            layout.max.fullscreen,
            layout.floating,
        }
)end)

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = pretty.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)


-- Create a textclock widget

local clock_normal  = '%I:%M %p'
local clock_verbose = '<b>%B %d, %Y </b>at <b>%I:%M %p</b>'

local clock = wibox.widget
{
    format = clock_normal,
    widget = wibox.widget.textclock
}

local contain_clock = wibox.widget
{
    wibox.widget { clock, margins = { left = 10, right = 10, top = 5, bottom = 5 }, widget = wibox.container.margin },
    shape = gears.shape.rounded_rect,
    bg = '#26233A',
    buttons =
    {
        awful.button({}, 1, function()
            if clock.format == clock_normal then
                clock.format = clock_verbose
                clock:force_update()
            else
                clock.format = clock_normal
                clock:force_update()
            end
        end)
    },
    widget = wibox.container.background,
}

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "  1  ", "  2  ", "  3  ", "  4  ", "  5  ", "  6  ", "  7  ", "  8  ", "  9  " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox
    {
        screen  = s,
        buttons = { awful.button({ }, 1, function () awful.layout.inc( 1) end), }
    }

    local splitter = wibox.widget {
        opacity = 0,
        forced_width = 10,
        widget = wibox.widget.separator,
    }

    local accent_separator = wibox.widget {
        color = '#26233A',
        opacity = 0,
        forced_width = 20,
        widget = wibox.widget.separator,
    }

    local spacer = wibox.widget {
        wibox.widget { widget = wibox.widget.separator },
        margins = { left = 10, right = 10, top = 5, bottom = 5},
        visible = false,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.margin,
    }

    -- Create a taglist widget
    s.taglist = awful.widget.taglist
    {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = { awful.button({}, 1, function(t) t:view_only() end) },
    }

    s.contain_taglist = wibox.widget
    {
        s.taglist,
        bg = '#26233A',
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
    }

    -- Create a tasklist widget
    s.tasklist = awful.widget.tasklist
    {
        filter  = awful.widget.tasklist.filter.focused,
        screen  = s,
        style   = { spacing = 10 },
        widget_template =
            {
                accent_separator,
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                },
                accent_separator,
                layout = wibox.layout.align.horizontal,
            }
    }

    s.contain_tasklist = wibox.widget
    {
        s.tasklist,
        bg = '#26233A',
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    local tray = wibox.widget
    {
        widget = wibox.widget.systray,
        bg = '#26233A'
    }

    s.contain_tray = wibox.widget
    {
        wibox.widget
        {
            tray, margins = { left = 10, right = 10, top = 5, bottom = 5 }, widget = wibox.container.margin
        },
        bg = '#26233A',
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
    }


    -- Create the wibox
    s.mywibox = awful.wibar {
        position = 'top',
        screen   = s,
        align    = 'left',
        margins  = { top = 10, bottom = 0, left = 10, right = 10 },
        shape    = gears.shape.rounded_rect,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                widget = wibox.container.background,
                splitter,
                s.contain_taglist,
                splitter,
                s.contain_tasklist,
                splitter, splitter, splitter, splitter, splitter, splitter,
            },
                spacer,
            { -- Right widgets

                layout = wibox.layout.fixed.horizontal,
                widget = wibox.container.background,
                splitter, splitter, splitter, splitter, splitter, splitter, splitter,
                s.contain_tray,
                splitter,
                contain_clock,
                splitter,
                s.mylayoutbox,
                splitter
            },
        }
    }
end)

awful.mouse.append_global_mousebindings({ awful.button({}, 3, function () mymainmenu:toggle() end) })

local keys_layout =
{
    awful.key({}, 'XF86MonBrightnessUp',
        function() awful.spawn('bright -u') end,
        { description = "Increase brightness", group = "Media Keys" }),

    awful.key({}, 'XF86MonBrightnessDown',
        function() awful.spawn('bright -d') end,
        { description = "Decrease brightness", group = "Media Keys" }),

    awful.key({}, 'XF86AudioRaiseVolume',
        function() awful.spawn('vol -u') end,
        { description = "Increase volume", group = "Media Keys" }),

    awful.key({}, 'XF86AudioLowerVolume',
        function() awful.spawn('vol -d') end,
        { description = "Decrease volume", group = "Media Keys" }),

    awful.key({}, 'XF86AudioMute',
        function() awful.spawn('vol -m') end,
        { description = "Mute audio", group = "Media Keys" }),

    awful.key({}, 'Print',
        function() awful.spawn('screenshot') end,
        { description = "Take a screenshot", group = "Media Keys" }),

    awful.key({ modkey }, 'Print',
        function() awful.spawn('screenshot -s') end,
        { description = "Select region screenshot", group = "Media Keys" }),

    awful.key({ modkey, 'Shift' }, 'Print',
        function() awful.spawn('screenshot -w 3') end,
        { description = "Screenshot in 3 seconds", group = "Media Keys" }),

    awful.key({ modkey, 'Shift' }, 'q',
        function() awful.spawn('logout_yad') end,
        { description = 'Logout Menu', group = 'Awesome' }),

    awful.key({ modkey }, "/",
        help.show_help,
        { description = "Show hotkeys", group = "Awesome" }),

    awful.key({ modkey, "Shift" }, "r", awesome.restart,
        { description = "Reload Awesome", group = "Awesome"}),

    awful.key({ modkey, "Control" }, "X", awesome.quit,
        { description = "Logout of Awesome", group = "Awesome" }),

    awful.key({ modkey }, "Return",
        function() awful.spawn(terminal) end,
        { description = "Open a terminal", group = "Applications" }),

    awful.key({ modkey, "Shift" }, "b",
        function() awful.spawn(browser) end,
        { description = "Open default browser", group = "Applications" }),

    awful.key({ modkey, "Shift" }, "e",
        function() awful.spawn(editor) end,
        { description = "Open an editor", group = "Applications" }),

    awful.key({ modkey }, "p",
        function() awful.spawn(launcher) end,
        { description = "Open a run launcher", group = "Applications" }),

    awful.key({ modkey }, "j",
        function() awful.client.focus.byidx(1) end,
        { description = "Focus next window", group = "Window" }),

    awful.key({ modkey }, "k",
        function() awful.client.focus.byidx(-1) end,
        { description = "Focus previous window", group = "Window" }),

    awful.key({ modkey }, "Tab",
        function() awful.client.focus.history.previous() if client.focus then client.focus:raise() end end,
        { description = "Focus last window", group = "Window" }),

    awful.key({ modkey, "Shift" }, "j",
        function () awful.client.swap.byidx(1) end,
        { description = "Swap with next window", group = "Window" }),

    awful.key({ modkey, "Shift"   }, "k",
        function () awful.client.swap.byidx(-1) end,
        { description = "Swap with previous previous window", group = "Window" }),

    awful.key({ modkey }, "u",
        awful.client.urgent.jumpto,
        { description = "Jump to urgent window", group = 'Window' }),

    awful.key({ modkey }, "l",
        function () awful.tag.incmwfact(0.05) end,
        { description = "Increase master width factor", group = "Layout" }),

    awful.key({ modkey }, "h",
        function() awful.tag.incmwfact(-0.05) end,
        { description = "Decrease master window width", group = "Layout" }),

    awful.key({ modkey, "Shift" }, "h",
        function() awful.tag.incnmaster(1, nil, true) end,
        { description = "Increase the number of master windows", group = "Layout" }),

    awful.key({ modkey, "Shift" }, "l",
        function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "Decrease the number of master windows", group = "Layout" }),

    awful.key({ modkey }, "space",
        function() awful.layout.inc(1) end,
        { description = "Use next layout", group = "Layout" }),

    awful.key({ modkey, "Shift" }, "space",
        function() awful.layout.inc(-1) end,
        { description = "Use previous layout", group = "Layout" }),

}
-- Layout related keybindings
awful.keyboard.append_global_keybindings(keys_layout)

awful.keyboard.append_global_keybindings({
    awful.key
    {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "Go to workspace",
        group       = "Workspaces",
        on_press =
            function (index)
                local screen = awful.screen.focused();
                local tag = screen.tags[index];
                if tag then tag:view_only() end
            end,
    },

    awful.key
    {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "Move focused window to workspace",
        group       = "Workspaces",
        on_press =
            function (index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then client.focus:move_to_tag(tag) end
                end
            end,
    }

})

client.connect_signal("request::default_mousebindings", function()

    awful.mouse.append_client_mousebindings({

        awful.button({},         1, function (c) c:activate { context = "mouse_click" } end),
        awful.button({ modkey }, 1, function (c) c:activate { context = "mouse_click", action = "mouse_move" }  end),
        awful.button({ modkey }, 3, function (c) c:activate { context = "mouse_click", action = "mouse_resize"} end),

    })

end)

client.connect_signal("request::default_keybindings", function()

    awful.keyboard.append_client_keybindings({

        awful.key({ modkey, 'Shift' }, 'f',
            function(c) c.fullscreen = not c.fullscreen; c:raise() end,
            { description = 'Fullscreen focused window', group = 'Window' }),

        awful.key({ modkey, 'Shift' }, 'c',
            function(c) c:kill() end,
            { description = 'Close focused window', group = 'Window' }),

        awful.key({ modkey }, 'f',
            awful.client.floating.toggle,
            { description = 'Float focused window', group = 'Window' }),

        awful.key({ modkey, 'Shift' }, 'Return',
            function(c) c:swap(awful.client.getmaster()) end,
            { description = 'Move to master', group = 'Window' }),

    })

end)


-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule
    {
        id = "global",
        rule = {},
        properties =
        {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule
    {
        id = "floating",
        rule_any =
        {
              instance = { "copyq", "pinentry" },
              class    = { "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv", "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer" },
              name     = { "Event Tester" },
              role     = { "AlarmWindow", "ConfigManager", "pop-up", }
        },
        properties = { floating = true }
    }

end)

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

bad.connect_signal("request::display", function(n)
    bad.layout.box { notification = n }
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

awful.spawn.with_shell('udlaunch -u aw')
awful.spawn.with_shell('xrdb -merge ' .. gears.filesystem.get_configuration_dir() .. 'x/resources')
