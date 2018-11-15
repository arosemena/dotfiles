#!/bin/bash

# Flags to determine what to install
profile=1
vim=1
psql=1

# Check if the files exists and ask before overwriting them
if [ -f "$HOME/.vimrc" ]; then
  read -p ".vimrc detected, install anyways? y/n: " -n 1 -r
  if [[ $REPLY != "y" ]]; then
   vim=0    
  fi
  echo
fi

if [ -f "$HOME/.bash_profile" ]; then
  read -p ".bash_profile detected, overwrite? y/n: " -n 1 -r
  if [[ $REPLY != "y" ]]; then
    profile=0
  fi
  echo
fi

if [ -f "$HOME/.psqlrc" ]; then
  read -p ".psqlrc detected, overwrite? y/n: " -n 1 -r
  if [[ $REPLY != "y" ]]; then
    psql=0
  fi
  echo
fi

# Switch to the directory of the provision script
cd "${0%/*}"
echo

# install things based on the flags
if [ -n $vim ]; then
  cp -r .vim "$HOME"
  cp .vimrc "$HOME"
  echo "vim installed!"
fi

if [ -n $profile ]; then
  cp .bash_profile "$HOME"
  echo "bash_profile installed!"
fi

if [ -n $psql ]; then
  cp .psqlrc "$HOME"
  echo "psqlrc installed"
fi
