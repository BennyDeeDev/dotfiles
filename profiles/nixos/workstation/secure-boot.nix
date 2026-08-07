{ lib, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.sbctl ];

  # Lanzaboote replaces systemd-boot and signs boot artifacts.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 10;
    autoGenerateKeys.enable = true;
    autoEnrollKeys = {
      enable = true;
      autoReboot = true;
    };
  };
}
