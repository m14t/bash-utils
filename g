#!/bin/bash

###########################################################
# A shortcut for grep to find a case insensitive match of #
# a given term in the current directory, ignoring files   #
# in '.svn' folders.                                      #
############################################################

grep \
  --exclude-dir='\.git' \
  --exclude-dir='\.svn' \
  --exclude-dir='node_modules' \
  -ir \
  "$@" * 2>/dev/null
