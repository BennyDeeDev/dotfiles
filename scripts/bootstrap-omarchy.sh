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

# Create omarchy config directories
mkdir -p ~/.config/omarchy/current
echo "✓ Created ~/.config/omarchy/current/"

mkdir -p ~/.config/omarchy/themed
echo "✓ Created ~/.config/omarchy/themed/"

# Symlink custom templates
DOTFILES_DIR="$REPOS_DIR/dotfiles"
for template in "$DOTFILES_DIR"/templates/*.tpl; do
  [[ -f $template ]] || continue
  filename=$(basename "$template")
  "$DOTFILES_DIR/scripts/symlink.sh" "$template" ~/.config/omarchy/themed/"$filename"
done

# Symlink starship.toml to omarchy-generated version
"$DOTFILES_DIR/scripts/symlink.sh" ~/.config/omarchy/current/theme/starship.toml ~/.config/starship.toml

echo ""
echo "✓ Omarchy bootstrap complete!"
echo ""
echo "Available commands (after sourcing shell config):"
echo "  omarchy-theme-set <theme>    - Switch themes"
echo "  omarchy-theme-list            - List available themes"
echo "  omarchy-theme-current         - Show current theme"
