#!/usr/bin/env bash

# This script prints all full paths of text files handed by students into one large file for easy checkup.

# find the homework directory. The result will be saved in its subdirectory homework.
printf "Please enter the absolute path of homework directory "
read -r directory
mkdir -p "$directory/homework"

# create the name for the result file.
printf "Please enter the name of homework file list "
read -r homework

# Append the file paths to the log file
find -P "$directory" -type f -not -path "*/.*" -not -path "$directory/admin*" -not -path "$directory/homework*" -not -path '*/tutor' -not -path '*/tutor.cs*' -not -path '*/TEST*' -exec sh -c 'f="{}"; printf "%s\n" "$f"' \; >"$directory/homework/$homework.log"

