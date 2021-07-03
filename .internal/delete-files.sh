#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$([ -L "$0" ] && readlink "$0" || echo "$0")")" || exit 1; pwd -P)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"

BASE_DIR="${HOME}"
SRC="${BASE_DIR}"
DEST="${HOME}/Desktop/deleted"

# copy files
LOG_DIR="${ROOT_DIR}/bin/log"
CONFIG_FILE="${ROOT_DIR}/bin/list.bom"
mkdir -p "${LOG_DIR}"
rsync --rsync-path="sudo rsync" --perms --recursive \
  --compress --numeric-ids --links --hard-links \
  --log-file="${LOG_DIR}/backup.log" --human-readable --verbose \
  --files-from="${CONFIG_FILE}" "${SRC}" "${DEST}"

# delete original files
cat "${CONFIG_FILE}" | grep -v -e "^# *" -e "^$" > file-to-delete.txt

cat file-to-delete.txt | while IFS= read -r line;
  do
    echo deleting "${BASE_DIR}/${line}"
    rm -rfv "${BASE_DIR}/${line}";
  done
