#!/usr/bin/env bash

printf "Please enter the absolute path of homework directory "
read -r directory
mkdir -p "$directory/homework"

printf "Please enter the name of homework assignment "
read -r homework

printf "# vim: set syntax=python :\n" >"$directory/homework/$homework.log"

# Store the result of find command into an array
mapfile -t files < <(find -P "$directory" -type f -not -path "*/.*" -not -path "$directory/admin*" -not -path "$directory/homework*" -not -path '*/tutor' -not -path '*/tutor.cs*' -not -path '*/TEST*')

# Process each file
for f in "${files[@]}"; do
    f=${f#$directory/}
    fileName=$(basename "$f")
    fileType=$(file -b "$directory/$f")
    if echo "$fileType" | grep -q text; then
        if [ ! -f "$directory/homework/$fileName" ]; then
            printf "Processing %s\n" "$f"
            cat "$directory/$f"
            printf "\n"
        fi
    fi
done >>"$directory/homework/$homework.log"
