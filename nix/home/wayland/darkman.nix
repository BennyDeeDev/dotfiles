{ ... }:

{
  services.darkman = {
    enable = true;
    settings = {
      lat = 51.514244;
      lng = 7.468429;
    };
    lightModeScripts.omarchy = ''
      bash $HOME/.local/share/omarchy/bin/omarchy-theme-set catppuccin-latte-extended
      /etc/profiles/per-user/$USER/bin/asdbctl set 40
    '';
    darkModeScripts.omarchy = ''
      bash $HOME/.local/share/omarchy/bin/omarchy-theme-set catppuccin-extended
      /etc/profiles/per-user/$USER/bin/asdbctl set 20
    '';
  };
}
