#! /bin/bash

function handle {
  case $1 in
    workspace*) "/home/recleun/.config/hypr/scripts/eww-workspace.sh" ;;
    activewindow*) "/home/recleun/.config/hypr/scripts/eww-activewindow.sh" ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
