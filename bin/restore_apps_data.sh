#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$([ -L "$0" ] && readlink "$0" || echo "$0")")" || exit 1; pwd -P)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"

SRC="/Volumes/BACKUP"
#DEST="${HOME}/Desktop/backup"
DEST="${HOME}"

LOG_DIR="${ROOT_DIR}/bin/log"
CONFIG_FILE="${ROOT_DIR}/bin/list.bom"
mkdir "${LOG_DIR}"
rsync --rsync-path="sudo rsync" --perms --recursive \
  --compress --numeric-ids --links --hard-links \
  --log-file="${LOG_DIR}/backup.log" --human-readable --verbose \
  --exclude "cache" --exclude "Firefox/Profiles/*/storage" \
  --files-from="${CONFIG_FILE}" "${SRC}" "${DEST}"
