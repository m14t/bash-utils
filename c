#!/bin/bash

OUT=`curl $*`

# Set OUT to formatted JSON if possible
JSON=`echo "$OUT" | python -m json.tool`
if [ "0" = "$?" ]; then
  OUT=$JSON
fi

if [ "0" = "`which pygmentize`" ]; then
  if [ "0" = "$?" ]; then
    OUT=`echo "$JSON" | pygmentize -l javascript`
  else
    XML=`echo "$OUT" | pygmentize -l xml`
    if [ "0" = "$?" ]; then
      OUT="$XML"
    fi
  fi
fi

echo "$OUT"
