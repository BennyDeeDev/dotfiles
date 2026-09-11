{
  home-manager,
  lanzaboote,
  noctalia,
  noctalia-greeter,
  sops-nix,
  ...
}:

{
  apps = import ./apps;
  nixos = import ./nixos { inherit sops-nix; };
  desktop = import ./desktop {
    inherit
      home-manager
      noctalia
      noctalia-greeter
      ;
    inherit lanzaboote;
  };
  macos = import ./macos { inherit home-manager; };
  pi5 = import ./pi5;
  terminal = import ./terminal;
}
