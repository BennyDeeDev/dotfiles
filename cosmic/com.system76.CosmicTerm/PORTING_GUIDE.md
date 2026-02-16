# Ghostty to Cosmic Terminal Configuration Port

This document details the porting of Ghostty terminal configuration to COSMIC Terminal.

## Files Created

### 1. Main Configuration
- **File:** `cosmic/com.system76.CosmicTerm/v1/config`
- **Format:** RON (Rusty Object Notation)
- **Contains:** Complete terminal appearance and color scheme configuration

### 2. Color Schemes
- **File:** `cosmic/com.system76.CosmicTerm/v1/color-schemes/Catppuccin Mocha.ron`
- **File:** `cosmic/com.system76.CosmicTerm/v1/color-schemes/Catppuccin Latte.ron`
- **Format:** RON
- **Purpose:** Standalone importable color schemes

### 3. Documentation
- **File:** `cosmic/com.system76.CosmicTerm/README.md`
- **Purpose:** Explains configuration structure and limitations

## Configuration Mapping

### Appearance Settings

| Ghostty Setting | Value | COSMIC Setting | Value |
|----------------|-------|----------------|-------|
| `font-family` | FiraCode Nerd Fonts | `font_name` | "FiraCode Nerd Font" |
| `font-size` (arch) | 14 | `font_size` | 14 |
| `background-opacity` | 0.90 | `opacity` | 90 |
| `font-weight` | Regular (400) | `font_weight` | 400 |
| `bold-font-weight` | Bold (700) | `bold_font_weight` | 700 |

### Color Scheme Mapping (Catppuccin Mocha)

| Ghostty | COSMIC Terminal | Color Value |
|---------|----------------|-------------|
| `background` | `special.background` | #1e1e2e |
| `foreground` | `special.foreground` | #cdd6f4 |
| `cursor-color` | `special.cursor` | #f5e0dc |
| `palette = 0` (Black) | `normal[0]` | #45475a |
| `palette = 1` (Red) | `normal[1]` | #f38ba8 |
| `palette = 2` (Green) | `normal[2]` | #a6e3a1 |
| `palette = 3` (Yellow) | `normal[3]` | #f9e2af |
| `palette = 4` (Blue) | `normal[4]` | #89b4fa |
| `palette = 5` (Magenta) | `normal[5]` | #f5c2e7 |
| `palette = 6` (Cyan) | `normal[6]` | #94e2d5 |
| `palette = 7` (White) | `normal[7]` | #bac2de |
| `palette = 8` (Bright Black) | `bright[0]` | #585b70 |
| `palette = 9` (Bright Red) | `bright[1]` | #f38ba8 |
| `palette = 10` (Bright Green) | `bright[2]` | #a6e3a1 |
| `palette = 11` (Bright Yellow) | `bright[3]` | #f9e2af |
| `palette = 12` (Bright Blue) | `bright[4]` | #89b4fa |
| `palette = 13` (Bright Magenta) | `bright[5]` | #f5c2e7 |
| `palette = 14` (Bright Cyan) | `bright[6]` | #94e2d5 |
| `palette = 15` (Bright White) | `bright[7]` | #a6adc8 |

### Keybindings Comparison

| Action | Ghostty (Linux) | COSMIC Terminal | Notes |
|--------|----------------|----------------|-------|
| Copy | `Ctrl+C` | `Ctrl+Shift+C` | COSMIC uses Shift to avoid conflict with terminal signals |
| Paste | `Ctrl+V` | `Ctrl+Shift+V` | COSMIC uses Shift to avoid conflict with terminal signals |
| New Tab | `Ctrl+T` | `Ctrl+Shift+T` | COSMIC uses Shift modifier |
| Close Tab | `Ctrl+W` | `Ctrl+Shift+Q` | Different key and modifier |
| Go to Tab 1-9 | `Ctrl+1-9` | `Alt+1-9` | Different modifier key |

**Note:** COSMIC Terminal keybindings are currently hardcoded and cannot be customized via configuration files. This is a planned feature for future releases.

## What Cannot Be Ported

### 1. Window Padding
Ghostty's `window-padding-x = 7` and `window-padding-y = 7` cannot be replicated as COSMIC Terminal does not expose padding configuration.

### 2. Cursor Thickness
Ghostty's `adjust-cursor-thickness = 2` cannot be configured in COSMIC Terminal.

### 3. Tab Bar Behavior
Ghostty's `window-show-tab-bar = always` is not configurable in COSMIC Terminal (tabs are shown when multiple tabs exist).

### 4. Custom Keybindings
Ghostty's extensive keybinding customization cannot be replicated as COSMIC Terminal has hardcoded keybindings.

### 5. Shell Integration
Ghostty's `shell-integration = zsh` is handled differently in COSMIC Terminal and doesn't require explicit configuration.

## Validation

All RON configuration files have been validated for syntax correctness using a Rust RON parser.

## Usage

The configuration will be automatically loaded when COSMIC Terminal is launched after symlinking via:
```bash
dot-symlinks-cosmic-arch
```

This script already symlinks the entire `cosmic/` directory to `~/.config/cosmic/`.
