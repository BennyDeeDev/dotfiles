{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
  };

  home.sessionVariables.STARSHIP_CONFIG = lib.mkForce "$HOME/.config/omarchy/current/theme/starship.toml";
}

