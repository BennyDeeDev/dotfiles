#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/Repos/dotfiles"
INSTALL="$DOTFILES/install"

echo "Which compositor? (hyprland/niri/cosmic/i3)"
read -r compositor

bash "$INSTALL/paru.sh"
pacman-bundle

"$DOTFILES/bin/linux/dot-symlinks-${compositor}-arch"

bash "$INSTALL/default-keyring.sh"
bash "$INSTALL/systemd-boot.sh"
bash "$INSTALL/tuigreet.sh"
bash "$INSTALL/bluetooth.sh"
bash "$INSTALL/docker.sh"
bash "$INSTALL/zsa.sh"
# bash "$INSTALL/walker-elephant.sh"
bash "$INSTALL/mimetypes.sh"
# bash "$INSTALL/theme.sh"
bash "$INSTALL/localdb.sh"
