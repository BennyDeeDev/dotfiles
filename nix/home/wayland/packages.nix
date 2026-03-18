{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    swaybg
    grim
    slurp
    satty
    hyprpicker
    hyprsunset
    hyprlock
    xwayland-satellite
    uwsm
  ];
}
