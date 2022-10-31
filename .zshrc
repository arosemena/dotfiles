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
alias xd="cd ~/dev/swx/books"
alias vimx="~/dev/swx/vimx.sh && source ~/dev/swx/load.sh"

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
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator/emulator

export GPG_TTY=$(tty)

# Function to identify processes using ports
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}
