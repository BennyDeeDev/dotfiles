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
