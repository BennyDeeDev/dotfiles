{ plasma-manager }:

{
  homeManager = {
    imports = [
      plasma-manager.homeModules.plasma-manager
      ./panels.nix
      ./virtual-desktops.nix
    ];

    programs.plasma.enable = true;
  };
}
