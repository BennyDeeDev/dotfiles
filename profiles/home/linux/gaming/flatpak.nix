{ nix-flatpak, ... }:

{
  imports = [ nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
