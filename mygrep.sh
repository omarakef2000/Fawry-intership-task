#!/bin/bash

options=""
search=""
file=""
if [[ "$1" == "--help" ]]; then
  echo "Usage: $0 [-n] [-v] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers"
  echo "  -v    Invert match (show non-matching lines)"
  echo "  --help  Show this help message"
  exit 0
fi
 
while [[ "$1" == -* ]]; do
  if [[ "$1" == *n* ]]; then
    options="$options -n"
  fi
  if [[ "$1" == *v* ]]; then
    options="$options -v"
  fi
  shift
done

search="$1"
file="$2"

if [[ -z "$search" || -z "$file" ]]; then
  echo "Usage: $0 [-n] [-v] search_string filename"
  exit 1
fi

grep -i $options "$search" "$file"
