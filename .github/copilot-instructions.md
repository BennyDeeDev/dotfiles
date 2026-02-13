# Copilot instructions (dotfiles)

These instructions apply when working in this repo.

## Omarchy dependency

**Never modify omarchy code.** Omarchy is used as a dependency, not as the whole
system. Always assume omarchy code works correctly and that any issues are
configuration problems on this machine.

- Don't edit files in `omarchy/bin/`, `omarchy/config/`, or other omarchy
  directories
- If something seems broken in omarchy, investigate local configuration first:
  - Check symlinked configs in `~/.config/`
  - Check for missing or misconfigured files
  - Check if services or dependencies are installed/running
- Only suggest omarchy code changes if you're absolutely certain there's a bug
  (after exhausting all configuration possibilities)

## Structure conventions

**OS-specific configuration**: Use OS-specific zshrc files instead of runtime OS
detection in common configs.

- `.zshrc.arch` - Linux (Arch) specific config
- `.zshrc.macos` - macOS specific config
- `.zshrc.common` - Shared config sourced by both

Each OS-specific zshrc sources `.zshrc.common` and adds its own PATH extensions,
aliases, and functions.

**Follow omarchy conventions**: This repo mirrors omarchy's structure and
naming. See `omarchy/AGENTS.md` for full conventions.

## Shell scripting (simplicity + maintainability)

- Keep scripts small, readable, and non-clever.
- Prefer a few straightforward commands over dense bash tricks.
- Use the exit early pattern: check conditions and exit/return immediately
  rather than nesting if/else blocks.
- Avoid unnecessary branching; only add conditionals when they prevent real
  breakage.
- Provide user feedback with simple `echo` statements.
- Don't add comments unless the code is genuinely unclear. Self-documenting code
  is preferred.
