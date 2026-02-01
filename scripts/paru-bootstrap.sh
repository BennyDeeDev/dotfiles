#!/bin/bash

sudo pacman -S --needed base-devel git
sudo pacman -S rustup
rustup default stable
cd $HOME/Repos
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
