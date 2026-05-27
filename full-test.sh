#!/bin/bash
set -e

TOPDIR="$(cd "$(dirname "$0")" && pwd)"
cd "$TOPDIR"

./build.sh
