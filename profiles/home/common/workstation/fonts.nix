{ pkgs, ... }:

{
  home.packages = with pkgs; [
    inter
    fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
  ];
}
