{ ... }:

{
  imports = [
    ../../system/base.nix
    ../../system/desktop.nix
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

  programs.hyprland.enable = true;

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  virtualisation.libvirtd.enable = true;

  home-manager.users.benjamin = {
    imports = [ ../../home ../../home/linux.nix ../../home/wayland ../../home/gamescope ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
