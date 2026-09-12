# Steam Deck Home Manager

This output keeps SteamOS intact and manages only the `deck` user's home with
Home Manager. It does not install NixOS, change the kernel, or use Jovian-NixOS.

## First activation

From the checkout on the Steam Deck:

```bash
cd ~/Repos/nix-config

nix --extra-experimental-features "nix-command flakes" \
  run github:nix-community/home-manager -- \
  switch -b hm-backup --flake .#deck
```

After activation, use the generated `hms` alias or run:

```bash
home-manager switch -b hm-backup --flake ~/Repos/nix-config#deck
```

The configuration currently imports the shared terminal profile. It can be
reduced later if its packages use more storage than desired.

## Default shell

Home Manager installs and configures Zsh, but standalone Home Manager does not
change SteamOS's login shell. Set Zsh as the `deck` user's login shell once:

```bash
chsh -s /bin/zsh
```

Log out and back in afterward. Verify the result with:

```bash
getent passwd deck
printf '%s\n' "$SHELL"
```

Use `/bin/zsh` rather than `/home/deck/.nix-profile/bin/zsh` as the login shell;
the Nix profile path changes between Home Manager generations.

## Nix GPU setup

The Deck keeps SteamOS and its native kernel/GPU drivers. Nix graphical
applications such as Ghostty still need Nix-compatible OpenGL and Vulkan
libraries, because Nixpkgs expects them at `/run/opengl-driver`.

After Home Manager reports that the non-NixOS GPU setup is missing, run the
setup script once as root:

```bash
sudo "$(readlink -f "$(command -v non-nixos-gpu-setup)")"
```

This does not replace the SteamOS drivers. It adds a Nix userspace GPU library
environment and creates:

- `/etc/tmpfiles.d/non-nixos-gpu.conf`, which recreates the link at boot
- `/run/opengl-driver`, pointing at the Nix GPU libraries
- `/nix/var/nix/gcroots/non-nixos-gpu.conf`, keeping the setup alive through GC

Run the setup again when Home Manager reports that the Nix GPU drivers changed.

To remove the integration:

```bash
sudo rm /run/opengl-driver
sudo rm /etc/tmpfiles.d/non-nixos-gpu.conf
sudo rm /nix/var/nix/gcroots/non-nixos-gpu.conf
```

## Apple Studio Display

The 2022 Apple Studio Display works with the Steam Deck, but native
`5120x2880@60` currently black-screens on SteamOS.

### Desktop Mode

Disconnect the display, run:

```bash
sleep 30 && kscreen-doctor output.DP-1.mode.2560x1440@60
```

Then immediately reconnect the Studio Display.

### Gaming Mode

Gamescope stores the selected mode per external display in:

```text
~/.config/gamescope/modes.cfg
```

Set the Studio Display to:

```text
Apple Computer Inc StudioDisplay:2560x1440@60 0
```

For example:

```bash
sed -i 's/Apple Computer Inc StudioDisplay:.*/Apple Computer Inc StudioDisplay:2560x1440@60 0/' \
  ~/.config/gamescope/modes.cfg
```

This only changes the Studio Display. The Deck's internal `1280x800` display
remains unchanged.

### Native 5K

Native 5K was tested with HBR3, 8 bpc, DSC disabled, and
`5120x2880@60` successfully selected by KDE, but the display remained black.

The Studio Display uses an unusual 2x1 tiled DisplayPort layout. AMD added
specific upstream fixes for it in 2026:

- [`drm/amd/display: hide Apple Studio Display secondary tile`](https://www.mail-archive.com/amd-gfx%40lists.freedesktop.org/msg147305.html)
- [`drm/amd/display: Prune per-tile Timing from Apple Studio Display Primary Tile`](https://mail-archive.com/amd-gfx%40lists.freedesktop.org/msg147688.html)

The fixes are backported to Linux `6.18.50+` and `7.2.4+`.
