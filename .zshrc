# Locale
LC_CTYPE=en_US.utf8
LANG=en_US.utf8

PS1=" 🔱 > "

autoload -Uz compinit && compinit
autoload -U select-word-style
select-word-style bash

# General aliases
alias vimi="vim +'PlugInstall --sync' +qa"

alias x="source ~/dev/swx/switch.sh"
alias vimx="~/dev/swx/vimx.sh"

# Configure fzf to use ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g !.git/'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


# Load env variables for the system
[ -s "$HOME/.env" ] && source "$HOME/.env"

# If swx is installed load it
[ -s "$HOME/dev/swx/load.sh" ] && source "$HOME/dev/swx/load.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator/emulator
