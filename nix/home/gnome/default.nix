{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    gnomeExtensions.just-perfection
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.auto-move-windows
    gnomeExtensions.dash-to-dock
  ];

  xdg.configFile."autostart/brave.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Brave Browser
    Exec=brave
    X-GNOME-Autostart-enabled=true
  '';

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
      };

      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "compose:ralt" ];
      };

      "org/gnome/desktop/peripherals/keyboard" = {
        repeat-interval = lib.hm.gvariant.mkUint32 40;
        delay = lib.hm.gvariant.mkUint32 150;
      };

      "org/gnome/desktop/peripherals/mouse" = {
        speed = 0;
        accel-profile = "flat";
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Control>q" ];
        switch-to-workspace-1 = [ "F1" ];
        switch-to-workspace-2 = [ "F2" ];
        switch-to-workspace-3 = [ "F3" ];
        switch-to-workspace-4 = [ "F4" ];
        switch-to-workspace-5 = [ "F5" ];
        switch-to-workspace-6 = [ "F6" ];
        switch-to-workspace-7 = [ "F7" ];
        switch-to-workspace-8 = [ "F8" ];
        switch-to-workspace-9 = [ "F9" ];
        switch-to-workspace-10 = [ "F10" ];
        move-to-workspace-1 = [ "<Shift>F1" ];
        move-to-workspace-2 = [ "<Shift>F2" ];
        move-to-workspace-3 = [ "<Shift>F3" ];
        move-to-workspace-4 = [ "<Shift>F4" ];
        move-to-workspace-5 = [ "<Shift>F5" ];
        move-to-workspace-6 = [ "<Shift>F6" ];
        move-to-workspace-7 = [ "<Shift>F7" ];
        move-to-workspace-8 = [ "<Shift>F8" ];
        move-to-workspace-9 = [ "<Shift>F9" ];
        move-to-workspace-10 = [ "<Shift>F10" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        screensaver = [ "<Control><Shift>l" ];
        logout = [ "<Control><Shift>q" ];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "ghostty";
        binding = "<Control><Shift>t";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "File manager";
        command = "nautilus --new-window";
        binding = "<Control><Shift>f";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "Browser";
        command = "brave";
        binding = "<Control><Shift>b";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        name = "Editor";
        command = "code";
        binding = "<Control><Shift>e";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
        name = "Passwords";
        command = "keepassxc";
        binding = "<Control><Shift>p";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
        name = "Music";
        command = "spotify-launcher";
        binding = "<Control><Shift>s";
      };

      "org/gnome/shell" = {
        enabled-extensions = [
          pkgs.gnomeExtensions.just-perfection.extensionUuid
          pkgs.gnomeExtensions.night-theme-switcher.extensionUuid
          pkgs.gnomeExtensions.auto-move-windows.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "brave-browser.desktop"
          "com.mitchellh.ghostty.desktop"
          "code.desktop"
          "spotify.desktop"
          "keepassxc.desktop"
        ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        autohide = true;
        intellihide = false;
        dock-fixed = false;
        dock-position = "BOTTOM";
        dash-max-icon-size = 48;
        show-favorites = true;
        show-running = true;
      };

      "org/gnome/shell/extensions/auto-move-windows" = {
        application-list = [
          "brave-browser.desktop:1"
          "com.mitchellh.ghostty.desktop:2"
          "spotify.desktop:5"
        ];
      };

      "org/gnome/system/location" = {
        enabled = true;
      };

      "org/gnome/shell/extensions/nightthemeswitcher/color-scheme" = {
        enabled = true;
        day = "default";
        night = "prefer-dark";
      };

      "org/gnome/shell/extensions/just-perfection" = {
        clock-menu-position = 1;
        clock-menu-position-offset = 9;
        startup-status = 0;
        panel-button-padding-size = 1;
        support-notifier-type = 0;
      };

      "org/gnome/shell/keybindings" = {
        toggle-application-view = [ "<Control>space" ];
      };

    };
  };
}
