#!/usr/bin/env bash

# debug log
printf "reading: %s\t\t\t($0)\n" "terraform.bash" >> ~/.dotfiles_log

# completion
complete -C "$(asdf which terraform)" terraform
