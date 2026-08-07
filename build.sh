#!/bin/sh
# Package the skill for upload to Claude chat.
set -e
cd "$(dirname "$0")"
mkdir -p dist
rm -f dist/travel-brief.zip
zip -r -q dist/travel-brief.zip travel-brief -x '*.DS_Store'
echo "dist/travel-brief.zip"
