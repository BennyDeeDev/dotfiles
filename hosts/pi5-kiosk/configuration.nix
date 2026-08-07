{ ... }:

{
  imports = [ ../../profiles/nixos/pi5 ];

  networking.hostName = "pi5-kiosk";

  # TODO: kiosk display / browser config
}
