	#!/usr/bin/env bash

# Ask for the absolute path of the parent directory
printf "Enter the absolute path of the parent directory: "
read -r parent_directory

# The subdirectory and file containing the list of users
admin_subdirectory="admin"
user_list_file="user_list.txt"

# The directory and file to copy
printf "Enter the absolute path of directory containing the files to copy: "
read -r directory

# Check if the user_list file exists
if [[ -f "$parent_directory/$admin_subdirectory/$user_list_file" ]]; then
  while IFS= read -r line; do
    # Check if the subdirectory exists
    if [[ -d "$parent_directory/$line" ]]; then
      cp -a "$directory/." "$parent_directory/$line/"
    else
      printf "Error: Directory %s does not exist.\n" "$parent_directory/$line"
    fi
  done <"$parent_directory/$admin_subdirectory/$user_list_file"
else
  printf "Error: File %s does not exist.\n" "$parent_directory/$admin_subdirectory/$user_list_file"
fi
