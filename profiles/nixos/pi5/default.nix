{
  imports = [
    ../../../modules/nixos/sops.nix
    ./kernel.nix
    ./storage.nix
    ./ssh.nix
    ./user.nix
    ./locale.nix
    ./packages.nix
    ./nix.nix
  ];
}
