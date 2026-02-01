#!/bin/bash

set -e

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
  echo "Error: zsh is not installed. Install it first (e.g., paru -S zsh)"
  exit 1
fi

# Change default shell to zsh if not already
if [[ "$SHELL" != */zsh ]]; then
  echo "Changing default shell to zsh..."
  chsh -s "$(command -v zsh)"
fi

# Install oh-my-zsh (keep existing .zshrc if present, skip shell change prompt)
KEEP_ZSHRC=yes CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Starting zsh..."
exec zsh