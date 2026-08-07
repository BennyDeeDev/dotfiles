{ modulesPath, ... }:

{
  imports = [
    ../modules/pi5.nix
    "${modulesPath}/installer/sd-card/sd-image-aarch64.nix"
  ];

  networking.hostName = "pi5";

  # Passwordless wheel only on the bootstrap image
  security.sudo.wheelNeedsPassword = false;
}
