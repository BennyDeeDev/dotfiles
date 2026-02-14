# Omarchy as a Toolchain

**Decision Date:** February 14, 2026

## Problem Statement

Omarchy was designed as a complete, opinionated desktop environment system.
However, I want to own my Arch system configuration while leveraging omarchy's
theming capabilities. Using omarchy as a full dependency creates:

- **Ownership ambiguity** - unclear which repo owns which configs
- **Update anxiety** - can't safely pull omarchy updates without risking config
  overwrites
- **Maintenance overhead** - complex bootstrap scripts, dangerous commands to
  avoid

## What I WANT from Omarchy

### ✅ Theme Engine

- Color schemes (kanagawa, tokyo-night, etc.)
- Theme color definitions (`colors.toml`)
- Theme switching mechanism (`omarchy-theme-*` commands)
- Font configurations

### ✅ Safe Utility Scripts

- `omarchy-theme-set` - switch themes
- `omarchy-theme-list` - list available themes
- `omarchy-theme-current` - show current theme

### ✅ Rice Dependencies (Shared Ecosystem)

To maintain the integrated desktop experience, I need to use omarchy's chosen
"rice" stack—the applications and tools that work together cohesively:

- **Walker** - Application launcher (integrates with Elephant database)
- **Elephant** - Application database that Walker queries
- **Waybar** - Status bar (theme-aware, designed for omarchy's look)
- **Mako** - Notification daemon (themed)
- **Hyprland ecosystem** - hyprlock, hypridle, hyprpaper (configured together)
- **SwayOSD** - On-screen display for volume/brightness
- **Fastfetch** - System info display (themed)

**Why share these?** These components are designed to work as a cohesive visual
system. Using omarchy's defaults ensures:

- Consistent theming across all components
- Working integrations (e.g., Walker ↔ Elephant)
- Battle-tested configurations that work together
- Ability to benefit from omarchy's visual polish

**My approach:** Use omarchy's rice stack but own the configs. Copy omarchy's
configs into my dotfiles, then customize from there.

### ✅ Read-Only Reference

- Default configurations as reference material
- New theme additions/updates
- Visual polish and aesthetic decisions

## What I DON'T WANT from Omarchy

### ❌ System Ownership

- Installing/managing packages
- Owning config directories (`~/.config/hypr`, `~/.config/waybar`, etc.)
- System updates (`omarchy-update`, `omarchy-update-system-pkgs`)
- Bootloader configuration (`omarchy-refresh-limine`)

### ❌ Config Management

- Refresh commands that overwrite my configs (`omarchy-refresh-*`)
- Migrations that modify my setup (`omarchy-update` migrations)
- Reinstall scripts (`omarchy-reinstall-*`)

## Package Dependencies

While I own my system's package management, I need to keep omarchy's rice stack
applications in my `Pacmanfile` to maintain the integrated experience:

```
# Rice stack (omarchy ecosystem)
walker-bin
elephant
waybar
mako
hyprlock
hypridle
hyprpaper
swayosd-git
fastfetch
```

## The Deletion Test

**If I deleted `~/.local/share/omarchy` right now, what breaks?**

- ❌ My configs? No, they're in my dotfiles
- ❌ My applications? No, declared in my Pacmanfile
- ❌ My system? No, everything is independent
- ✅ Theme switching? Yes, but current theme still works

Only the theme-switching tooling breaks. Everything else is mine.

This proves omarchy is a toolchain, not a dependency.

## Handling Rice Updates

**The problem:** If I copy omarchy's rice configs once, I'm frozen—missing
future improvements. If I let omarchy refresh configs, I lose ownership.

**The solution:** Mirror omarchy's config structure, then automate selective
syncing.

### Structure Requirements

Dotfiles mirror omarchy's config layout:

```
omarchy/default/hypr/       → dotfiles/hypr/
omarchy/default/waybar/     → dotfiles/waybar/
omarchy/default/mako/       → dotfiles/mako/
omarchy/default/walker/     → dotfiles/walker/
```

Same structure = meaningful diffs = selective updates.

### Sync Options

**Hybrid approach: GitHub Action + local tool**

**GitHub Action (simple updates):**

Weekly automated PRs for routine changes:

1. Fetches latest omarchy
2. Diffs omarchy/config vs dotfiles
3. Creates PR: "Omarchy sync: waybar, hypr updates"
4. Review in GitHub UI, merge if straightforward

Handles 90% of updates: config tweaks, new defaults, minor changes.

**Local tool (complex migrations):**

```bash
dot-omarchy-sync
# Interactive diff review for breaking changes
# Manual conflict resolution
# Handle major restructures
```

Use GitHub Action for easy merges, local tool when omarchy makes breaking
changes or you need fine-grained control.

**Result:** Owned configs + trackable upstream + selective updates. No update
anxiety.
