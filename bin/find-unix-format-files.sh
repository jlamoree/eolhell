#!/bin/sh

# Locate files in current directory, or directory argument, in Unix format (\n for EOL)

D=${1:-`pwd`}

if [ ! -d "$D" ]; then
  echo "Directory ($D) not accessible."
  exit 1
fi

/bin/find "$D" -type f -print0 | xargs -n1 -0 /bin/perl -ne 'BEGIN {undef $/;} m/[^ \r]\n/s && print "$ARGV\n"' 

