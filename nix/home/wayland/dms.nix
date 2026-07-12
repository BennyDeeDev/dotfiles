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

  xdg.configFile."dms/wallpapers/dark.png".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wallpapers/dark.png";
  xdg.configFile."dms/wallpapers/light.png".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wallpapers/light.png";
  xdg.configFile."DankMaterialShell/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dms/settings.json";

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # Core features
    enableSystemMonitoring = true;
    dgop.package = dgop.packages.${pkgs.system}.default;

    enableVPN = false;
    enableDynamicTheming = false;
    enableAudioWavelength = true;
    enableCalendarEvents = true;

    plugins = { };
  };
}
