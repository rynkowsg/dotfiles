#!/usr/bin/env bash

# debug log
printf "reading: %s\t\t\t($0)\n" "bb.bash" >> ~/.dotfiles_log

_bb_tasks() {
    COMPREPLY=( $(compgen -W "$(bb tasks |tail -n +3 |cut -f1 -d ' ')" -- ${COMP_WORDS[COMP_CWORD]}) );
}
# autocomplete filenames as well
complete -f -F _bb_tasks bb

# More: https://book.babashka.org/#_bash
