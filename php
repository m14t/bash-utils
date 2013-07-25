#!/bin/bash

#-- CONSTANTS
CONFIG_FILE=".phprc"
EXIT_NOPHP=1

#-- Find real path to me
ME="`readlink $0`"
if [ -z "$ME" ]; then
  ME="$0"
fi


#-- Find the first real php in our $PATH
BINS="`which -a php`"
for f in $BINS; do
  if [ "$ME" != "$f" ]; then
    PHP_BIN="$f";
    break;
  fi
done
if [ -z "${PHP_BIN}" ]; then
  exit $EXIT_NOPHP
fi

ORIG_DIR="$PWD"
#-- Find a .phprc file in the parent directory
if [ -f "${CONFIG_FILE}" ]; then
  source "${CONFIG_FILE}"
else
  while [ -n "${PWD##*/}" ]; do
    if [ -f "${CONFIG_FILE}" ]; then
      source "${CONFIG_FILE}"
      break;
    fi
    cd ..
  done
fi
cd "${ORIG_DIR}"

CMD="$PHP_BIN"

$CMD $@
