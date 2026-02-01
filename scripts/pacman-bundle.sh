#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"
PACMANFILE="$DOTFILES/Pacmanfile"

[[ ! -f "$PACMANFILE" ]] && {
  echo "Pacmanfile not found at $PACMANFILE"
  exit 1
}

echo "Installing packages from Pacmanfile..."
paru -S --needed --noconfirm - < "$PACMANFILE"
