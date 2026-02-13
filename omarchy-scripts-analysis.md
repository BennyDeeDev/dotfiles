# Omarchy Scripts Analysis for Arch System

Analysis of omarchy bin scripts for compatibility with custom Arch + omarchy
overlay setup.

## 🔴 DANGEROUS - DO NOT USE

These will break your system or overwrite your custom configs:

- **omarchy-reinstall** - Nukes all configs and reinstalls everything
- **omarchy-reinstall-configs** - Overwrites all ~/.config files with omarchy
  defaults
- **omarchy-reinstall-pkgs** - Forces installation from omarchy package list
- **omarchy-reinstall-git** - (referenced but not analyzed)
- **omarchy-refresh-limine** - Overwrites bootloader config (CRITICAL)
- **omarchy-refresh-plymouth** - Modifies boot splash and runs mkinitcpio
- **omarchy-refresh-pacman** - Switches to omarchy mirrors/repos
- **omarchy-update** - Runs git pull on omarchy, runs migrations, updates
  packages
- **omarchy-update-git** - Git pulls omarchy repo
- **omarchy-update-perform** - Full system update assuming omarchy is base
- **omarchy-update-system-pkgs** - Updates packages
- **omarchy-remove-all** - Removes omarchy apps (might remove your apps)

## 🟠 RISKY - Use with caution

These modify system files but could be useful in specific situations:

**Config Refresh (overwrites individual configs):**

- **omarchy-refresh-config** - Copies omarchy config to ~/.config (makes backup)
- **omarchy-refresh-hyprland** - Overwrites all hypr configs
- **omarchy-refresh-waybar** - Overwrites waybar configs
- **omarchy-refresh-hypridle** - Overwrites hypridle config
- **omarchy-refresh-hyprlock** - Overwrites hyprlock config
- **omarchy-refresh-tmux** - Overwrites tmux config
- **omarchy-refresh-walker** - Overwrites walker config
- **omarchy-refresh-swayosd** - Overwrites swayosd config
- **omarchy-refresh-fastfetch** - Overwrites fastfetch config
- **omarchy-refresh-chromium** - Overwrites chromium config
- **omarchy-refresh-applications** - Refreshes desktop entries

**System Setup:**

- **omarchy-hibernation-setup** - Creates swap, modifies fstab, mkinitcpio
  (modifies system files)
- **omarchy-hibernation-remove** - Removes hibernation setup
- **omarchy-setup-dns** - Modifies DNS settings
- **omarchy-setup-fingerprint** - Configures PAM and hyprlock for fingerprint
- **omarchy-setup-fido2** - Configures FIDO2 authentication
- **omarchy-drive-set-password** - Changes LUKS password

**Migrations:**

- **omarchy-migrate** - Runs omarchy migrations (might expect omarchy base
  system)

**Update Related:**

- **omarchy-update-branch** - Changes omarchy branch
- **omarchy-update-aur-pkgs** - Updates AUR packages
- **omarchy-update-orphan-pkgs** - Removes orphan packages
- **omarchy-update-firmware** - Updates firmware
- **omarchy-update-keyring** - Updates keyring
- **omarchy-update-restart** - Restarts services after update

**Snapshots:**

- **omarchy-snapshot** - Uses snapper (safe if you use snapper)

## 🟡 CONDITIONAL - Depends on hardware/config

These are hardware-specific or require specific setup:

- **omarchy-hw-asus-rog** - Detects ASUS ROG hardware (safe detection)
- **omarchy-battery-present** - Checks for battery (safe detection)
- **omarchy-battery-remaining** - Gets battery % (safe)
- **omarchy-battery-monitor** - Monitors battery
- **omarchy-brightness-display** - Controls display brightness (safe)
- **omarchy-brightness-display-apple** - Apple display brightness
- **omarchy-brightness-keyboard** - Keyboard brightness
- **omarchy-toggle-hybrid-gpu** - Toggles GPU mode (needs supergfxd, modifies
  config)
- **omarchy-powerprofiles-list** - Lists power profiles

## 🟢 SAFE - Utility scripts

These are helper scripts that don't modify system state:

**Command Helpers:**

- **omarchy-cmd-missing** - Checks if command exists
- **omarchy-cmd-present** - Checks if command exists
- **omarchy-cmd-terminal-cwd** - Gets terminal CWD
- **omarchy-debug** - Debug information

