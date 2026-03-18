{ omarchy, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Adwaita"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];
      xwayland.force_zero_scaling = true;
      ecosystem.no_update_news = true;
    };
    extraConfig = ''
      source = ~/.local/share/omarchy/default/hypr/looknfeel.conf
      source = ~/.local/share/omarchy/default/hypr/windows.conf
      source = ~/.config/omarchy/current/theme/hyprland.conf

      source = ${../../../hypr/monitors.conf}
      source = ${../../../hypr/input.conf}
      source = ${../../../hypr/bindings.conf}
      source = ${../../../hypr/looknfeel.conf}
      source = ${../../../hypr/workspaces.conf}
      source = ${../../../hypr/autostart.conf}
    '';
  };
}
