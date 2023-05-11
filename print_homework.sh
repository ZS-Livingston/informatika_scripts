#!/usr/bin/env bash

# This script prints all text files handed by students into one large file for easy checkup.

# find the homework directory. The result will be saved in its subdirectory homework.
printf "Please enter the absolute path of homework directory "
read -r directory
mkdir -p "$directory/homework"

# create the name for the result file.
printf "Please enter the name of homework assignment "
read -r homework

# Print the modeline into the log file so the code reads easier
printf "# vim: set syntax=python :\n" >"$directory/homework/$homework.log"

# Find the files
find -P "$directory" -type f -not -path "*/.*" -not -path "$directory/admin*" -not -path "$directory/homework*" -not -path '*/tutor' -not -path '*/tutor.cs*' -not -path '*/TEST*' -exec sh -c 'f="{}"; d="'"$directory"'"; f=${f#$d/}; printf "Processing %s\n" "$f"; cat "{}"; printf "\n"' \; >>"$directory/homework/$homework.log"

