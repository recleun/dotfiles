#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LIST=(
    "xinit"
    "tmux"
    "i3"
    "i3status"
    "fastfetch"
    "lazygit"
    "fish"
    "eww"
    "flameshot"
    "hypr"
    "kitty"
    "nvim"
    "rofi"
    "vifm"
    "waybar"
    "oh-my-zsh"
    "scripts"
    "audio"
    "dunst"
    "picom"
)

if [[ -n "$1" ]] then
    if [[ "$1" == "list" ]] then
        printf '%s\n' "${LIST[@]}"
    elif [[ "$1" == "xinit" ]]; then
        echo "Linking xinit";
        ln -s $SCRIPT_DIR/.xinitrc ~/
    elif [[ "$1" == "tmux" ]]; then
        echo "Linking tmux"
        ln -s $SCRIPT_DIR/tmux ~/.config/
    elif [[ "$1" == "i3" ]]; then
        echo "Linking i3"
        ln -s $SCRIPT_DIR/i3 ~/.config/
    elif [[ "$1" == "i3status" ]]; then
        echo "Linking i3status"
        ln -s $SCRIPT_DIR/i3status ~/.config/
    elif [[ "$1" == "fastfetch" ]]; then
        echo "Linking fastfetch"
        ln -s $SCRIPT_DIR/fastfetch ~/.config/
    elif [[ "$1" == "lazygit" ]]; then
        echo "Linking lazygit"
        ln -s $SCRIPT_DIR/lazygit ~/.config/
    elif [[ "$1" == "fish" ]]; then
        echo "Linking fish"
        ln -s $SCRIPT_DIR/fish ~/.config/
    elif [[ "$1" == "eww" ]]; then
        echo "Linking eww"
        ln -s $SCRIPT_DIR/eww ~/.config/
    elif [[ "$1" == "flameshot" ]]; then
        echo "Linking flameshot"
        ln -s $SCRIPT_DIR/flameshot ~/.config/
    elif [[ "$1" == "hypr" ]]; then
        echo "Linking hypr"
        ln -s $SCRIPT_DIR/hypr ~/.config/
    elif [[ "$1" == "kitty" ]]; then
        echo "Linking kitty"
        ln -s $SCRIPT_DIR/kitty ~/.config/
    elif [[ "$1" == "nvim" ]]; then
        echo "Linking nvim"
        ln -s $SCRIPT_DIR/nvim ~/.config/
    elif [[ "$1" == "rofi" ]]; then
        echo "Linking rofi"
        ln -s $SCRIPT_DIR/rofi ~/.config/
    elif [[ "$1" == "vifm" ]]; then
        echo "Linking vifm"
        ln -s $SCRIPT_DIR/vifm ~/.config/
    elif [[ "$1" == "waybar" ]]; then
        echo "Linking waybar"
        ln -s $SCRIPT_DIR/waybar ~/.config/
    elif [[ "$1" == "oh-my-zsh" ]]; then
        echo "Linking oh-my-zsh"
        ln -s $SCRIPT_DIR/oh-my-zsh/custom ~/.oh-my-zsh/
    elif [[ "$1" == "scripts" ]]; then
        echo "Linking scripts"
        ln -s $SCRIPT_DIR/scripts ~/
    elif [[ "$1" == "audio" ]]; then
        echo "Linking audio"
        ln -s $SCRIPT_DIR/audio ~/audio/
    elif [[ "$1" == "dunst" ]]; then
        echo "Linking dunst"
        ln -s $SCRIPT_DIR/dunst ~/.config/
    elif [[ "$1" == "picom" ]]; then
        echo "Linking picom"
        ln -s $SCRIPT_DIR/picom ~/.config/
    else
        echo "No $1 was found, use \`./install.sh list\` to see a valid list"
    fi
else
    echo "No configuration specified to link"
fi
