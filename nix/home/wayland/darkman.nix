{ ... }:

{
  services.darkman = {
    enable = true;
    settings = {
      lat = 51.514244;
      lng = 7.468429;
    };
    lightModeScripts.omarchy = ''
      $HOME/.local/share/omarchy/bin/omarchy-theme-set catppuccin-latte-extended
      asdbctl set 30
    '';
    darkModeScripts.omarchy = ''
      $HOME/.local/share/omarchy/bin/omarchy-theme-set catppuccin-extended
      asdbctl set 20
    '';
  };
}
