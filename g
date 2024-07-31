#!/bin/bash

###########################################################
# A shortcut for grep to find a case insensitive match of #
# a given term in the current directory, ignoring files   #
# in '.svn' folders.                                      #
############################################################

grep \
  --exclude='yarn.lock' \
  --exclude='yarn-error.log' \
  --exclude-dir='\.git' \
  --exclude-dir='\.yarn' \
  --exclude-dir='\.svn' \
  --exclude-dir='node_modules' \
  --exclude-dir='chunks' \
  --exclude-dir='dist' \
  -ir \
  "$@" * 2>/dev/null
