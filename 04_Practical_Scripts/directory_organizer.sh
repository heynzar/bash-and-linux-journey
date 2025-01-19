#!/bin/bash

# directory_organizer.sh - Organizes files in a directory by type
# Usage: ./directory_organizer.sh [-d directory] [-v]

# Default values
target_dir="."
verbose=0

# Parse arguments
while [ $# -gt 0 ]; do
    case "$1" in
        -d|--directory)
            target_dir="$2"
            shift
            ;;
        -v|--verbose)
            verbose=1
            ;;
        -h|--help)
            echo "Usage: $0 [-d directory] [-v]"
            exit 0
            ;;
    esac
    shift
done

# Function to log messages
log_message() {
    if [ $verbose -eq 1 ]; then
        echo "$1"
    fi
}

# Create organization directories
declare -A file_types=(
    ["Images"]="jpg jpeg png gif bmp"
    ["Documents"]="pdf doc docx txt rtf odt"
    ["Audio"]="mp3 wav ogg m4a"
    ["Video"]="mp4 avi mkv mov wmv"
    ["Archives"]="zip rar tar gz 7z"
)

# Create directories
for dir in "${!file_types[@]}"; do
    if [ ! -d "$target_dir/$dir" ]; then
        mkdir -p "$target_dir/$dir"
        log_message "Created directory: $dir"
    fi
done

# Function to organize files
organize_files() {
    local count=0
    
    # Process each file
    for file in "$target_dir"/*; do
        if [ -f "$file" ]; then
            # Get file extension
            extension="${file##*.}"
            extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
            
            # Find appropriate directory
            for dir in "${!file_types[@]}"; do
                if [[ "${file_types[$dir]}" =~ $extension ]]; then
                    mv "$file" "$target_dir/$dir/"
                    log_message "Moved: $file -> $dir/"
                    ((count++))
                    break
                fi
            done
        fi
    done
    
    echo "Organized $count files"
}

# Run organization
organize_files

echo "Directory organization complete!"