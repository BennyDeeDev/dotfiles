#!/bin/bash

set -euo pipefail

REPOS_DIR="$HOME/Repos"
OMARCHY_REPO="$REPOS_DIR/omarchy"
OMARCHY_UPSTREAM="https://github.com/basecamp/omarchy.git"

echo "Bootstrapping omarchy theme system..."
echo ""

# Create Repos directory if needed
mkdir -p "$REPOS_DIR"

# Clone omarchy if not present
if [[ ! -d "$OMARCHY_REPO" ]]; then
  echo "Cloning omarchy from $OMARCHY_UPSTREAM..."
  git clone "$OMARCHY_UPSTREAM" "$OMARCHY_REPO"
  echo "✓ Omarchy cloned"
else
  echo "✓ Omarchy repo found at $OMARCHY_REPO"
fi

echo ""

# Create omarchy config directory (for generated themes)
mkdir -p ~/.config/omarchy/current
echo "✓ Created ~/.config/omarchy/current/"

echo ""
echo "✓ Omarchy bootstrap complete!"
echo ""
echo "Available commands (after sourcing shell config):"
echo "  omarchy-theme-set <theme>    - Switch themes"
echo "  omarchy-theme-list            - List available themes"
echo "  omarchy-theme-current         - Show current theme"
