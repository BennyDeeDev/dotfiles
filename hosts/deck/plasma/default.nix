{ plasma-manager }:

{
  homeManager = {
    imports = [
      plasma-manager.homeModules.plasma-manager
      ./appearance.nix
      ./panels.nix
      ./virtual-desktops.nix
      ./window-rules.nix
    ];

    programs.plasma = {
      enable = true;
      overrideConfig = true;
    };
  };
}