**Package Helpers:**

- **omarchy-pkg-missing** - Checks if package is missing
- **omarchy-pkg-present** - Checks if package is present
- **omarchy-pkg-aur-accessible** - Checks AUR access
- **omarchy-pkg-add** - Installs package (but modifies system)
- **omarchy-pkg-install** - Interactive package installer
- **omarchy-pkg-aur-install** - Interactive AUR installer
- **omarchy-pkg-aur-add** - Adds AUR package
- **omarchy-pkg-drop** - Removes package
- **omarchy-pkg-remove** - Removes package

**State Management:**

- **omarchy-state** - Manages state files in ~/.local/state
- **omarchy-hook** - Runs user hooks from ~/.config/omarchy/hooks

**Version/Info:**

- **omarchy-version** - Shows version
- **omarchy-version-branch** - Shows branch
- **omarchy-version-channel** - Shows channel
- **omarchy-version-pkgs** - Shows package versions

**Font Management:**

- **omarchy-font-current** - Shows current font
- **omarchy-font-list** - Lists available fonts
- **omarchy-font-set** - Sets font

**Drive Info:**

- **omarchy-drive-info** - Drive information
- **omarchy-drive-select** - Interactive drive selector

**Other Utilities:**

- **omarchy-tz-select** - Timezone selector
- **omarchy-upload-log** - Uploads logs
- **omarchy-show-done** - Shows completion message
- **omarchy-show-logo** - Shows omarchy logo
- **omarchy-reset-sudo** - Resets sudo timeout
- **omarchy-menu** - Shows menu
- **omarchy-menu-keybindings** - Shows keybindings

## 🟢 MOSTLY SAFE - UI/App management

**Launch:**

- **omarchy-launch-browser** - Launches browser
- **omarchy-launch-editor** - Launches editor
- **omarchy-launch-audio** - Launches audio control
- **omarchy-launch-bluetooth** - Launches bluetooth
- **omarchy-launch-wifi** - Launches wifi
- **omarchy-launch-about** - Shows about dialog
- **omarchy-launch-walker** - Launches walker
- **omarchy-launch-tui** - Launches TUI app
- **omarchy-launch-webapp** - Launches webapp
- **omarchy-launch-or-focus** - Launch or focus window
- **omarchy-launch-or-focus-tui** - Launch or focus TUI
- **omarchy-launch-or-focus-webapp** - Launch or focus webapp
- **omarchy-launch-screensaver** - Launches screensaver
- **omarchy-launch-floating-terminal-with-presentation** - Launches terminal

**Restart:**

- **omarchy-restart-app** - Restarts application
- **omarchy-restart-waybar** - Restarts waybar
- **omarchy-restart-hyprctl** - Restarts hyprctl
- **omarchy-restart-hypridle** - Restarts hypridle
- **omarchy-restart-hyprsunset** - Restarts hyprsunset
- **omarchy-restart-mako** - Restarts mako
- **omarchy-restart-swayosd** - Restarts swayosd
- **omarchy-restart-walker** - Restarts walker
- **omarchy-restart-terminal** - Restarts terminal
- **omarchy-restart-btop** - Restarts btop
- **omarchy-restart-pipewire** - Restarts pipewire
- **omarchy-restart-bluetooth** - Restarts bluetooth
- **omarchy-restart-wifi** - Restarts wifi
- **omarchy-restart-xcompose** - Restarts xcompose
- **omarchy-restart-opencode** - Restarts opencode

**Toggle:**

- **omarchy-toggle-idle** - Toggles idle detection
- **omarchy-toggle-nightlight** - Toggles nightlight
- **omarchy-toggle-screensaver** - Toggles screensaver
- **omarchy-toggle-suspend** - Toggles suspend
- **omarchy-toggle-waybar** - Toggles waybar

**Commands:**

- **omarchy-cmd-audio-switch** - Switches audio
- **omarchy-cmd-screenshot** - Takes screenshot
- **omarchy-cmd-screensaver** - Screensaver control
- **omarchy-cmd-screenrecord** - Screen recording
- **omarchy-cmd-share** - Shares files
- **omarchy-cmd-reboot** - Reboots (closes windows first)
- **omarchy-cmd-shutdown** - Shuts down
- **omarchy-cmd-first-run** - First run setup
- **omarchy-lock-screen** - Locks screen

