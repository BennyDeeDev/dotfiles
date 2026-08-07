{ ... }:

{
  imports = [
    ./flatpak.nix
    ./packages.nix
    ./lsfg.nix
    ./ryujinx.nix
    ./bottles.nix
    ./steam-rom-manager.nix
    ./ludusavi.nix
    ./rclone.nix
  ];
}
