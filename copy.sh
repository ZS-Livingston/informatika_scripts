#!/usr/bin/env bash

printf "Enter the absolute path of directory containing the files to copy: "
read -r directory

printf "Enter the file containing the list of users: "
read -r user_list

while IFS= read -r line; do
cp -a "$directory/." "$line/"
done <"$user_list" 
