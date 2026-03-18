{ omarchy, ... }:

{
  services.mako = {
    enable = true;
    extraConfig = ''
      include=${omarchy}/default/mako/core.ini
      include=~/.config/omarchy/current/theme/mako.ini
    '';
  };
}
