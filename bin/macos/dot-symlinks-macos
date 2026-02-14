#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/Brewfile" "$HOME/Brewfile"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/ghostty" "$HOME/.config/ghostty"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/ghostty/macos.conf" "$HOME/.config/ghostty/config-local"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/k9s" "$HOME/.config/k9s"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/.zshrc.macos" "$HOME/.zshrc"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/.zprofile.macos" "$HOME/.zprofile"
