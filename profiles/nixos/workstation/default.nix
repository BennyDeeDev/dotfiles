{
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./sudo.nix
    ./services.nix
    ./user.nix
    ./desktop.nix
    ./secure-boot.nix
    ./storage.nix
    ./virtualisation.nix
    ../../../modules/nixos/sops.nix
  ];
}
