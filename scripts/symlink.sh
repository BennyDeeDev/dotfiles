#!/usr/bin/env bash

source="$1"
target="$2"

if [[ -z "$source" || -z "$target" ]]; then
  echo "Usage: link <source> <target>"
  exit 1
fi

mkdir -p "$(dirname "$target")"

# If a real directory/file already exists, move it aside so target becomes a direct symlink.
if [[ -e "$target" && ! -L "$target" ]]; then
  backup="$target.bak.$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing $target -> $backup"
  mv "$target" "$backup"
fi

ln -sfn "$source" "$target"
echo "Linked $target -> $source"
