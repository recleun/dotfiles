#!/usr/bin/env bash
# fonts
sudo pacman -Sy ttf-font-awesome ttf-cascadia-mono-nerd ttf-fantasque-nerd noto-fonts-cjk

# window management
sudo pacman -S i3-wm xorg-xinit xorg-server xorg-xinput xorg-xsetroot xclip unclutter dunst

# coding related
sudo pacman -S neovim kitty fish lazygit clang deno

# tools
sudo pacman -S unzip ripgrep fzf playerctl openssh htop jq socat imagemagick

# must-haves
sudo pacman -S rofi fastfetch starship discord flameshot 

curl https://sh.rustup.rs -sSf | sh

# aur Must haves
yay -S spotify rofi-greenclip

spotify & sleep 15; kill -INT %+
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh

fish -c install-fisher
fish -c install-fisher nvm
