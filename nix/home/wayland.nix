{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    mako
    swayosd
    swaybg
    grim
    slurp
    satty
    hyprpicker
    hyprsunset
    hypridle
    hyprlock
    xwayland-satellite
    uwsm
    networkmanagerapplet
    walker
    elephant
  ];
}
