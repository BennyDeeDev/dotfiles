{
  home-manager,
  lanzaboote,
  noctalia,
  noctalia-greeter,
  nixos-hardware,
  sops-nix,
  ...
}:

{
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
  pi5Graphical = import ./pi5-graphical { inherit nixos-hardware; };
  terminal = import ./terminal;
}
