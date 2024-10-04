#! /bin/bash

title=$(hyprctl activewindow -j | jq -r ".title")
if [[ $title == "null" ]] then
    title=""
fi

eww update htitle="$title"
