#!/usr/bin/env bash

read -e -rp "Please enter the absolute path of class directory: " directory
directory="${directory//\\ / }"
mkdir -p "${directory}/homework"

read -rp "Please enter the name of homework assignment: " homework

# Create homework .log file and set syntax to python
printf "# vim: set syntax=python :\n\n" > "${directory}/homework/${homework}.log"

# Store the result of find command into an array
mapfile -t files < <(find -P "${directory}" -type f -not -path "*/.*" -not -path "${directory}/admin*" -not -path "${directory}/homework*" -not -path '*/tutor' -not -path '*/tutor.cs*' -not -path '*/TEST*')

# Process each file
for f in "${files[@]}"; do
    fileType=$(file -b -- "$f")
    if echo "$fileType" | grep -q text; then
    	fileName=$(basename -- "$f")
        if [ ! -f "${directory}/homework/$fileName" ]; then
    	    relativePath=$(echo "$f" | sed "s|${directory}/||")
            printf "\nProcessing # %s\n\n" "$relativePath" >> "${directory}/homework/${homework}.log"
            cat "$f" >> "${directory}/homework/${homework}.log"
        fi
    fi
done
