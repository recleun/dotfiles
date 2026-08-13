set -gx EDITOR /usr/bin/nvim
set -gx PATH $HOME/bin $HOME/.local/bin /usr/local/bin $HOME/scripts $PATH
set -gx ARCHFLAGS -arch (uname -m)
set fish_greeting

fish_vi_key_bindings

starship init fish | source

fish_add_path /home/recleun/.spicetify
