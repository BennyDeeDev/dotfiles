{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    lsfg-vk
    liberation_ttf
    wqy_zenhei
    pkgsi686Linux.fontconfig
  ];
}
