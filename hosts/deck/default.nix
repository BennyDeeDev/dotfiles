inputs@{
  home-manager,
  ...
}:

let
  homeManagerModule = import ../../modules/home-manager.nix { inherit home-manager; };
  nixModule = import ../../modules/nix.nix;
  profiles = import ../../profiles inputs;
in
{
  homeManager =
    { ... }:
    {
      imports = [
        homeManagerModule.homeManager
        nixModule.homeManager
        profiles.apps.homeManager
        profiles.terminal.homeManager
      ];

      home = {
        username = "deck";
        homeDirectory = "/home/deck";
        stateVersion = "26.05";
      };

    };
}
