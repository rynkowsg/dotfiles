#!/usr/bin/env bash

[ "${RC_DEBUG}" = true ] && printf "reading: %s\t\t\t($0)\n" "bashrc"

# Load commons among shells
[ -f ~/.dotfiles/commonrc ] && source ~/.dotfiles/commonrc
