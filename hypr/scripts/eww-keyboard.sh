#! /bin/bash

LAYOUT=$(hyprctl devices -j |
  jq -r '.keyboards[4] | .active_keymap' |
  head -n1 |
  cut -c1-2 |
  tr 'a-z' 'A-Z')

eww update keyboard="$LAYOUT"
