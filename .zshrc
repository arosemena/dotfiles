# Locale
LC_CTYPE=en_US.utf8
LANG=en_US.utf8

PS1=" 🔱 > "

# Change to bash style word deletes
autoload -U select-word-style
select-word-style bash

# General aliases
alias vimi="vim +'PlugInstall --sync' +qa"

# Anything that is specific to this host should be in .envrc
if [ -f "$HOME/.envrc" ]; then
  source "$HOME/.envrc"
fi
