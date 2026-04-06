{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    swaybg
    grim
    slurp
    satty
    hyprpicker
    hyprlock
    xwayland-satellite
    uwsm
  ];
}
