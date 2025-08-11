#!/bin/bash

DOTFILES="$HOME/Repos/dotfiles"

ln -sfn "$DOTFILES/Brewfile" ~/Brewfile
ln -sfn "$DOTFILES/nvim" ~/.config/nvim
ln -sfn "$DOTFILES/ghostty" ~/.config/ghostty
ln -sfn "$DOTFILES/.zshrc.macos" ~/.zshrc
ln -sfn "$DOTFILES/.zprofile.macos" ~/.zprofile
ln -sfn "$DOTFILES/.p10k.zsh" ~/.p10k.zsh
