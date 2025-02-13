# -*- mode: python; -*-

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Match, Screen, EzKey, Key, KeyChord
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"
keys = [
    EzKey('M-j',        lazy.layout.next(),          desc = 'Move focus down'),
    EzKey('M-k',        lazy.layout.previous(),      desc = 'Move focus up'),
    EzKey('M-S-j',      lazy.layout.shuffle_down(),  desc = 'Move focus down'),
    EzKey('M-S-k',      lazy.layout.shuffle_up(),    desc = 'Move focus up'),
    EzKey('M-l',        lazy.layout.grow_main(),     desc = 'Enlarge master window size'),
    EzKey('M-h',        lazy.layout.shrink_main(),   desc = 'Decrease master window size'),
    EzKey('M-n',        lazy.layout.normalize(),     desc = 'Reset all window sizes'),
    
    EzKey('M-<Return>',   lazy.spawn(terminal),        desc = 'Launch terminal'),
    EzKey('M-S-<Return>', lazy.spawn("emacs"),         desc = 'Launch Emacs'),
    EzKey('M-<Tab>',      lazy.next_layout(),          desc = 'Toggle between layouts'),
    EzKey('M-S-c',        lazy.window.kill(),          desc = 'Kill focused window'),
    EzKey('M-S-r',        lazy.reload_config(),        desc = 'Reload the config'),
    EzKey('M-S-e',        lazy.shutdown(),             desc = 'Shutdown Qtile'),
    EzKey('M-p',          lazy.spawn("bemenu-run"),    desc = 'Run launcher'),
    EzKey('M-S-p',        lazy.spawn("walker"),        desc = 'Big run launcher'),
    
    EzKey('<Print>',    lazy.spawn('screenshot'),    desc = 'Take a screenshot'),
    EzKey('M-<Print>',  lazy.spawn('screenshot -s'), desc = 'Select screenshot'),

    EzKey('M-f',   lazy.window.toggle_floating(),   desc = 'Toggle focused window to float'),
    EzKey('M-S-f', lazy.window.toggle_fullscreen(), desc = 'Toggle focused window to fullscreen'),

    KeyChord([mod], 'Print', [
        Key([], 'n', lazy.spawn('screenshot')),
        Key([], 's', lazy.spawn('screenshot -s'))
    ], name = 'Screenshot'),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {
  "border_width":  1,
  "margin":        6,
  'new_client_position': 'top',
  "border_focus":  "C4A7E7", #C4A7E7
  "border_normal": "403D52", #403D52
}
    
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(
        border_width = 1,
        border_normal = '#403D52',
        border_focus = '#C4A7E7'
    ),
]

widget_defaults = dict(
    font="Roboto Condensed",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = "bibata"
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
