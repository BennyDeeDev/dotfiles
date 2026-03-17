{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    liberation_ttf
    wqy_zenhei
    pkgsi686Linux.fontconfig
  ];
}
