#!/bin/bash

set -e

# Configuration
GH_USERNAME="BennyDeeDev"
GH_EMAIL="45900418+BennyDeeDev@users.noreply.github.com"
SSH_KEY_PATH="$HOME/.ssh/id_ed25519_personal"
REPO_URL="git@github.com:$GH_USERNAME/dotfiles.git"

DOTFILES="$HOME/Repos/dotfiles"

if [ "$PWD" != "$DOTFILES" ]; then
    echo "Error: Must be run from the dotfiles directory (\$DOTFILES)"
    echo "Current directory: $PWD"
    echo "Expected directory: $DOTFILES"
    exit 1
fi

# Generate SSH key for personal GitHub account if it doesn't exist
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$GH_EMAIL" -f "$SSH_KEY_PATH" -N ""
    
    # Copy public key to clipboard
    if command -v xc &> /dev/null; then
        echo "Copying public key to clipboard..."
        xc < "$SSH_KEY_PATH.pub"
        echo "Public key copied! Add it to GitHub: https://github.com/settings/keys"
    else
        echo "Public key generated at: $SSH_KEY_PATH.pub"
        echo "Copy it manually and add to GitHub: https://github.com/settings/keys"
    fi
else
    echo "SSH key already exists, skipping generation..."
fi

# Update remote URL to use SSH
echo "Updating remote URL to use SSH..."
git remote set-url origin "$REPO_URL"

# Configure local git settings
echo "Configuring local git settings..."
git config --local user.name "$GH_USERNAME"
git config --local user.email "$GH_EMAIL"
git config --local core.sshCommand "ssh -i $SSH_KEY_PATH -o IdentitiesOnly=yes"

# Disable GPG signing
echo "Disabling GPG signing..."
git config --local commit.gpgsign false
git config --local tag.gpgsign false

echo "Git local setup complete!"
