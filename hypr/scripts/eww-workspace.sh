#! /bin/bash

function generateItem {
    echo "(hyprspace-item :icon '$1')"
}

function generateActive {
    echo "(hyprspace-item :icon '  ' :class hyprspace-active)"
}

active=$(hyprctl activeworkspace -j | jq ".id")
array=()
sorted=()
for row in $(hyprctl workspaces -j | jq -r ".[] | @base64"); do
    array+=($(echo ${row} | base64 --decode | jq -r ".name"))
    IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
    unset IFS
done
yuck="(hyprspace"
for id in "${sorted[@]}"; do
    if [[ $id -eq $active ]]; then
        yuck+=$(generateActive)
    elif [[ $id -eq 1 ]]; then
        yuck+=$(generateItem " ")
    elif [[ $id -eq 2 ]]; then
        yuck+=$(generateItem " ")
    elif [[ $id -eq 3 ]]; then
        yuck+=$(generateItem " ")
    elif [[ $id -eq 4 ]]; then
        yuck+=$(generateItem " ")
    else
        yuck+=$(generateItem " ")
    fi
done
yuck+=")"
echo $yuck
eww update hspace="$yuck"
