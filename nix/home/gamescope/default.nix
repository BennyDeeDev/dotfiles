{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    lsfg-vk
    liberation_ttf
    wqy_zenhei
    pkgsi686Linux.fontconfig
  ];

  services.flatpak.packages = [
    "io.github.ryubing.Ryujinx"
    "com.usebottles.bottles"
  ];

  services.flatpak.overrides = {
    "io.github.ryubing.Ryujinx".Context = {
      filesystems = [ "~/Games/Switch:rw" "xdg-config/Ryujinx:rw" ];
      shared = [ "!network" ];
    };
    "com.usebottles.bottles".Context = {
      filesystems = [ "~/Games/Bottles:rw" "xdg-data/applications:rw" ];
      shared = [ "!network" ];
    };
  };

  xdg.configFile."lsfg-vk/conf.toml".source = ../../../gamescope/lsfg-vk.toml;
}
