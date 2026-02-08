#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/scripts/symlink.sh" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/i3" "$HOME/.config/i3"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/alacritty" "$HOME/.config/alacritty"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/rofi" "$HOME/.config/rofi"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/polybar" "$HOME/.config/polybar"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
