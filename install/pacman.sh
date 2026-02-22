#!/bin/bash

set -euo pipefail

IGNORE_PKG="cosmic-comp niri"

# Enable Color and VerbosePkgLists
grep -q '^Color$' /etc/pacman.conf || sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
grep -q '^VerbosePkgLists$' /etc/pacman.conf || sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /etc/pacman.conf

# Set IgnorePkg
grep -q "^IgnorePkg = ${IGNORE_PKG}$" /etc/pacman.conf || \
  sudo sed -i "/^\[options\]/a IgnorePkg = ${IGNORE_PKG}" /etc/pacman.conf

# Enable multilib
grep -q '^\[multilib\]$' /etc/pacman.conf || sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//}' /etc/pacman.conf
