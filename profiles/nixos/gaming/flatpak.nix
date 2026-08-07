{ nix-flatpak, ... }:

{
  imports = [ nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak.enable = true;
}
