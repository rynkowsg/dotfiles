#!/usr/bin/env bash

SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd -P)"

curl -L https://iterm2.com/shell_integration/bash -o ${SCRIPT_PATH}/iterm2_shell_integration.bash
curl -L https://iterm2.com/shell_integration/tcsh -o ${SCRIPT_PATH}/iterm2_shell_integration.tcsh
curl -L https://iterm2.com/shell_integration/zsh -o ${SCRIPT_PATH}/iterm2_shell_integration.zsh
curl -L https://iterm2.com/shell_integration/fish -o ${SCRIPT_PATH}/iterm2_shell_integration.fish
