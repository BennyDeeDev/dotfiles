# COSMIC Terminal Configuration

This directory contains the configuration for COSMIC Terminal (`cosmic-term`) with Ghostty-inspired appearance settings.

## Configuration Files

### `/v1/config`
Main configuration file in RON (Rusty Object Notation) format containing:

**Appearance Settings:**
- Font: FiraCode Nerd Font, 14pt (matching Ghostty on Linux)
- Opacity: 90% (matching Ghostty's background opacity)
- Theme: Catppuccin Mocha (dark) and Catppuccin Latte (light)

**Color Schemes:**
Both Catppuccin themes are embedded in the config file with complete color palettes ported from Ghostty's theme files.

### `/v1/color-schemes/`
Standalone color scheme files:
- `Catppuccin Mocha.ron` - Dark theme matching Ghostty's catppuccin-mocha.conf
- `Catppuccin Latte.ron` - Light theme matching Ghostty's catppuccin-latte.conf

### `/v1/opacity`
Opacity setting (90%) stored separately

## Ghostty Parity Notes

### ✅ Implemented
- Font family: FiraCode Nerd Font
- Font size: 14pt (Arch Linux)
- Window opacity: 90%
- Catppuccin Mocha color palette (dark theme)
- Catppuccin Latte color palette (light theme)
- Cursor color and selection colors

### ⚠️ Limitations
**Padding:** COSMIC Terminal does not yet expose window padding configuration. The equivalent of Ghostty's `window-padding-x/y = 7` cannot be configured.

**Cursor thickness:** COSMIC Terminal does not yet expose cursor thickness configuration. Ghostty's `adjust-cursor-thickness = 2` cannot be replicated.

**Tab bar:** COSMIC Terminal's tab bar is always shown when multiple tabs are open. Ghostty's `window-show-tab-bar = always` behavior is not configurable.

### ❌ Not Applicable
**Keybindings:** COSMIC Terminal has hardcoded keybindings that differ from Ghostty:
- Copy: `Ctrl+Shift+C` (vs Ghostty's `Ctrl+C`)
- Paste: `Ctrl+Shift+V` (vs Ghostty's `Ctrl+V`)
- New Tab: `Ctrl+Shift+T` (vs Ghostty's `Ctrl+T`)
- Close Tab: `Ctrl+Shift+Q` (vs Ghostty's `Ctrl+W`)

Custom keybindings are not yet supported in COSMIC Terminal (planned feature). The defaults use `Ctrl+Shift` modifiers to avoid conflicts with terminal control characters, which is more standard than Ghostty's approach.

## Theme Mapping

| Ghostty Config | COSMIC Terminal Mapping |
|----------------|------------------------|
| `background = 1e1e2e` | `special.background: "#1e1e2e"` |
| `foreground = cdd6f4` | `special.foreground: "#cdd6f4"` |
| `cursor-color = f5e0dc` | `special.cursor: "#f5e0dc"` |
| `palette = 0=#45475a` | `normal[0]: "#45475a"` |
| `palette = 8=#585b70` | `bright[0]: "#585b70"` |

All 16 ANSI colors are mapped from Ghostty's palette to COSMIC's `normal`, `bright`, and `dim` arrays.
