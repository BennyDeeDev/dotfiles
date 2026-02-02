#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

source "$DOTFILES/bash/link"

link "$DOTFILES/Brewfile" "$HOME/Brewfile"
link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES/ghostty/macos.conf" "$HOME/.config/ghostty/config-local"
link "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES/.zshrc.macos" "$HOME/.zshrc"
link "$DOTFILES/.zprofile.macos" "$HOME/.zprofile"
