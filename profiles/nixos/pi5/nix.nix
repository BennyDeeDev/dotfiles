{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [ "benjamin" ];

  system.stateVersion = "26.05";
}
