{
  homeManager =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = [ pkgs.steam-rom-manager ];

      home.file = {
        ".config/steam-rom-manager/userData/userConfigurations.json".source =
          config.lib.file.mkOutOfStoreSymlink ../../../files/gaming/steam-rom-manager/userConfigurations.json;
        ".config/steam-rom-manager/userData/userSettings.json".source =
          config.lib.file.mkOutOfStoreSymlink ../../../files/gaming/steam-rom-manager/userSettings.json;
        ".config/steam-rom-manager/userData/manifests".source =
          ../../../files/gaming/steam-rom-manager/manifests;
      };

      home.activation.steamRomManagerBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        sentinel="$HOME/.local/share/steam-rom-manager/bootstrapped"
        if [[ ! -f $sentinel ]]; then
          ${lib.getExe' pkgs.procps "pkill"} steam || true
          ${lib.getExe pkgs.steam-rom-manager} add
          mkdir -p "$(dirname $sentinel)"
          touch "$sentinel"
        fi
      '';
    };
}
