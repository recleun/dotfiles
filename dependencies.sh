#!/usr/bin/env bash
# fonts
sudo pacman -Sy otf-font-awesome ttf-cascadia-mono-nerd ttf-fantasque-nerd noto-fonts-cjk

# i3 window management
sudo pacman -S i3-wm xorg-xinit xorg-server xorg-xinput xorg-xsetroot xclip unclutter

# hyprland window management
sudo pacman -S hyprland hyprpaper hyprsunset grim xdg-desktop-portal-hyprland

# coding related
sudo pacman -S neovim kitty fish lazygit clang deno

# tools
sudo pacman -S unzip ripgrep fzf playerctl openssh htop jq socat imagemagick unrar

# must-haves
sudo pacman -S rofi fastfetch starship discord flameshot dunst

# rust toolchain
curl https://sh.rustup.rs -sSf | sh

# aur must haves
yay -S spotify rofi-greenclip

fish -c install-fisher
fish -c install-fisher nvm
