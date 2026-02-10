#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/scripts/symlink.sh" "$DOTFILES/hypr" "$HOME/.config/hypr"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty" "$HOME/.config/ghostty"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty/arch.conf" "$HOME/.config/ghostty/config-local"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/waybar"  "$HOME/.config/waybar"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/k9s" "$HOME/.config/k9s"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/themes/catppuccin-extended" "$HOME/.config/omarchy/themes/catppuccin-extended"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/themes/catppuccin-latte-extended" "$HOME/.config/omarchy/themes/catppuccin-latte-extended"