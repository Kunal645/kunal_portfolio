#!/bin/bash

set -e

export FLUTTER_ALLOW_ROOT=1

echo "Installing Flutter 3.29.0..."

git clone --depth 1 https://github.com/flutter/flutter.git /tmp/flutter

cd /tmp/flutter

git fetch --depth 1 origin 35c388afb57ef061d06a39b537336c87e0e3d1b1

git checkout 35c388afb57ef061d06a39b537336c87e0e3d1b1

echo "Flutter version:"

/tmp/flutter/bin/flutter --version

/tmp/flutter/bin/flutter config --enable-web

cd "$VERCEL_PROJECT_DIR"

echo "Getting dependencies..."

export PUB_CACHE=/tmp/pub-cache

/tmp/flutter/bin/flutter pub get

echo "Building Flutter Web..."

/tmp/flutter/bin/flutter build web --release

echo "Flutter Web build completed!"