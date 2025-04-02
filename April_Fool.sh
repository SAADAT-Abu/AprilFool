#!/bin/bash

# ─────────────────────────────────────────────────────────────
# 🎭 April_Fool.sh - Fool your pipeline with placeholders 🎭
# Author: [Your Name or GitHub Handle]
# Description: Moves or replaces large intermediate files with empty placeholders
#              to save disk space during pipeline runs.
# Date: April 1st, forever.
# ─────────────────────────────────────────────────────────────

# 🧪 Usage message
usage() {
    echo -e "\n  \033[1mUsage:\033[0m"
    echo "  ./April_Fool.sh -i /path/to/output_dir [-d /path/to/destination_dir] [-m]"
    echo ""
    echo "  Options:"
    echo "  -i    Input/output directory (where pipeline writes files)"
    echo "  -d    Destination directory (e.g., external HDD)"
    echo "  -m    Move files to destination (optional, default is to just replace)"
    echo "  -h    Show this help message"
    echo ""
    echo "  Example:"
    echo "  ./April_Fool.sh -i /mnt/data/output -d /mnt/external/hdd -m"
    exit 1
}

# Color functions
info()    { echo -e "\033[1;34m[INFO]\033[0m $1"; }
success() { echo -e "\033[1;32m[SUCCESS]\033[0m $1"; }
warn()    { echo -e "\033[1;33m[WARNING]\033[0m $1"; }
error()   { echo -e "\033[1;31m[ERROR]\033[0m $1"; }

# Argument parsing
MOVE=false
while getopts ":i:d:mh" opt; do
    case ${opt} in
        i ) INPUT_DIR="$OPTARG" ;;
        d ) DEST_DIR="$OPTARG" ;;
        m ) MOVE=true ;;
        h ) usage ;;
        \? ) error "Invalid option: -$OPTARG" ; usage ;;
        : ) error "Option -$OPTARG requires an argument." ; usage ;;
    esac
done

# Validation
if [[ -z "$INPUT_DIR" ]]; then
    error "Input directory is required."
    usage
fi

if [[ "$MOVE" == true && -z "$DEST_DIR" ]]; then
    error "Destination directory is required when using -m option."
    usage
fi

if [[ ! -d "$INPUT_DIR" ]]; then
    error "Input directory does not exist."
    exit 1
fi

if [[ "$MOVE" == true && ! -d "$DEST_DIR" ]]; then
    warn "Destination directory does not exist. Creating it..."
    mkdir -p "$DEST_DIR"
fi

info "Starting April_Fool script "
info "Mode: $( [ "$MOVE" == true ] && echo "MOVE files and replace with placeholders" || echo "Just replace with placeholders")"
info "Scanning: $INPUT_DIR"

# Main loop
find "$INPUT_DIR" -type f | while read -r file; do
    rel_path="${file#$INPUT_DIR/}"
    dir_path=$(dirname "$file")

    if [[ "$MOVE" == true ]]; then
        dest_path="$DEST_DIR/$rel_path"
        mkdir -p "$(dirname "$dest_path")"
        mv "$file" "$dest_path"
        touch "$file"
        success "Moved & replaced: $rel_path"
    else
        > "$file"  # Empty the file
        success "Wiped content: $rel_path"
    fi
done

info "Done! Your pipeline has been officially April-Fooled."
