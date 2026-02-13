#!/bin/bash

# Install Homebrew package manager

set -euo pipefail

if command -v brew &>/dev/null; then
  echo "Homebrew is already installed"
  exit 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
