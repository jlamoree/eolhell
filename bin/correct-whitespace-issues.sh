#!/bin/sh

# Given a filename, this will remove trailing whitespace. It uses a temp file, rather than editing in-place.

TF=`mktemp`
F="$1"

if [ ! -r "$F" ]; then
  echo "File not readable: $F"
  exit 1
elif [ ! -w "$F" ]; then
  echo "File not writable: $F"
  exit 1
fi

/bin/perl -pe 's/[ \t]+(\r?)$/$1/g' "$F" > $TF && mv $TF "$F"
/bin/perl -pe 's/^( +)\t/\t/g' "$F" > $TF && mv $TF "$F"

