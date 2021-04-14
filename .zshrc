# Locale
LC_CTYPE=en_US.utf8
LANG=en_US.utf8

PS1=" 🔱 > "

# Change to bash style word deletes
autoload -U select-word-style
select-word-style bash

# General aliases
alias vimi="vim +'PlugInstall --sync' +qa"

# Configure fzf to use ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g !.git/'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# to make kitty work with ssh
TERM=xterm-256color

# Anything that is specific to this host should be in .envrc
if [ -f "$HOME/.envrc" ]; then
  source "$HOME/.envrc"
fi
