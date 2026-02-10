#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/scripts/symlink.sh" "$DOTFILES/hypr" "$HOME/.config/hypr"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty" "$HOME/.config/ghostty"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/ghostty/arch.conf" "$HOME/.config/ghostty/config-local"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/xdg-terminals.list" "$HOME/.config/xdg-terminals.list"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/uwsm" "$HOME/.config/uwsm"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/brave-flags.conf" "$HOME/.config/brave-flags.conf"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/waybar"  "$HOME/.config/waybar"
"$DOTFILES/scripts/symlink.sh" "$DOTFILES/k9s" "$HOME/.config/k9s"