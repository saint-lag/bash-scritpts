#!/bin/bash

# Get the names of all files in all subdirectories of the current directory

filetype=".pdf"

clean_type="s/$filetype$//"

get_names() {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then

            echo >> names.txt
            echo "$(basename "$file" $filetype)" >> names.txt
            echo >> names.txt
            get_names "$file"

        elif [[ "$file" == *$filetype ]]; then
            echo "$(basename "$file")" | sed $clean_type >> names.txt
        fi
    done
}

echo "Removing names.txt if it exists and creating a new one..." && echo

rm -f names.txt && touch names.txt

echo "Getting names of all pdf files in all subdirectories of the current directory..."

get_names "$PWD" 
