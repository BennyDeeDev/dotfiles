{ ... }:

{
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-vm";

  services.openssh.enable = true;
  services.spice-vdagentd.enable = true;

  home-manager.users.benjamin = {
    imports = [ ../../home ../../home/omarchy.nix ../../home/linux.nix ../../home/wayland.nix ../../home/mako.nix ../../home/ghostty.nix ../../home/waybar.nix ../../home/hyprland.nix ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
