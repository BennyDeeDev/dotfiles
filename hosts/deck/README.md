# Steam Deck Home Manager

This output keeps SteamOS intact and manages only the `deck` user's home with
Home Manager. It does not install NixOS, change the kernel, or use Jovian-NixOS.

## First activation

From the checkout on the Steam Deck:

```bash
cd ~/Repos/nix-config
nix --extra-experimental-features "nix-command flakes" run github:nix-community/home-manager -- switch --flake .#deck
```

After activation, use the generated `hms` alias or run:

```bash
home-manager switch --flake ~/Repos/nix-config#deck
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
