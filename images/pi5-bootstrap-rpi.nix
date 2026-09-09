inputs:

let
  profiles = import ../profiles inputs;
in
{
  nixos =
    { lib, modulesPath, ... }:
    {
      imports = [
        profiles.nixos.nixos
        profiles.pi5.nixos
        inputs.nixos-hardware.nixosModules.raspberry-pi-5
        "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
      ];

      hardware.enableAllHardware = lib.mkForce false;
      hardware.raspberry-pi.firmware.uboot.enable = true;

      # linux-rpi does not provide tpm-crb, but NixOS systemd-initrd
      # assumes it exists on aarch64 when TPM2 support is enabled.
      # https://github.com/NixOS/nixpkgs/issues/344963
      # https://github.com/NixOS/nixpkgs/pull/346547
      boot.initrd.systemd.tpm2.enable = false;

      networking.hostName = "pi5-bootstrap";
      security.sudo.wheelNeedsPassword = false;
    };
}
