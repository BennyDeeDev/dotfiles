{ pkgs, config, ... }:

{
  programs.zsh.enable = true;

  sops.secrets."benjamin-password" = {
    sopsFile = ../../../secrets/common.yaml;
    neededForUsers = true;
  };

  users.users.benjamin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    hashedPasswordFile = config.sops.secrets."benjamin-password".path;
  };
}
