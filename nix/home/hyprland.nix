{ omarchy, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ${omarchy}/default/hypr/envs.conf
      source = ${omarchy}/default/hypr/looknfeel.conf
      # source = ${omarchy}/default/hypr/windows.conf
      source = ~/.config/omarchy/current/theme/hyprland.conf

      source = ${../../hypr/monitors.conf}
      source = ${../../hypr/input.conf}
      source = ${../../hypr/bindings.conf}
      source = ${../../hypr/looknfeel.conf}
      source = ${../../hypr/autostart.conf}
    '';
  };

  xdg.configFile = {
    "hypr/hypridle.conf".source = ../../hypr/hypridle.conf;
    "hypr/hyprsunset.conf".source = ../../hypr/hyprsunset.conf;
    "hypr/xdph.conf".source = "${omarchy}/config/hypr/xdph.conf";
    "hypr/hyprlock.conf".source = "${omarchy}/config/hypr/hyprlock.conf";
  };
}
