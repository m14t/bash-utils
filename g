#!/bin/bash

###########################################################
# A shortcut for grep to find a case insensitive match of #
# a given term in the current directory, ignoring files   #
# in '.svn' folders.                                      #
############################################################

grep -ir --exclude-dir='\.svn' "$@" * 2>/dev/null
