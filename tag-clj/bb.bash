#!/usr/bin/env bash

# debug log
[ "${RC_DEBUG}" = true ] && printf "reading: %s\t\t($0)\n" "bb.bash"

_bb_tasks() {
    COMPREPLY=( $(compgen -W "$(bb tasks |tail -n +3 |cut -f1 -d ' ')" -- ${COMP_WORDS[COMP_CWORD]}) );
}
# autocomplete filenames as well
complete -f -F _bb_tasks bb

# More: https://book.babashka.org/#_bash
