#!/bin/sh

# Locate files in current directory, or directory argument, containing trailing whitespace

D=${1:-`pwd`}

if [ ! -d "$D" ]; then
  echo "Directory ($D) not accessible."
  exit 1
fi

/bin/find "$D" -type f -print0 | xargs -n1 -0 /bin/perl -ne 'if (/[ \t]+\r?$/) {print "$ARGV\n"; exit(1);}' 

