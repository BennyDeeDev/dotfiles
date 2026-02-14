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

## Documentation style

Be thorough but not excessive. Cover what's needed, nothing more.

- Explain concepts clearly but don't over-explain
- Each section should add new information, not restate what was already said
- Skip unnecessary sections or subsections that don't add value
- No introductory fluff ("In this document...", "As mentioned earlier...")
- Use concrete examples over abstract explanations
- If a point is made once clearly, don't restate it

**Balance:** Provide enough context to understand decisions, but cut anything repetitive or obvious.

## Dependency management

All software dependencies must be declared in the appropriate package file:

- `Pacmanfile` - Arch Linux packages (pacman and AUR)
- `Brewfile` - macOS packages (Homebrew)

Never install packages manually or suggest ad-hoc installation commands. If a
script or configuration requires a package, add it to the relevant file. This
ensures reproducible environments across machines and makes dependencies
explicit.

When a command fails due to a missing dependency:
1. Identify the package name
2. Add it to `Pacmanfile` or `Brewfile`
3. Execute the package installer:
   - `pacman-bundle` (Arch Linux)
   - `brew bundle` (macOS)

## Symlink management

Always use the OS-specific symlink scripts when applying configuration changes:

- `dot-symlinks-hyprland-arch` - Arch Linux with Hyprland
- `dot-symlinks-i3-arch` - Arch Linux with i3
- `dot-symlinks-macos` - macOS with Aerospace

Never manually symlink files. The scripts ensure all configurations are applied
consistently.

## Walker application launcher

Query visible applications in walker using elephant:

```bash
# List all visible apps (what walker shows)
elephant query "desktopapplications;;9999;false"
```

## Maintaining diff-ability with omarchy

**Critical:** Config files must remain easily diffable against omarchy's defaults for selective syncing.

### Editing config files

When editing files in `hypr/config/` or similar:

1. **Preserve structure** - Keep same sections, ordering, and formatting as omarchy
2. **Preserve comments** - Don't remove or rewrite omarchy's comments
3. **Minimal changes** - Only change values, not structure
4. **Add, don't replace** - Add your customizations after omarchy's sections

### Why this matters

When omarchy updates, we diff `hypr/default/` against the new version. If our config structure matches theirs, we can:
- Clearly see what changed in omarchy
- Selectively adopt improvements
- Merge updates without conflicts

If structure diverges, diffs become useless and we lose the ability to stay current.