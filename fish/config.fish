set -gx EDITOR /usr/bin/nvim
set -gx PATH $HOME/bin $HOME/.local/bin /usr/local/bin $HOME/scripts $PATH
set -gx ARCHFLAGS -arch (uname -m)
set -gx NVM_DIR $HOME/.nvm

function nvm
    bash -c "source $NVM_DIR/nvm.sh; nvm $argv"
end

starship init fish | source