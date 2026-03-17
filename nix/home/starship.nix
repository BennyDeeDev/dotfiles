{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
  };
  
  xdg.configFile."starship.toml".source = ../../starship/starship.toml;
}

