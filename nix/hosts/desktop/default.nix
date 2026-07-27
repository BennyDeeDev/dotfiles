{ pkgs, lib, ... }:

let
  nasMount = share: {
    fsType = "cifs";
    device = "//192.168.178.254/${share}";
    options = [
      "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s"
      "credentials=/etc/nixos/smb-secrets"
      "uid=1000,gid=100"
    ];
  };
in
{
  imports = [
    ../../system/base.nix
    ../../system/desktop.nix
    ./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  environment.systemPackages = with pkgs; [
    sbctl
    cifs-utils
  ];

  # Lanzaboote replaces systemd-boot and signs boot artifacts.
  # Keys are provisioned at /var/lib/sbctl via `sudo sbctl create-keys`.
  boot = {
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      configurationLimit = 10;
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  boot.supportedFilesystems = [
    "btrfs"
    "cifs"
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
      FastConnectable = true;
    };
    Policy.AutoEnable = true;
  };
  services.blueman.enable = true;

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.amdgpu.initrd.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services.displayManager.defaultSession = "niri";

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

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  virtualisation.libvirtd.enable = true;

  home-manager.users.benjamin = {
    imports = [
      ../../home
      ../../home/linux.nix
      ../../home/wayland
      ../../home/gamescope
    ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };

  fileSystems."/mnt/nas/homelab" = nasMount "Homelab";
  fileSystems."/mnt/nas/benjamin" = nasMount "Benjamin";
  fileSystems."/mnt/nas/ludusavi" = nasMount "Ludusavi";
}
