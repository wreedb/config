import os

struct Keycom {
  prefix string
  suffix string
}

const home     := os.getenv('HOME')
const cfg_home := os.getenv('XDG_CONFIG_HOME')

const terminal := os.getenv('TERMINAL')
const editor   := os.getenv('EDITOR')
const launcher := os.getenv('LAUNCHER')
const browser  := os.getenv('BROWSER')
const reload   := '${cfg_home}/river/init'

const nomod       := 'None'
const modkey      := 'Super'
const modalt      := '${modkey}+Alt'
const modshift    := '${modkey}+Shift'
const modshiftalt := '${modkey}+Shift+Alt'
 
const tags := [1,2,3,4,5,6,7,8,9]


fn nmapspawn(mod Keycom, program string) {
  os.execute('riverctl map normal ${mod.prefix} ${mod.suffix} spawn "${program}"')
}

fn nmapaction(mod Keycom, action string) {
  os.execute('riverctl map normal ${mod.prefix} ${mod.suffix} ${action}')
}

fn npointermap(mod Keycom, action string) {
  os.execute('riverctl map-pointer normal ${mod.prefix} ${mod.suffix} ${action}')
}

fn river_set(setting string, value string) {
  os.execute('riverctl ${setting} ${value}')
}

fn rule_add(action string, id string) {
  os.execute('riverctl rule-add ${action} -app-id ${id}')
}

fn main() {

  nmapspawn(Keycom   {modkey,   'Return'}, terminal)
  nmapspawn(Keycom   {modkey,   'P'},      launcher)
  nmapspawn(Keycom   {modshift, 'E'}, 	   editor)
  nmapspawn(Keycom   {modshift, 'B'}, 	   browser)
  nmapspawn(Keycom   {modshift, 'R'}, 	   reload)
  nmapspawn(Keycom   {modshift, 'P'}, 	   'fuzzel')

  nmapaction(Keycom  {modshift, 'C'}, 	 'close')
  nmapaction(Keycom  {modshift, 'X'}, 	 'exit')

  nmapaction(Keycom  {modkey,   'J'}, 'focus-view next')
  nmapaction(Keycom  {modkey,   'K'}, 'focus-view previous')

  nmapaction(Keycom  {modshift, 'J'}, 'swap next')
  nmapaction(Keycom  {modshift, 'K'}, 'swap previous')

  nmapaction(Keycom  {modkey,   'H'}, 'send-layout-cmd rivertile "main-ratio -0.05"')
  nmapaction(Keycom  {modkey,   'L'}, 'send-layout-cmd rivertile "main-ratio +0.05"')
  nmapaction(Keycom  {modshift, 'H'}, 'send-layout-cmd rivertile "main-count +1"')
  nmapaction(Keycom  {modshift, 'L'}, 'send-layout-cmd rivertile "main-count -1"')

  nmapaction(Keycom  {modalt,   'H'}, 'move left  100')
  nmapaction(Keycom  {modalt,   'J'}, 'move down  100')
  nmapaction(Keycom  {modalt,   'K'}, 'move up    100')
  nmapaction(Keycom  {modalt,   'L'}, 'move right 100')

  nmapaction(Keycom  {modshiftalt, 'H'}, 'resize horizontal -100')
  nmapaction(Keycom  {modshiftalt, 'J'}, 'resize vertical    100')
  nmapaction(Keycom  {modshiftalt, 'K'}, 'resize vertical   -100')
  nmapaction(Keycom  {modshiftalt, 'L'}, 'resize horizontal  100')

  nmapaction(Keycom  {modkey, 'Space'}, 'toggle-float')
  nmapaction(Keycom  {modkey,     'F'}, 'toggle-fullscreen')

  npointermap(Keycom {modkey, 'BTN_LEFT'  }, 'move-view')
  npointermap(Keycom {modkey, 'BTN_RIGHT' }, 'resize-view')
  npointermap(Keycom {modkey, 'BTN_MIDDLE'}, 'toggle-float')

  nmapspawn(Keycom {nomod, 'XF86MonBrightnessUp'  }, 'xbacklight -inc 5')
  nmapspawn(Keycom {nomod, 'XF86MonBrightnessDown'}, 'xbacklight -dec 5')
  nmapspawn(Keycom {nomod, 'XF86AudioMute'        }, 'pamixer --toggle-mute')
  nmapspawn(Keycom {nomod, 'XF86AudioRaiseVolume' }, 'pamixer -i 5')
  nmapspawn(Keycom {nomod, 'XF86AudioLowerVolume' }, 'pamixer -d 5')

  for index in 1 .. (tags.len + 1) {
    mut tag := 1 << (index - 1)
    os.execute('riverctl map normal Super ${index} set-focused-tags ${tag}')
    os.execute('riverctl map normal Super+Shift ${index} set-view-tags ${tag}')
  }

  river_set('background-color',       "0x002B36")
  river_set('border-color-focused',   "0x93A1A1")
  river_set('border-color-unfocused', "0x586E75")

  river_set('focuse-follows-cursor',  'normal')
  river_set('hide-cursor',            'when-typing enabled')
  river_set('xcursor-theme',          'phinger-light 30')

  river_set('input "pointer-1133-4127-Logitech_Wireless_Mouse_PID:101f"', 'accel-profile flat')

  river_set('border-width', '1')
  river_set('attach-mode', 'top')
  river_set('set-repeat', '50 300')
  
  rule_add('float', 'pavucontrol*')
  rule_add('float', 'xfce*')
  rule_add('ssd',   'emacs*')
  rule_add('ssd',   'firefox*')
  rule_add('float', 'waybar-pacman')
  rule_add('float', '"Code" -title "Open File"' )
  rule_add('float', 'yad*')
  rule_add('float', 'byebye')

  os.execute('${cfg_home}/river/autostart')

  

}
