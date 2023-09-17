#!/bin/sh

pgrep -x waybar > /dev/null || waybar -c ~/.config/hypr/waybar/config \
                                      -s ~/.config/hypr/waybar/style.css &
