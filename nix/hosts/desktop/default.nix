{ ... }:

{
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  boot.supportedFilesystems = [ "btrfs" ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable32Bit = true;

  home-manager.users.benjamin = {
    imports = [ ../../home ../../home/omarchy.nix ../../home/wayland.nix ../../home/mako.nix ../../home/ghostty.nix ../../home/waybar.nix ../../home/hyprland.nix ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
