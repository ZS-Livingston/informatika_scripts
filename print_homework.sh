#!/usr/bin/env bash

printf "Please enter the absolute path of homework directory "
read -r directory
mkdir -p "$directory/homework"

printf "Please enter the name of homework assignment "
read -r homework

printf "# vim: set syntax=python :\n" >"$directory/homework/$homework.log"

find -P "$directory" -type f -not -path "*/.*" -not -path "$directory/admin*" -not -path "$directory/homework*" -not -path '*/tutor' -not -path '*/tutor.cs*' -not -path '*/TEST*' -exec sh -c 'f="$1"; d="'"$directory"'"; f=${f#$d/}; fileType=$(file -b "$1"); if echo "$fileType" | grep -q text; then printf "Processing %s\n" "$f"; cat "$1"; printf "\n"; fi' _ {} \; >>"$directory/homework/$homework.log"

