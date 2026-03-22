{ pkgs, ... }:

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
  boot.supportedFilesystems = [ "cifs" ];
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/mnt/nas/homelab" = nasMount "Homelab";
  fileSystems."/mnt/nas/benjamin" = nasMount "Benjamin";
  fileSystems."/mnt/nas/ludusavi" = nasMount "Ludusavi";
}
