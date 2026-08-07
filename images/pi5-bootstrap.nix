{ modulesPath, pkgs, ... }:

let
  secrets = (import ../modules/secrets.nix).nixos;
in

{
  imports = [
    ../modules/nixos/base.nix
    ../modules/nixos/ssh.nix
    secrets
    "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
  ];

  networking.hostName = "pi5";

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

  # Passwordless wheel only on the bootstrap image
  security.sudo.wheelNeedsPassword = false;
}
