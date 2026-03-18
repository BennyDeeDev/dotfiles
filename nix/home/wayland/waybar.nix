{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ../../../waybar/config.jsonc;
    "waybar/style.css".source = ../../../waybar/style.css;
  };
}
