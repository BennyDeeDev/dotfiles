#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/hypr" "$HOME/.config/hypr"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/ghostty" "$HOME/.config/ghostty"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/ghostty/arch.conf" "$HOME/.config/ghostty/config-local"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/nvim" "$HOME/.config/nvim"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/.zshrc.arch" "$HOME/.zshrc"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/xdg-terminals.list" "$HOME/.config/xdg-terminals.list"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/uwsm" "$HOME/.config/uwsm"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/brave-flags.conf" "$HOME/.config/brave-flags.conf"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/waybar"  "$HOME/.config/waybar"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/k9s" "$HOME/.config/k9s"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/pipewire/pipewire.conf.d" "$HOME/.config/pipewire/pipewire.conf.d"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/pipewire/pipewire-pulse.conf.d" "$HOME/.config/pipewire/pipewire-pulse.conf.d"
"$DOTFILES/bin/common/dot-cmd-symlink" "$DOTFILES/applications/hidden/nm-connection-editor.desktop" "$HOME/.local/share/applications/nm-connection-editor.desktop"