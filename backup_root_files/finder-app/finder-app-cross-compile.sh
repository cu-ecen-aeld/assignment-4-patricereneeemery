#!/bin/bash
# Cross-compile the writer application for ARM

set -e
set -u

# Default cross-compiler prefix
CROSS_COMPILE=arm-linux-gnueabihf-

# Check if the compiler exists
if ! command -v ${CROSS_COMPILE}gcc >/dev/null 2>&1
then
    echo "ERROR: ARM cross-compiler '${CROSS_COMPILE}gcc' not found."
    echo "Install it with:"
    echo "  sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf"
    exit 1
fi

# Build the writer application
echo "Compiling writer.c for ARM..."
${CROSS_COMPILE}gcc -Wall -Werror -o writer writer.c

echo "Cross-compile complete. Output: ./writer"
