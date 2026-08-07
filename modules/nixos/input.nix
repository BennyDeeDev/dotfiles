{ pkgs, ... }:

{
  hardware.keyboard.zsa.enable = true;
  services.udev.packages = [ pkgs.asdbctl ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };
}
