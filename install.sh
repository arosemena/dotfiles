#!/bin/bash


# Change to the script's dir
cd "${0%/*}"

echo -e " 🚀 Starting install \n"

copy_if_not_there() {
  if [ -f "$HOME/$1" ] || [ -d "$HOME/$1" ]; then
    echo " ⚠️  $1 detected, skipping..."
  else
    cp -r ./$1 "$HOME/$1"
    echo " ✅ $1 copied!"
  fi
}

copy_if_not_there ".zshrc" # zsh
copy_if_not_there ".psqlrc" # psql
copy_if_not_there ".gitconfig" # git
copy_if_not_there ".hushlogin" # hush!
copy_if_not_there "kitty.conf" # kitty settings
copy_if_not_there ".taskrc" # taskwarrior
copy_if_not_there ".tmux.conf" # tmux
copy_if_not_there ".config/nvim" # neovim

# Install Packer
echo -e "\n 🤖 Installing nvim Packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo -e "\n ✅ All done! \n"
