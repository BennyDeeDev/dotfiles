{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    omarchy = {
      url = "github:basecamp/omarchy/master";
      flake = false;
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      omarchy,
      nix-flatpak,
      disko,
      plasma-manager,
      ...
    }:
    let
      dotfiles = "/home/benjamin/Repos/dotfiles";
      homeManagerModule = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit omarchy nix-flatpak dotfiles; };
      };
    in
    {
      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nix/hosts/vm
            home-manager.nixosModules.home-manager
            homeManagerModule
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nix/hosts/desktop
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            homeManagerModule
            nix-flatpak.nixosModules.nix-flatpak
            { home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ]; }
          ];
        };
      };
    };
}
