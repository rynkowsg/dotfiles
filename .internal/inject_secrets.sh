#!/usr/bin/env bash

# https://docs.datomic.com/cloud/dev-local.html#getting-started
sed -i "s|?HOME?|${HOME}|g" "${HOME}/.datomic/dev-local.edn"

COGNITECT_SERVER_ID="?cognitect-server-id?"
COGNITECT_USER="?cognitect-username?"
COGNITECT_PASS="?cognitect-password?"
sed -i "s/${COGNITECT_SERVER_ID}/$(pass show rynkowski/cognitect/maven/id)/g" "${HOME}/.m2/settings.xml"
sed -i "s/${COGNITECT_USER}/$(pass show rynkowski/cognitect/maven/username)/g" "${HOME}/.m2/settings.xml"
sed -i "s/${COGNITECT_PASS}/$(pass show rynkowski/cognitect/maven/password)/g" "${HOME}/.m2/settings.xml"
