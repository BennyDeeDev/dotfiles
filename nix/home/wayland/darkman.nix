{ ... }:

{
  services.darkman = {
    enable = true;
    settings = {
      lat = 51.514244;
      lng = 7.468429;
    };
    lightModeScripts.omarchy = ''
      export PATH="/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.local/share/omarchy/bin"
      export OMARCHY_PATH="$HOME/.local/share/omarchy"
      export WAYLAND_DISPLAY=$(systemctl --user show-environment | grep '^WAYLAND_DISPLAY=' | cut -d= -f2)
      export HYPRLAND_INSTANCE_SIGNATURE=$(systemctl --user show-environment | grep '^HYPRLAND_INSTANCE_SIGNATURE=' | cut -d= -f2)
      omarchy-theme-set catppuccin-latte-extended
      asdbctl set 40
    '';
    darkModeScripts.omarchy = ''
      export PATH="/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.local/share/omarchy/bin"
      export OMARCHY_PATH="$HOME/.local/share/omarchy"
      export WAYLAND_DISPLAY=$(systemctl --user show-environment | grep '^WAYLAND_DISPLAY=' | cut -d= -f2)
      export HYPRLAND_INSTANCE_SIGNATURE=$(systemctl --user show-environment | grep '^HYPRLAND_INSTANCE_SIGNATURE=' | cut -d= -f2)
      omarchy-theme-set catppuccin-extended
      asdbctl set 20
    '';
  };
}
