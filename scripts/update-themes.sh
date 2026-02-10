#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/Repos/dotfiles"
OMARCHY="$HOME/Repos/omarchy"

if [[ ! -d $OMARCHY ]]; then
  echo "Error: $OMARCHY not found"
  exit 1
fi

if [[ ! -d $DOTFILES/themes ]]; then
  echo "Error: $DOTFILES/themes not found"
  exit 1
fi

echo "Updating extended themes from omarchy upstream..."
echo ""

cd "$OMARCHY"
git pull
echo ""

if [[ ! -d themes/catppuccin ]]; then
  echo "Error: catppuccin theme not found in omarchy"
  exit 1
fi

if [[ ! -d themes/catppuccin-latte ]]; then
  echo "Error: catppuccin-latte theme not found in omarchy"
  exit 1
fi

BACKUP_DIR=$(mktemp -d)

if [[ -d $DOTFILES/themes/catppuccin-extended ]]; then
  cp -r "$DOTFILES/themes/catppuccin-extended" "$BACKUP_DIR/catppuccin-extended"
fi

if [[ -d $DOTFILES/themes/catppuccin-latte-extended ]]; then
  cp -r "$DOTFILES/themes/catppuccin-latte-extended" "$BACKUP_DIR/catppuccin-latte-extended"
fi

echo "Updating catppuccin-extended..."
rm -rf "$DOTFILES/themes/catppuccin-extended"
cp -r "$OMARCHY/themes/catppuccin" "$DOTFILES/themes/catppuccin-extended"

if [[ -d $BACKUP_DIR/catppuccin-extended ]]; then
  for file in "$BACKUP_DIR/catppuccin-extended"/*; do
    filename=$(basename "$file")
    if [[ ! -f $OMARCHY/themes/catppuccin/$filename && ! -d $OMARCHY/themes/catppuccin/$filename ]]; then
      cp -r "$file" "$DOTFILES/themes/catppuccin-extended/"
    fi
  done
fi

echo "✓ catppuccin-extended updated"

echo "Updating catppuccin-latte-extended..."
rm -rf "$DOTFILES/themes/catppuccin-latte-extended"
cp -r "$OMARCHY/themes/catppuccin-latte" "$DOTFILES/themes/catppuccin-latte-extended"

if [[ -d $BACKUP_DIR/catppuccin-latte-extended ]]; then
  for file in "$BACKUP_DIR/catppuccin-latte-extended"/*; do
    filename=$(basename "$file")
    if [[ ! -f $OMARCHY/themes/catppuccin-latte/$filename && ! -d $OMARCHY/themes/catppuccin-latte/$filename ]]; then
      cp -r "$file" "$DOTFILES/themes/catppuccin-latte-extended/"
    fi
  done
fi

echo "✓ catppuccin-latte-extended updated"

rm -rf "$BACKUP_DIR"

echo ""
echo "Review changes: cd $DOTFILES && git diff themes/"
