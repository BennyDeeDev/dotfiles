#!/bin/bash

# Install paru AUR helper

set -euo pipefail

if command -v paru &>/dev/null; then
  echo "paru is already installed"
  exit 0
fi

echo "Installing base development tools..."
sudo pacman -S --needed base-devel git

echo "Installing rustup..."
sudo pacman -S --needed rustup
rustup default stable

echo "Cloning paru repository..."
tmpdir=$(mktemp -d)
git clone https://aur.archlinux.org/paru.git "$tmpdir"

echo "Building and installing paru..."
cd "$tmpdir"
makepkg -si

echo "Cleaning up..."
rm -rf "$tmpdir"

echo "paru installed successfully"
