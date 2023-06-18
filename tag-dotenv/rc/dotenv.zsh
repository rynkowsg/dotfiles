#!/usr/bin/env zsh

# based on https://stackoverflow.com/a/17060679
load_local_conf() {
  # check file exists, is regular file and is readable:
  if [[ -f .env && -r .env ]]; then
    printf "%s" "Detected .env. Loading... "
    source .env
    printf "\r%s\n\n" "Detected .env. Loading... DONE"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd load_local_conf
