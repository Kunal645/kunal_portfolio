#!/bin/bash

set -e

echo "Installing Flutter 3.29.0..."

git clone --depth 1 https://github.com/flutter/flutter.git /tmp/flutter

cd /tmp/flutter

git fetch --depth 1 origin 35c388afb57ef061d06a39b537336c87e0e3d1b1

git checkout 35c388afb57ef061d06a39b537336c87e0e3d1b1

echo "Patching Flutter root check..."

sed -i '/Woah! You appear to be trying to run flutter as root./,+4d' /tmp/flutter/bin/flutter

echo "Flutter version:"

/tmp/flutter/bin/flutter --version

/tmp/flutter/bin/flutter config --enable-web

cd "$VERCEL_PROJECT_DIR"

export PUB_CACHE=/tmp/pub-cache

echo "Getting dependencies..."

/tmp/flutter/bin/flutter pub get

echo "Building Flutter Web..."

/tmp/flutter/bin/flutter build web --release

echo "Flutter Web build completed!"