{ ... }:

{
  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = ../../starship/starship.toml;
}

