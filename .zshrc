# Locale
LC_CTYPE=en_US.utf8
LANG=en_US.utf8

PS1=" 🔱 > "

# Go env variables
export GOPATH="$HOME/dev/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

# Change to bash style word deletes
autoload -U select-word-style
select-word-style bash

source "$HOME/.envrc"
