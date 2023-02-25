#!/usr/bin/env bash

printf "reading: %s\t\t\t($0)\n" "bashrc" >> ~/.dotfiles_log

# Load commons among shells
[ -f ~/.dotfiles/commonrc ] && source ~/.dotfiles/commonrc
