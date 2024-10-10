#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Linking fish"
ln -s $SCRIPT_DIR/fish ~/.config/
echo "Linking eww"
ln -s $SCRIPT_DIR/eww ~/.config/
echo "Linking flameshot"
ln -s $SCRIPT_DIR/flameshot ~/.config/
echo "Linking hypr"
ln -s $SCRIPT_DIR/hypr ~/.config/
echo "Linking kitty"
ln -s $SCRIPT_DIR/kitty ~/.config/
echo "Linking nvim"
ln -s $SCRIPT_DIR/nvim ~/.config/
echo "Linking rofi"
ln -s $SCRIPT_DIR/rofi ~/.config/
echo "Linking vifm"
ln -s $SCRIPT_DIR/vifm ~/.config/
echo "Linking waybar"
ln -s $SCRIPT_DIR/waybar ~/.config/
echo "Linking oh-my-zsh"
ln -s $SCRIPT_DIR/oh-my-zsh/custom ~/.oh-my-zsh/
echo "Linking scripts"
ln -s $SCRIPT_DIR/scripts ~/
