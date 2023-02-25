#!/usr/bin/env sh

# debug log
printf "reading: %s\t\t($0)\n" "setup_gcp" >> ~/.dotfiles_log

# Setup   # TODO: Correct for Linux
GOOGLE_CLOUD_HOME="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
# shellcheck disable=SC2039
if [ -n "$BASH_VERSION" ]; then
  source "${GOOGLE_CLOUD_HOME}/path.bash.inc"
  source "${GOOGLE_CLOUD_HOME}/completion.bash.inc"
elif [ -n "$ZSH_VERSION" ]; then
  source "${GOOGLE_CLOUD_HOME}/path.zsh.inc"
  source "${GOOGLE_CLOUD_HOME}/completion.zsh.inc"
elif [ -n "$FISH_VERSION" ]; then
  source "${GOOGLE_CLOUD_HOME}/path.fish.inc"
fi
