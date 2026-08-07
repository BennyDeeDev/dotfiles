let
  flatpak = import ../modules/flatpak.nix;
  gamescope = import ../modules/gamescope.nix;
  ryujinx = import ../modules/ryujinx.nix;
  bottles = import ../modules/bottles.nix;
  lsfg = import ../modules/lsfg.nix;
  steamRomManager = import ../modules/steam-rom-manager.nix;
  ludusavi = import ../modules/ludusavi.nix;
  rclone = import ../modules/rclone.nix;
in
{
  nixos = {
    imports = [
      flatpak.nixos
      gamescope.nixos
    ];
  };

  homeManager = {
    linux = {
      imports = [
        flatpak.homeManager
        gamescope.homeManager
        ryujinx.homeManager
        bottles.homeManager
        lsfg.homeManager
        steamRomManager.homeManager
        ludusavi.homeManager
        rclone.homeManager
      ];
    };
  };
}
