inputs@{ ... }:

{
  nixos =
    { lib, pkgs, ... }:
    let
      rpiKernelFile = "${inputs.nixos-hardware.outPath}/raspberry-pi/common/kernel.nix";
      baseKernel = pkgs.callPackage rpiKernelFile {
        rpiVersion = 5;
      };
      rpiKernel4k = pkgs.callPackage rpiKernelFile {
        rpiVersion = 5;
        argsOverride = {
          structuredExtraConfig = baseKernel.structuredExtraConfig // {
            ARM64_4K_PAGES = lib.mkForce lib.kernel.yes;
            ARM64_16K_PAGES = lib.mkForce lib.kernel.no;
            ARM64_64K_PAGES = lib.mkForce lib.kernel.no;
          };
        };
      };
    in
    {
      nixpkgs.overlays = [ (import ../../overlays/execline-cross.nix) ];
      networking.hostName = "pi5-tv";
      system.stateVersion = "26.05";
      hardware.raspberry-pi.firmware = {
        enable = true;
        uboot.enable = true;
      };
      fileSystems."/boot/firmware" = {
        device = "/dev/disk/by-label/FIRMWARE";
        fsType = "vfat";
      };

      # linux-rpi does not provide tpm-crb, but NixOS systemd-initrd
      # assumes it exists on aarch64 when TPM2 support is enabled.
      # https://github.com/NixOS/nixpkgs/issues/344963
      # https://github.com/NixOS/nixpkgs/pull/346547
      boot.initrd.systemd.tpm2.enable = false;
      boot.kernelParams = [ "video=HDMI-A-1:1920x1080@60D" ];
      boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor rpiKernel4k);
    };
}
