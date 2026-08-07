{ ... }:

let
  workstation = import ../../profiles/workstation.nix;
  gaming = import ../../profiles/gaming.nix;
in

{
  imports = [
    workstation.nixos
    gaming.nixos
    ./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";
  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  system.stateVersion = "25.11";

  sops.defaultSopsFile = ../../secrets/desktop.yaml;

  home-manager.extraSpecialArgs.dotfiles = "/home/benjamin/Repos/dotfiles";

  host.nas = {
    uid = 1000;
    gid = 100;
    shares = [
      "Homelab"
      "Benjamin"
      "Ludusavi"
      "Restic"
    ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.amdgpu.initrd.enable = true;

  # TODO: remove once nixos is stable
  fileSystems."/mnt/bazzite" = {
    device = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_1TB_S7HDNJ0Y413952T-part3";
    fsType = "btrfs";
    options = [
      "rw"
      "subvol=/home"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "nofail"
    ];
  };

  home-manager.users.benjamin = { dotfiles, ... }: {
    imports = [
      workstation.homeManager.common
      workstation.homeManager.linux
      gaming.homeManager.linux
    ];
    sops.defaultSopsFile = ../../secrets/desktop.yaml;
    dotfiles.sops.yubikeyIdentity = "AGE-PLUGIN-YUBIKEY-17Z2J5Q5Z709P64S7VFQZT";
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    home.stateVersion = "25.11";
    programs.zsh.shellAliases.nrs = "sudo nixos-rebuild switch --flake ${dotfiles}#desktop";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
