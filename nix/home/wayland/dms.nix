{
  config,
  pkgs,
  dms,
  dgop,
  dms-plugin-registry,
  dotfiles,
  ...
}:
{
  imports = [
    dms.homeModules.dank-material-shell
    dms-plugin-registry.nixosModules.default
  ];

  xdg.configFile."DankMaterialShell/themes/catppuccin.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dms-themes/catppuccin.json";

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    dgop.package = dgop.packages.${pkgs.system}.default;

    enableVPN = false; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)

    settings = import ./dms-settings.nix { inherit config; };

    plugins = { };
  };
}
