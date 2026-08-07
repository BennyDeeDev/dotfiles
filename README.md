# Nix Config

Declarative system and user configuration for NixOS, nix-darwin, and Home
Manager. Hosts select reusable modules and profiles; application configuration
files are deployed through Home Manager.

## Structure

```text
hosts/       Host-specific system and Home Manager entrypoints
modules/     Reusable capability modules, with platform-only subfolders
profiles/    Flat role bundles such as workstation, gaming, and server
files/       Application configuration deployed by Home Manager
images/      Nix-built installation images
secrets/     SOPS-encrypted secrets and documentation
flake.nix    Flake inputs and host outputs
```

## Hosts

```text
desktop       NixOS graphical host
mbp-personal  Personal nix-darwin host
pi5-server    Raspberry Pi Home Assistant server
pi5-kiosk     Raspberry Pi kiosk host
```

## Commands

Build the desktop configuration:

```sh
nix build .#nixosConfigurations.desktop.config.system.build.toplevel
```

Apply NixOS configuration:

```sh
sudo nixos-rebuild switch --flake .#desktop
```

Apply nix-darwin configuration:

```sh
darwin-rebuild switch --flake .#mbp-personal
```

Build the flake checks:

```sh
nix flake check
```
