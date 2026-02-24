#!/bin/bash

set -euo pipefail

# Configuration
GH_USERNAME="BennyDeeDev"
GH_EMAIL="45900418+BennyDeeDev@users.noreply.github.com"
SSH_KEY_PATH="$HOME/.ssh/id_ed25519_personal"

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "Error: Not a git repository"
  exit 1
fi

# Generate SSH key for personal GitHub account if it doesn't exist
if [[ ! -f "$SSH_KEY_PATH" ]]; then
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

# Configure local git settings
echo "Configuring local git settings..."
git config --local user.name "$GH_USERNAME"
git config --local user.email "$GH_EMAIL"
git config --local core.sshCommand "ssh -i $SSH_KEY_PATH -o IdentitiesOnly=yes"

# Update origin to SSH
CURRENT_URL=$(git remote get-url origin 2>/dev/null || true)
if [[ "$CURRENT_URL" == https://github.com/* ]]; then
  SSH_URL=$(echo "$CURRENT_URL" | sed 's|https://github.com/|git@github.com:|')
  echo "Switching origin to SSH..."
  git remote set-url origin "$SSH_URL"
fi

# Disable GPG signing
echo "Disabling GPG signing..."
git config --local commit.gpgsign false
git config --local tag.gpgsign false

echo "Git local setup complete!"
