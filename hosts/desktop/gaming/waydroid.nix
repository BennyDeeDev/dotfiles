{
  nixos =
    { pkgs, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
      environment.systemPackages = [ pkgs.cage ];
    };

  homeManager =
    {
      lib,
      pkgs,
      ...
    }:
    {
      xdg.desktopEntries.waydroid-cage = {
        name = "Waydroid Android TV";
        comment = "Run Waydroid inside Cage";
        exec = "${lib.getExe pkgs.cage} -- ${lib.getExe pkgs.waydroid-nftables} show-full-ui";
        terminal = false;
        categories = [
          "AudioVideo"
          "Player"
        ];
      };
    };
}
