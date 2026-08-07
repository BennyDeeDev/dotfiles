{ ... }:

{
  imports = [ ../../modules/pi5.nix ];

  networking.hostName = "pi5-kiosk";

  # TODO: kiosk display / browser config
}
