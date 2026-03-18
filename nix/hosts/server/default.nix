{ ... }:

{
  imports = [
    ../../system/base.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-server";

  services.openssh.enable = true;

  home-manager.users.benjamin = {
    imports = [ ../../home ];
    home.username = "benjamin";
    home.homeDirectory = "/home/benjamin";
    programs.git.settings.user = {
      name = "BennyDeeDev";
      email = "45900418+BennyDeeDev@users.noreply.github.com";
    };
  };
}
