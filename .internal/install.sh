#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$([ -L "$0" ] && readlink "$0" || echo "$0")")" || exit 1; pwd -P)"
ROOT_DIR="${SCRIPT_DIR}/.."

# install dependencies
source "${ROOT_DIR}/.lib/install_dotfiles_deps" && install_dotfiles_deps "${ROOT_DIR}"

# link all the files

TMP_DIR=$(mktemp -d -t "dotfiles-$(date +%Y%m%d_%H%M%S)-XXXXXXXX")
INSTALL_SCRIPT="${TMP_DIR}/install.sh"

# rcup generates a shell script installing all the links
env RCRC="${ROOT_DIR}/rcrc" rcup -B 0 -g > "${INSTALL_SCRIPT}"

printf "%s\n" "---------------------------------------------------------------"
printf "%s\n" "---               GENERATED SCRIPT                         ----"
printf "%s\n" "---------------------------------------------------------------"
cat "${INSTALL_SCRIPT}"
printf "%s\n" "---------------------------------------------------------------"
#read -p "Ready to continue? " yes_no

# execute the script answering yes to any override questions
yes | env VERBOSE=1 sh "${INSTALL_SCRIPT}"

rm -rf "${TMP_DIR}"

bash "${ROOT_DIR}/.internal/inject_secrets.sh"
