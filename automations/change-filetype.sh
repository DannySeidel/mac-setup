#!/bin/bash

# Check that two parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 source_file_type target_file_type"
    exit 1
fi

# Assign source (input) file type and target (output) file type
src_type=$1
tgt_type=$2

# Loop through all files with the source file type in the current directory
for file in *$src_type; do

    # Get the file name without the extension
    base_name=$(basename "$file" $src_type)

    # Echo the file currently being handled
    echo "Converting $file to $base_name$tgt_type"

    # Convert the file to the target file type
    magick "$file" "$base_name$tgt_type"
done

