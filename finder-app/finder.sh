#!/bin/bash

# Check arguments
if [ $# -ne 2 ]
then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Validate directory
if [ ! -d "$filesdir" ]
then
    echo "Directory $filesdir does not exist"
    exit 1
fi

# Count files and matching lines
file_count=$(find "$filesdir" -type f | wc -l)
match_count=$(grep -R "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"