**Hyprland:**

- **omarchy-hyprland-window-close-all** - Closes all windows
- **omarchy-hyprland-window-pop** - Pops window
- **omarchy-hyprland-workspace-toggle-gaps** - Toggles gaps

**Notifications:**

- **omarchy-notification-dismiss** - Dismisses notifications
- **omarchy-swayosd-brightness** - OSD brightness

## 🟢 SAFE - Theme management

These manage omarchy themes (safe if you use omarchy themes):

- **omarchy-theme-current** - Shows current theme
- **omarchy-theme-list** - Lists themes
- **omarchy-theme-set** - Sets theme (copies theme files)
- **omarchy-theme-refresh** - Refreshes current theme
- **omarchy-theme-install** - Installs theme
- **omarchy-theme-remove** - Removes theme
- **omarchy-theme-update** - Updates themes
- **omarchy-theme-bg-install** - Installs background
- **omarchy-theme-bg-next** - Cycles background
- **omarchy-theme-set-templates** - Generates theme templates
- **omarchy-theme-set-browser** - Sets browser theme
- **omarchy-theme-set-vscode** - Sets vscode theme
- **omarchy-theme-set-obsidian** - Sets obsidian theme
- **omarchy-theme-set-gnome** - Sets gnome theme
- **omarchy-theme-set-asusctl** - Sets asusctl theme

## 🟢 SAFE - App installation helpers

These install optional applications:

- **omarchy-install-steam** - Installs Steam
- **omarchy-install-docker-dbs** - Installs Docker DBs
- **omarchy-install-dropbox** - Installs Dropbox
- **omarchy-install-geforce-now** - Installs GeForce NOW
- **omarchy-install-tailscale** - Installs Tailscale
- **omarchy-install-terminal** - Installs terminal
- **omarchy-install-vscode** - Installs VSCode
- **omarchy-install-xbox-controllers** - Installs Xbox controller support
- **omarchy-install-dev-env** - Installs dev environment
- **omarchy-install-chromium-google-account** - Chromium Google account setup
- **omarchy-remove-dev-env** - Removes dev environment

## 🟢 SAFE - Web app & TUI management

- **omarchy-webapp-install** - Creates web app launcher
- **omarchy-webapp-remove** - Removes web app
- **omarchy-webapp-remove-all** - Removes all web apps
- **omarchy-webapp-handler-hey** - Web app handler
- **omarchy-webapp-handler-zoom** - Zoom handler
- **omarchy-tui-install** - Creates TUI launcher
- **omarchy-tui-remove** - Removes TUI
- **omarchy-tui-remove-all** - Removes all TUIs

## 🟢 SAFE - Developer tools

- **omarchy-dev-add-migration** - Creates new migration file
- **omarchy-branch-set** - Sets branch (affects omarchy repo)
- **omarchy-channel-set** - Sets channel (affects omarchy)
- **omarchy-update-analyze-logs** - Analyzes update logs
- **omarchy-update-available** - Checks for updates
- **omarchy-update-available-reset** - Resets update check
- **omarchy-update-time** - Shows update time
- **omarchy-update-confirm** - Confirms update

## 🟢 SAFE - VoxType (speech synthesis)

- **omarchy-voxtype-install** - Installs VoxType
- **omarchy-voxtype-remove** - Removes VoxType
- **omarchy-voxtype-config** - Configures VoxType
- **omarchy-voxtype-model** - Manages VoxType models
- **omarchy-voxtype-status** - Shows VoxType status

## 🔵 OTHER

- **omarchy-windows-vm** - Windows VM setup
- **omarchy-update-without-idle** - Updates without idle detection
- **omarchy-hibernation-available** - Checks hibernation support

## Summary

**Avoid:**

- Anything with "reinstall" - will nuke your configs
- Bootloader scripts (limine, plymouth) - will break boot
- omarchy-refresh-pacman - switches to omarchy mirrors
- omarchy-update\* - designed for omarchy base system

**Use with caution:**

- refresh-\* scripts - they overwrite configs (but make backups)
- setup-\* scripts - modify system files but could be useful

**Safe to use:**

- cmd-_, pkg-_, hw-\* helpers
- launch-_, restart-_, toggle-\* UI scripts
- theme-\* scripts (if using omarchy themes)
- webapp/tui management
- Battery/brightness/hardware detection
