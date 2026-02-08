#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/scripts/symlink.sh" "$DOTFILES/Brewfile" "$HOME/Brewfile"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty" "$HOME/.config/ghostty"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty/macos.conf" "$HOME/.config/ghostty/config-local"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/k9s" "$HOME/.config/k9s"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/.zshrc.macos" "$HOME/.zshrc"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/.zprofile.macos" "$HOME/.zprofile"
