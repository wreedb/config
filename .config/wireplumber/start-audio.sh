#!/bin/sh

systemctl --user start pipewire.service
sleep 0.5
systemctl --user start pipewire-pulse.service
sleep 0.5
systemctl --user start wireplumber.service
