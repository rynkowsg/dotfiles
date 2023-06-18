#!/usr/bin/env zsh

# debug log
printf "reading: %s\t\t\t($0)\n" "terraform.bash" >> ~/.dotfiles_log

# completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C "$(asdf which terraform)" terraform
