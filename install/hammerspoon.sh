#!/bin/bash

# Bootstrap Hammerspoon: install SpoonInstall (required to load init.lua)
# PaperWM.spoon is then installed automatically by SpoonInstall on first launch.

set -euo pipefail

SPOONS_DIR="$HOME/.hammerspoon/Spoons"
mkdir -p "$SPOONS_DIR"

if [[ -d "$SPOONS_DIR/SpoonInstall.spoon" ]]; then
  echo "SpoonInstall.spoon already present, skipping."
else
  echo "Downloading SpoonInstall.spoon..."
  curl -fsSL https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip \
    -o /tmp/SpoonInstall.spoon.zip
  unzip -q /tmp/SpoonInstall.spoon.zip -d "$SPOONS_DIR"
  rm /tmp/SpoonInstall.spoon.zip
fi

echo "Done. Launch Hammerspoon and grant Accessibility access in System Settings."