{ pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/mutter" = {
          experimental-features = [
            "autoclose-xwayland"
            "xwayland-native-scaling"
          ];
        };
        "org/gnome/desktop/interface" = {
          enable-animations = false;
        };
      };
    }
  ];
}
