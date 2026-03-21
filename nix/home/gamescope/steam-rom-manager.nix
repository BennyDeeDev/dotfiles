{ pkgs, lib, config, dotfiles, ... }:

{
  home.packages = [ pkgs.steam-rom-manager ];

  home.file = {
    ".config/steam-rom-manager/userData/userConfigurations.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/steam-rom-manager/userConfigurations.json";
    ".config/steam-rom-manager/userData/userSettings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/steam-rom-manager/userSettings.json";
  };

  xdg.desktopEntries.steam-rom-manager = {
    name = "Steam ROM Manager";
    exec = "steam-rom-manager --no-sandbox --force-device-scale-factor=2 %U";
    icon = "steam-rom-manager";
    terminal = false;
    type = "Application";
    comment = "An app for managing ROMs in Steam";
    categories = [ "Utility" ];
    settings.StartupWMClass = "Steam ROM Manager";
  };

  home.activation.steamRomManagerBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    sentinel="$HOME/.local/share/steam-rom-manager/bootstrapped"
    if [[ ! -f $sentinel ]]; then
      pkill steam || true
      ${pkgs.steam-rom-manager}/bin/steam-rom-manager add
      mkdir -p "$(dirname $sentinel)"
      touch "$sentinel"
    fi
  '';
}
