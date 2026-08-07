{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    keepassxc
    spotify
    vscode
  ];
}
