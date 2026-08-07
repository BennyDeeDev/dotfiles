{ lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.sbctl
    pkgs.efibootmgr
  ];

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

  security.sudo.extraRules = [
    {
      users = [ "benjamin" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/efibootmgr";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
