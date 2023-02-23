#!/usr/bin/env bash

# debug log
[ "${RC_DEBUG}" = true ] && printf "reading: %s\t($0)\n" "bash_profile"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
