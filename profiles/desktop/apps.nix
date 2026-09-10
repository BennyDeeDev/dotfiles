{
  nixos =
    { pkgs, ... }:
    {
      programs = {
        localsend = {
          enable = true;
          openFirewall = true;
        };
      };
    };

  homeManager =
    { pkgs, ... }:
    {
      programs = {
        obs-studio.enable = true;
        swappy.enable = true;
      };

      dconf.settings."com/stremio/stremio" = {
        "remember-window-state" = true;
        "window-fullscreen" = true;
      };

      home.packages = with pkgs; [
        adw-gtk3
        baobab
        grim
        libnotify
        stremio-linux-shell
        vacuum-tube
        gnome-themes-extra
        yaru-theme
        glib
        gsettings-desktop-schemas
        showtime
        gnome-calculator
        gnome-characters
        gnome-font-viewer
        gnome-logs
        gnome-system-monitor
        gnome-weather
        loupe
        papers
        rpi-imager
        simple-scan
        system-config-printer
        slurp
        wl-clipboard
        xdg-utils
        xdg-terminal-exec
      ];
    };
}
