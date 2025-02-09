PS1=" 🔱 > "

autoload -Uz compinit && compinit
autoload -U select-word-style
select-word-style bash

alias x="source ~/dev/swx/switch.sh"
alias api="cd `~/dev/swx/api.sh`"
alias xd="cd ~/dev/swx/books"
alias vimx="~/dev/swx/vimx.sh && source ~/dev/swx/load.sh"
alias vimc="cd ~/.config/nvim/ && vim lua/arosemena/init.lua"

# Configure fzf to use ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g !.git/'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"

# Load env variables for the system
[ -s "$HOME/.env" ] && source "$HOME/.env"

# If swx is installed load it
[ -s "$HOME/dev/swx/load.sh" ] && source "$HOME/dev/swx/load.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"
set -o vi

alias week="cd ~/dev/data && node week"
alias year="cd ~/dev/data && node year"
alias est="cd ~/dev/data && node est"
alias nm="cd ~/dev/data && node est nm"
alias g="cd ~/dev/data && node goal"

alias clean-branches="git branch --merged | egrep -v \"(main|master|staging)\" | xargs git branch -d"

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

alias vim="nvim"

# pnpm
export PNPM_HOME="/Users/rob/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Users/rob/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
