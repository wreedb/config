# vim:ft=python

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Match, Screen, EzKey, Key, KeyChord
from libqtile.lazy import lazy
import os

os.system('udlaunch -u qtile')

mod = "mod4"
terminal = os.getenv('TERMINAL')
editor = os.getenv('EDITOR')
launcher = os.getenv('LAUNCHER')


keys = [

    EzKey('M-j',        lazy.layout.next(),          desc = 'Move focus down'),
    EzKey('M-k',        lazy.layout.previous(),      desc = 'Move focus up'),
    EzKey('M-S-j',      lazy.layout.shuffle_down(),  desc = 'Move focus down'),
    EzKey('M-S-k',      lazy.layout.shuffle_up(),    desc = 'Move focus up'),
    EzKey('M-l',        lazy.layout.grow_main(),     desc = 'Enlarge master window size'),
    EzKey('M-h',        lazy.layout.shrink_main(),   desc = 'Decrease master window size'),
    EzKey('M-n',        lazy.layout.normalize(),     desc = 'Reset all window sizes'),
    
    EzKey('M-<Return>', lazy.spawn(terminal),        desc = 'Launch terminal'),
    EzKey('M-<Tab>',    lazy.next_layout(),          desc = 'Toggle between layouts'),
    EzKey('M-S-c',      lazy.window.kill(),          desc = 'Kill focused window'),
    EzKey('M-S-r',      lazy.reload_config(),        desc = 'Reload the config'),
    EzKey('M-S-x',      lazy.spawn('logout_yad'),    desc = 'Logout menu'),
    EzKey('M-C-x',      lazy.shutdown(),             desc = 'Shutdown Qtile'),
    EzKey('M-p',        lazy.spawn(launcher),        desc = 'Run launcher'),
    EzKey('M-S-p',      lazy.spawn('fuzzel'),        desc = 'Big run launcher'),
    
    EzKey('<Print>',    lazy.spawn('screenshot'),    desc = 'Take a screenshot'),
    EzKey('M-<Print>',  lazy.spawn('screenshot -s'), desc = 'Select screenshot'),
    EzKey('M-S-e',      lazy.spawn(editor),          desc = 'Launch primary text editor'),

    EzKey('M-f',   lazy.window.toggle_floating(),   desc = 'Toggle focused window to float'),
    EzKey('M-S-f', lazy.window.toggle_fullscreen(), desc = 'Toggle focused window to fullscreen'),

    KeyChord([mod], 'Print', [
        Key([], 'n', lazy.spawn('screenshot')),
        Key([], 's', lazy.spawn('screenshot -s'))
    ], name = 'Screenshot'),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc = "Switch to workspace > {}".format(i.name), ),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group = False), desc = "Send focused window to > {}".format(i.name), ),
        ])

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
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    padding = 0,
                    scale = 0.7
                ),
                widget.GroupBox(
                    fmt = ' {} ',
                    highlight_method = 'block',
                    active = 'E0DEF4',
                    block_highlight_text_color = 'E0DEF4',
                ),
                widget.WindowName(),
                widget.Clock(format = "%I:%M %p"),
            ],
            30,
            background = '#191724',
            opacity = 0.8,
            margin = [3, 3, 3, 3]
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules = [
        *layout.Floating.default_float_rules,
        Match(wm_class = "ssh-askpass"),  # ssh-askpass
        Match(wm_class = "yad"),  # yad dialogs
        Match(title = "branchdialog"),  # gitk
        Match(title = "pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

wl_input_rules = True
