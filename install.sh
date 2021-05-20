#set -x

SCRIPT_DIR="$(cd "$(dirname "$0")" || exit 1; pwd -P)"
DOTFILES_DIR="${SCRIPT_DIR}"

TMP_DIR=$(mktemp -d -t "dotfiles-$(date +%Y%m%d_%H%M%S)-")
INSTALL_SCRIPT="${TMP_DIR}/install.sh"

# rcup generates a shell script installing all the links
env RCRC="${DOTFILES_DIR}/rcrc" rcup -B 0 -g > "${INSTALL_SCRIPT}"

printf "%s\n" "---------------------------------------------------------------"
printf "%s\n" "---               GENERATED SCRIPT                         ----"
printf "%s\n" "---------------------------------------------------------------"
cat "${INSTALL_SCRIPT}"
printf "%s\n" "---------------------------------------------------------------"
#read -p "Ready to continue? " yes_no

# execute the script answering yes to any override questions
yes | env VERBOSE=1 sh "${INSTALL_SCRIPT}"

rm -rf "${TMP_DIR}"

#set +x
