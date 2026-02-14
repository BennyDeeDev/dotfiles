# Omarchy Install Scripts Analysis

Analysis of omarchy install scripts to determine which should be copied to
dotfiles/install/.

**Decision Date:** February 14, 2026

## Already Copied to dotfiles/install/ ✅

- **docker.sh** - Docker daemon configuration (log rotation, DNS)
- **default-keyring.sh** - GNOME keyring setup
- **mimetypes.sh** - Default application associations (copied from omarchy's
  version)

## Recommended to Add ✅

### Quality of Life Improvements

**fast-shutdown.sh** - Reduce shutdown timeout from 90s to 5s

```bash
# Sets DefaultTimeoutStopSec=5s in systemd
```

**Why:** Significantly improves shutdown experience. Universal benefit, no
downsides.

**increase-sudo-tries.sh** - Allow 10 password attempts instead of 3

```bash
# Sets passwd_tries=10 in sudoers and faillock
```

**Why:** Reduces lockout frustration when typing passwords. Also configured for
hyprlock.

**increase-lockout-limit.sh** - More lenient login lockout (10 tries, 2min
timeout)

```bash
# Modifies PAM faillock settings
```

**Why:** Prevents accidental lockouts during login. Pairs with
increase-sudo-tries.

**input-group.sh** - Add user to input group

```bash
sudo usermod -aG input ${USER}
```

**Why:** Required for dictation tools and Xbox controller support.

**ssh-flakiness.sh** - Fix common SSH connection issues

```bash
# Sets net.ipv4.tcp_mtu_probing=1
```

**Why:** Solves MTU-related SSH hangs. Single sysctl tweak, no downsides.

**sudoless-asdcontrol.sh** - Brightness control without sudo (Apple displays)

```bash
# Adds sudoers rule for asdcontrol
```

**Why:** If you have Apple displays and use asdcontrol, this is essential for
asdcontrol to work smoothly.

### Battery/Power Management (if laptop)

**powerprofilesctl-rules.sh** - Auto-switch power profiles on AC/battery

```bash
# Creates udev rules to switch profiles automatically
```

**Why:** Essential for laptops. Auto-switches to performance on AC, balanced on
battery.

### System Utilities

**localdb.sh** - Update locate database

```bash
sudo updatedb
```

**Why:** Simple, ensures `locate` command works. Run once after install.

## Hardware-Specific (conditional) 🔧

Only add if you have the specific hardware:

### Apple Hardware

- **fix-apple-spi-keyboard.sh** - Fixes Apple SPI keyboard
- **fix-apple-suspend-nvme.sh** - Fixes NVMe suspend on Apple hardware
- **fix-apple-t2.sh** - T2 chip fixes for MacBook Pro/Air

### ASUS Hardware

- **fix-asus-rog-audio-mixer.sh** - ROG audio mixer fixes
- **fix-asus-rog-mic.sh** - ROG microphone fixes

### Other Hardware

- **fix-bcm43xx.sh** - Broadcom WiFi fixes
- **fix-synaptic-touchpad.sh** - Synaptic touchpad fixes
- **fix-surface-keyboard.sh** - Surface keyboard fixes
- **fix-yt6801-ethernet-adapter.sh** - Specific ethernet adapter fix
- **fix-f13-amd-audio-input.sh** - Framework 13 AMD audio input
- **fix-fkeys.sh** - Function key behavior
- **set-wireless-regdom.sh** - Set wireless regulatory domain
- **usb-autosuspend.sh** - USB power management

### GPU-Specific

- **intel.sh** - Intel GPU optimizations
- **nvidia.sh** - NVIDIA GPU setup
- **legacy-gpu-terminal.sh** - Older GPU terminal emulator fallback

## DO NOT Copy ❌

### Omarchy-Specific Infrastructure

**theme.sh, walker-elephant.sh** - Theme system setup

- **Why:** These symlink omarchy configs. Already handled by omarchy.sh
  bootstrap.

**branding.sh** - Omarchy branding (icons, etc.)

- **Why:** Omarchy-specific, not relevant to your system.

**timezones.sh** - Timezone configuration wizard

- **Why:** System-dependent. Set up manually or through system settings.

**detect-keyboard-layout.sh** - Keyboard layout detection

- **Why:** Set up once during system install, not needed afterward.

**mise-work.sh, omarchy-ai-skill.sh** - Work-specific tools

- **Why:** Personal choice tools, not system configuration.

**xcompose.sh** - X compose key configuration

- **Why:** Personal preference, set up manually if needed.

**git.sh, gpg.sh** - Global git/gpg configuration

- **Why:** You already have git-local.sh for your needs. These are omarchy's
  global defaults.

### Login/Boot (omarchy owns these)

**login/** - SDDM, Plymouth, Limine configs

- **Why:** Boot and login manager configs. Omarchy owns the visual system.

### Package Management (you own this)

**packaging/** - Package installation

- **Why:** You manage packages via Pacmanfile. Don't let omarchy install
  packages.

### Install Orchestration (omarchy-specific)

**preflight/**, **post-install/**, **helpers/**, **first-run/**,
**config/all.sh**

- **Why:** These are omarchy's install orchestration. Not needed when using
  omarchy as toolchain.

### Hardware Not Needed by Most

**hibernation.sh** - Hibernate setup (modifies swap, fstab, mkinitcpio)

- **Why:** Complex, modifies critical system files. Only add if you specifically
  need hibernation.

**printer.sh** - Printer setup

- **Why:** Most people don't need system-wide printer configuration.

**bluetooth.sh, network.sh** - Network service setup

- **Why:** These enable/start systemd services. Do manually if needed.

**ignore-power-button.sh** - Ignore physical power button

- **Why:** Niche use case. Most people want power button to work.

## Implementation Plan

1. **Create these in dotfiles/install/**:
   - fast-shutdown.sh
   - increase-sudo-tries.sh
   - increase-lockout-limit.sh
   - input-group.sh
   - ssh-flakiness.sh
   - localdb.sh
2. **Add if applicable**:
   - sudoless-asdcontrol.sh (if you have Apple displays)
   - powerprofilesctl-rules.sh (if you have a laptop)

3. **Consider hardware-specific scripts** based on your actual hardware

## Summary

**Core additions (everyone should have):**

- fast-shutdown.sh
- increase-sudo-tries.sh
- increase-lockout-limit.sh
- input-group.sh
- ssh-flakiness.sh
- localdb.sh

**Laptop additions:**

- powerprofilesctl-rules.sh

**Apple display users:**

- sudoless-asdcontrol.sh

**Hardware-specific:**

- Only add what matches your actual hardware

Total recommended: ~6-8 scripts for most users (excluding hardware-specific).
