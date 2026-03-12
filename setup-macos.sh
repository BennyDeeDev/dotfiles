#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/Repos/dotfiles"

read -rp "Variant (personal/corp): " DOT_VARIANT
export DOT_VARIANT
[[ "$DOT_VARIANT" != "personal" && "$DOT_VARIANT" != "corp" ]] && echo "Invalid variant '$DOT_VARIANT'. Aborting." && exit 1

# Xcode CLI tools
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "Re-run this script after the installation completes."
  exit 0
fi

"$DOTFILES/install/brew.sh"

/opt/homebrew/bin/brew bundle --file="$DOTFILES/Brewfile"
/opt/homebrew/bin/brew bundle --file="$DOTFILES/Brewfile.$DOT_VARIANT"

"$DOTFILES/bin/common/dot-vscode-extensions"

"$DOTFILES/bin/macos/dot-symlinks-macos-$DOT_VARIANT"
"$DOTFILES/install/macos-write-defaults.sh"

if [[ "$DOT_VARIANT" == "corp" ]]; then
  cd "$DOTFILES" && "$DOTFILES/install/git-local-setup.sh"
fi

sudo reboot
