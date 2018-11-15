# Locale
LC_CTYPE=en_US.utf8
LANG=en_US.utf8

PS1=" 🔱 > "

# If an .envrc file exists load it
# put host specific stuff on it
if [ -f "$HOME/.envrc" ]; then
  source "$HOME/.envrc"
fi
