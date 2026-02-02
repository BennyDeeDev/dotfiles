#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

source "$DOTFILES/bash/link"

link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/i3" "$HOME/.config/i3"
link "$DOTFILES/alacritty" "$HOME/.config/alacritty"
link "$DOTFILES/rofi" "$HOME/.config/rofi"
link "$DOTFILES/polybar" "$HOME/.config/polybar"
link "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
