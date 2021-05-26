#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$([ -L "$0" ] && readlink "$0" || echo "$0")")" || exit 1; pwd -P)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"

SRC="${HOME}"
#DEST="${HOME}/Desktop/backup"
DEST="/Volumes/BACKUP"

LOG_DIR="${ROOT_DIR}/bin/log"
CONFIG_FILE="${ROOT_DIR}/bin/list.bom"
mkdir -p "${LOG_DIR}"
rsync --rsync-path="sudo rsync" --perms --recursive \
  --compress --numeric-ids --links --hard-links \
  --log-file="${LOG_DIR}/backup.log" --human-readable --verbose \
  --exclude "cache" --exclude "Firefox/Profiles/*/storage" \
  --exclude "Firefox/Profiles/*/datareporting" --exclude "Firefox/Profiles/*/crashes" \
  --exclude "Firefox/Crash Reports" \
  --files-from="${CONFIG_FILE}" "${SRC}" "${DEST}"
