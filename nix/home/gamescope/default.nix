{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gamescope
    mangohud
    liberation_ttf
    wqy_zenhei
    pkgsi686Linux.fontconfig
  ];
}
