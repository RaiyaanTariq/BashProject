#!/bin/bash

show() {
    echo "File Organizer"
    echo "Usage: $0 -d <directory> [-t] [-h]"
    echo "Options:"
    echo "  -d <directory>  Directory to organize"
    echo "  -t              Organize files by type (default: by date)"
    echo "  -h              Display help message"
}
# Check for arguments
if [[ $# -eq 0 ]]; 
then
    show
    exit 1
fi

# Analyze 
while getopts "d:th" opt; 
do
    case $opt in
        d) target_directory="$OPTARG" ;;
        t) organize_by_type=true ;;
        h) show; exit 0 ;;
        *) show; exit 1 ;;
    esac
done

# Is the directory is valid
if [[ -z $target_directory || ! -d $target_directory ]]; 
then
    echo "Error: Invalid directory."
    show
    exit 1
fi

# Organization 
for file in "$target_directory"/*; 
do
    [[ -f $file ]] || continue
    if [[ $organize_by_type ]]; 
    then
        ext="${file##*.}"
        mkdir -p "$target_directory/$ext"
        mv "$file" "$target_directory/$ext/"
    else
        date_dir=$(date -r "$file" +'%Y-%m-%d')
        mkdir -p "$target_directory/$date_dir"
        mv "$file" "$target_directory/$date_dir/"
    fi
done

