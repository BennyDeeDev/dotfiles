#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

echo "Installing packages from Pacmanfile..."
paru -S --needed --noconfirm - < "$DOTFILES/Pacmanfile"
