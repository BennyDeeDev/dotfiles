{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    age-plugin-yubikey
    sops
    yubikey-manager
  ];

  sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  sops.age.generateKey = true;

  home.file."${config.xdg.configHome}/sops/age/identity.txt".text =
    "AGE-PLUGIN-YUBIKEY-17Z2J5Q5Z709P64S7VFQZT";

  home.sessionVariables.SOPS_AGE_KEY_FILE = "${config.xdg.configHome}/sops/age/identity.txt";
}
