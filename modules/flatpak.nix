{
  nixos = { nix-flatpak, ... }: {
    imports = [ nix-flatpak.nixosModules.nix-flatpak ];
    services.flatpak.enable = true;
  };

  homeManager = { nix-flatpak, ... }: {
    imports = [ nix-flatpak.homeManagerModules.nix-flatpak ];
    services.flatpak.update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
