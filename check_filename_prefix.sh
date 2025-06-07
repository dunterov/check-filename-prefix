#!/bin/bash

# parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        --prefix)
            prefix="$2"
            shift 2
            ;;
        *)
            files+=("$1")
            shift
            ;;
    esac
done

# Check if prefix is specified
if [[ -z "$prefix" ]]; then
    echo "Error: --prefix argument is required." >&2
    exit 2
fi

status=0

# Loop over files array
for file in "${files[@]}"; do
    basename=$(basename "$file")

    if [[ ! "$basename" =~ ^$prefix ]]; then
        echo "Invalid file name: \"$file\". File names must start with \"$prefix\"." >&2
        status=1
    fi

done

exit $status
 