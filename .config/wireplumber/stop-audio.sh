#!/bin/sh

printf 'Stopping: wireplumber service\n'
systemctl --user stop wireplumber.service
sleep 0.5

printf 'Stopping: pipewire-pulse socket\n'
systemctl --user stop pipewire-pulse.socket
sleep 0.5

printf 'Stopping: pipewire-pulse service\n'
systemctl --user stop pipewire-pulse.service
sleep 0.5

printf 'Stopping: pipewire socket\n'
systemctl --user stop pipewire.socket
sleep 0.5

printf 'Stopping: pipewire socket\n'
systemctl --user stop pipewire.service
sleep 0.5
printf 'Finished.\n'
