#!/bin/bash
set -e

TOPDIR="$(cd "$(dirname "$0")" && pwd)"
cd "$TOPDIR"

CONFIG_SRC="buildroot/.config"
CONFIG_DST="conf/aesd_buildroot_defconfig"

if [ ! -f "$CONFIG_SRC" ]; then
    echo "No buildroot .config found. Run ./build.sh first."
    exit 1
fi

cp "$CONFIG_SRC" "$CONFIG_DST"
echo "Saved config to $CONFIG_DST"
