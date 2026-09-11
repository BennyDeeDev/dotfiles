inputs@{
  ...
}:

let
  nixModule = import ../../modules/nix.nix;
  profiles = import ../../profiles inputs;
in
{
  homeManager =
    { ... }:
    {
      imports = [
        nixModule.homeManager
        profiles.apps.homeManager
        profiles.terminal.homeManager
      ];

      home = {
        username = "deck";
        homeDirectory = "/home/deck";
        stateVersion = "26.05";
      };

      programs.home-manager.enable = true;
    };
}
