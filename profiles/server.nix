let
  base = import ../modules/nixos/base.nix;
  ssh = import ../modules/nixos/ssh.nix;
  nas = import ../modules/nixos/nas.nix;
  containerBackup = import ../modules/nixos/container-backup.nix;
  secrets = import ../modules/secrets.nix;
  podman = import ../modules/podman.nix;
in
{
  nixos = {
    imports = [
      base
      ssh
      nas
      containerBackup
      secrets.nixos
      podman.nixos
    ];
  };
}
