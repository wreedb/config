#!/bin/bash



while true
do
    sleep 0.3;
    hyprctl activewindow | rg -s 'title:' | perl -pe 's|^*.title: ||' > /tmp/.hyprland-title
done
