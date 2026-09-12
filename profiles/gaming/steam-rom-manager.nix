{
  homeManager =
    {
      config,
      flakeHost,
      lib,
      nixConfig,
      pkgs,
      ...
    }:
    let
      manifestDir = ../../files/gaming/steam-rom-manager/manifests;
    in
    {
      home.packages = [ pkgs.steam-rom-manager ];

      home.file = {
        ".config/steam-rom-manager/userData/userConfigurations.json".source =
          config.lib.file.mkOutOfStoreSymlink "${nixConfig}/files/gaming/steam-rom-manager/userConfigurations.json";
      }
      // lib.optionalAttrs (flakeHost == "desktop") {
        ".config/steam-rom-manager/userData/manifests/media/media-apps.json".source =
          "${manifestDir}/media/media-apps.json";
      };
    };
}
