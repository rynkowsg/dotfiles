#!/usr/bin/env zsh

# debug log
[ "${RC_DEBUG}" = true ] && printf "reading: %s\t\t\t($0)\n" "bb.zsh"

if ! command -v compinit > /dev/null; then
  autoload -Uz compinit
  compinit
fi

_bb_tasks() {
  local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
  compadd -a matches
  _files # autocomplete filenames as well
}
compdef _bb_tasks bb

# More: https://book.babashka.org/#_zsh
