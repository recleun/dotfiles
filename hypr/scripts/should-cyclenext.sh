#!/bin/bash

STATE=$(hyprctl activewindow -j | jq -r '.fullscreen')

if [[ "$STATE" == "2" && "$1" == "right" ]]; then
    hyprctl dispatch cyclenext
elif [[ "$STATE" == "2" && "$1" == "left" ]]; then
    hyprctl dispatch cyclenext prev
elif [[ "$1" == "right" ]]; then
    hyprctl dispatch movefocus r
else
    hyprctl dispatch movefocus l
fi
