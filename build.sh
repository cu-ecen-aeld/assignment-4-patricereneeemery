#!/bin/bash
set -e

TOPDIR="$(cd "$(dirname "$0")" && pwd)"

cd "$TOPDIR/buildroot"

if [ ! -f .config ]; then
    make BR2_EXTERNAL=../base_external aesd_defconfig
fi

make
