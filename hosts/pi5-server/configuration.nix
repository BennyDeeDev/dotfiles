{ pkgs, ... }:

let
  server = (import ../../profiles/server.nix).nixos;
in

{
  imports = [
    server
    ./home-assistant.nix
  ];

  networking.hostName = "pi5-server";

  boot.kernelPackages = pkgs.linuxPackages;
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };
  nix.settings.trusted-users = [ "benjamin" ];
  system.stateVersion = "26.05";

  users.users.benjamin.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHW2qr7cup1ALuIpnhUoJP8dLjv/yhGfuh/1Vni2lSbd"
  ];

  # Firewall disabled temporarily
  networking.firewall.enable = false;

  host.nas = {
    shares = [
      "Homelab"
      "Restic"
    ];
  };

  sops.defaultSopsFile = ../../secrets/pi5-server.yaml;
}
