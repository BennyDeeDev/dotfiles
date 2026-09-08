inputs:

let
  profiles = import ../profiles inputs;
in
{
  nixos =
    { modulesPath, pkgs, ... }:
    {
      imports = [
        profiles.nixos.nixos
        profiles.pi5.nixos
        "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
      ];

      boot.kernelPackages = pkgs.linuxPackages;

      networking.hostName = "pi5-bootstrap";
      security.sudo.wheelNeedsPassword = false;
    };
}
