#!/usr/bin/env bash

# update repo
git fetch -p origin
git rebase -i origin/master
git submodule update --init --recursive

# install all the links again
SCRIPT_DIR="$(cd "$(dirname "$([ -L "$0" ] && readlink "$0" || echo "$0")")" || exit 1; pwd -P)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"
bash "${ROOT_DIR}/bin/install.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # update packages
  brew update
  brew upgrade
  softwareupdate --all --install --force
fi

# Remind to update oh-my-zsh
GREEN="\e[0;92m"; RESET="\e[0m" # https://techstop.github.io/bash-script-colors/
printf "${GREEN}%s\n" "To update oh-my-zsh call:"
printf "%s${RESET}\n" "  omz update"
