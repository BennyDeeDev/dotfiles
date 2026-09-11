inputs@{
  ...
}:

let
  profiles = import ../../profiles inputs;
in
{
  homeManager =
    { ... }:
    {
      imports = [
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
