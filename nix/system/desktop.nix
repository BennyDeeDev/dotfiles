{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [
          "hsp_hs"
          "hsp_ag"
          "hfp_hf"
          "hfp_ag"
        ];
      };
    };
  };

  hardware.keyboard.zsa.enable = true;

  services.udev.packages = [ pkgs.asdbctl ];

  programs.dconf.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };

  # Allow users to write brave theme policy (used by omarchy-theme-set)
  systemd.tmpfiles.rules = [
    "d /etc/brave/policies/managed 0775 root users -"
  ];

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
    };
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession = {
      enable = true;
      args = [
        "--mangoapp"
        "--mouse-sensitivity=0.5"
      ];
      steamArgs = [
        "-steamdeck"
        "-steamos3"
      ];
    };
    extraPackages = [
      (pkgs.writeShellScriptBin "steamos-session-select" "steam -shutdown")
      (pkgs.writeShellScriptBin "steamos-update" "exit 7")
      (pkgs.writeShellScriptBin "steamos-select-branch" ''echo "Not applicable for this OS"'')
      (pkgs.writeShellScriptBin "jupiter-biosupdate" ''echo "No updates configured for this bios"; exit 0'')
    ];
  };

}
