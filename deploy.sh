#!/bin/sh

configdir="${XDG_CONFIG_HOME:-$HOME/.config}"

wait_before_deploy()
{
    printf '5... '; sleep 1;
    printf '4... '; sleep 1;
    printf '3... '; sleep 1;
    printf '2... '; sleep 1;
    printf '1...\n'; sleep 1;
}

case "$1" in

    "laptop")
	echo -e "\x1B[1;31mWarning\x1B[0m: deploying, press \x1B[1;2mcontrol+c\x1B[0m within 5 seconds to abort"
	wait_before_deploy
	stow -t "${HOME}" -S .
	ln -srvf "${configdir}/hypr/misc/hyprland/laptop.conf" "${configdir}/hypr/misc/hyprland/host.conf"
	ln -srvf "${configdir}/hypr/misc/hyprlock/laptop.conf" "${configdir}/hypr/misc/hyprlock/host.conf"
    ;;

    "desktop")
	echo -e "\x1B[1;31mWarning\x1B[0m: deploying, press \x1B[1;2mcontrol+c\x1B[0m within 5 seconds to abort"
	wait_before_deploy
	stow -t "${HOME}" -S .
	ln -srvf "${configdir}/hypr/misc/hyprland/desktop.conf" "${configdir}/hypr/misc/hyprland/host.conf"
	ln -srvf "${configdir}/hypr/misc/hyprlock/desktop.conf" "${configdir}/hypr/misc/hyprlock/host.conf"
    ;;

    *)
	echo -e "\x1B[1;31mError\x1B[0m: no argument given to \x1B[1;32m$(basename $0)\x1B[0m, expected one of: desktop, laptop"
    ;;

esac
