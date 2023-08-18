#!/usr/bin/env zsh

# debug log
printf "reading: %s\t\t\t($0)\n" "asdf.zsh"

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
