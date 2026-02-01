#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

source "$DOTFILES/bash/link"

link "$DOTFILES/hypr" "$HOME/.config/hypr"
link "$DOTFILES/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES/ghostty/arch.conf" "$HOME/.config/ghostty/config-local"
link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
link "$DOTFILES/.p10k.zsh"   "$HOME/.p10k.zsh"
# link "$DOTFILES/waybar"  "$HOME/.config/waybar"