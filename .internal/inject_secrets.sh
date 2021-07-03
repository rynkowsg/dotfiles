#!/usr/bin/env bash

# https://docs.datomic.com/cloud/dev-local.html#getting-started
sed -i "s|?HOME?|${HOME}|g" "${HOME}/.datomic/dev-local.edn"

RED=$(printf '\033[31m')
RESET=$(printf '\033[m')

printf "${RED}%s${RESET}\n" "Script can not handle secret entries."
printf "${RED}%s${RESET}\n" "Reason: CLI password manager has not been setup yet."
exit 1

COGNITECT_USER="?cognitect-username?"
COGNITECT_PASS="?cognitect-password?"
sed -i "s/${COGNITECT_USER}/REPLACEMENT/g" "${HOME}/.m2/settings.xml"
sed -i "s/${COGNITECT_PASS}/REPLACEMENT/g" "${HOME}/.m2/settings.xml"
