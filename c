#!/bin/bash

OUT=`curl $*`
JSON=`echo "$OUT" | python -m json.tool`
if [ "0" = "$?" ]; then
  OUT=`echo "$JSON" | pygmentize -l javascript`
else
  XML=`echo "$OUT" | pygmentize -l xml`
  if [ "0" = "$?" ]; then
    OUT="$XML"
  fi
fi

echo "$OUT"
