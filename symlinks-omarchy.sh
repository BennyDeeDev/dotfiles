#!/bin/bash

DOTFILES="$HOME/Repos/dotfiles"

ln -sfn "$DOTFILES/omarchy-hypr" ~/.config/hypr
ln -sfn "$DOTFILES/omarchy-waybar" ~/.config/waybar
ln -sfn "$DOTFILES/omarchy-nvim" ~/.config/nvim
ln -sfn "$DOTFILES/.bashrc.omarchy" ~/.bashrc
