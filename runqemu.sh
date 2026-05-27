#!/bin/bash
set -e

TOPDIR="$(cd "$(dirname "$0")" && pwd)"
IMAGES_DIR="$TOPDIR/buildroot/output/images"

KERNEL="$IMAGES_DIR/bzImage"
ROOTFS="$IMAGES_DIR/rootfs.ext2"

if [ ! -f "$KERNEL" ] || [ ! -f "$ROOTFS" ]; then
    echo "Kernel or root filesystem not found. Did you run ./build.sh?"
    exit 1
fi

qemu-system-x86_64 \
    -kernel "$KERNEL" \
    -drive file="$ROOTFS",format=raw,if=virtio \
    -append "root=/dev/vda rw console=ttyS0" \
    -nographic
