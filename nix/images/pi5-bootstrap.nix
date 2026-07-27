{ modulesPath, ... }:

{
  imports = [
    ../modules/pi5.nix
    "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
  ];

  networking.hostName = "pi5";
}
