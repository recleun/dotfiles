#!/usr/bin/env bash
sudo pacman -Sy neovim i3-wm xorg-xinit xorg-server xorg-xinput xorg-xsetroot lazygit kitty rofi fastfetch clang deno starship discord unzip dunst flameshot xclip ripgrep fzf ttf-cascadia-mono-nerd playerctl openssh noto-fonts-cjk unclutter htop fish jq socat ttf-font-awesome

curl https://sh.rustup.rs -sSf | sh

yay -S rofi-greenclip

yay -S spotify
spotify & sleep 15; kill -INT %+
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh

fish -c install-fisher
fish -c install-fisher nvm
