{ pkgs, ... }:

{
  imports = [
    ../../system/base.nix
    ../../system/desktop.nix
    ../../system/kde.nix
    ../../system/nas.nix
    ./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  boot.supportedFilesystems = [ "btrfs" ];

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

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # uwsm must be in plasmalogin's PATH for TryExec=uwsm in hyprland-uwsm.desktop to succeed
  systemd.services.plasmalogin.path = [ pkgs.uwsm ];

  # plasmalogin daemon has no XDG_DATA_DIRS so QStandardPaths can't find non-Plasma session files
  systemd.services.plasmalogin.environment.XDG_DATA_DIRS = "/run/current-system/sw/share";

  # TODO: remove once nixos is stable
  fileSystems."/mnt/bazzite" = {
    device = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_1TB_S7HDNJ0Y413952T-part3";
    fsType = "btrfs";
    options = [
      "ro"
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
      ../../home/kde
    ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
