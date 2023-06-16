#!/usr/bin/env bash

# debug log
printf "reading: %s\t\t\t($0)\n" "asdf.bash" >> ~/.dotfiles_log

. "$HOME/.asdf/asdf.sh"

. "$HOME/.asdf/completions/asdf.bash"
