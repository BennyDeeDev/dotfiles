inputs@{
  home-manager,
  plasma-manager,
  ...
}:

let
  homeManagerModule = import ../../modules/home-manager.nix { inherit home-manager; };
  nixModule = import ../../modules/nix.nix;
  plasma = import ./plasma { inherit plasma-manager; };
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
        plasma.homeManager
      ];

      home = {
        username = "deck";
        homeDirectory = "/home/deck";
        stateVersion = "26.05";
      };

    };
}
