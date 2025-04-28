# vim:ft=zsh
local ssh_key="${HOME}/.ssh/key"
ssh-add "${ssh_key}" >/dev/null 2>&1; unset ssh_key

export SVDIR="${XDG_CONFIG_HOME}/runit/enabled"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec launch-hyprland
fi
