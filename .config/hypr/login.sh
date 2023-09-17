#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme "Kripton"
gsettings set org.gnome.desktop.interface icon-theme "Tela-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Phinger-Light"
gsettings set org.gnome.desktop.interface cursor-size 36
gsettings set org.gnome.desktop.wm.preferences theme "Kripton"
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true

pgrep -x swaybg   > /dev/null || swaybg --mode fit --image ~/pictures/wallpapers/default.png &
pgrep -x wlsunset > /dev/null || wlsunset &
