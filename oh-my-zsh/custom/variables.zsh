# Setting environment variables
export EDITOR=/usr/bin/nvim
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/scripts:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch $(uname -m)"
export QT_QPA_PLATFORMTHEME="qt6ct"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
