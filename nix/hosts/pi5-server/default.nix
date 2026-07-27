{ ... }:

{
  imports = [ ../../modules/pi5.nix ];

  networking.hostName = "pi5-server";

  # TODO: home-assistant, pihole, etc.
}
