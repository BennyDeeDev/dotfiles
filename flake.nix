{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      dms,
      dgop,
      dms-plugin-registry,
      nix-flatpak,
      disko,
      lanzaboote,
      sops-nix,
      nixos-hardware,
      ...
    }:
    let
      dotfiles = "/home/benjamin/Repos/dotfiles";
      homeManagerModule = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
        home-manager.extraSpecialArgs = {
          inherit
            dms
            dgop
            dms-plugin-registry
            nix-flatpak
            dotfiles
            ;
        };
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
            lanzaboote.nixosModules.lanzaboote
            ./nix/hosts/desktop
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            homeManagerModule
            nix-flatpak.nixosModules.nix-flatpak
            sops-nix.nixosModules.sops
          ];
        };
        pi5-server = nixpkgs-unstable.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-5
            ./nix/hosts/pi5-server
          ];
        };
        pi5-kiosk = nixpkgs-unstable.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nixos-hardware.nixosModules.raspberry-pi-5
            ./nix/hosts/pi5-kiosk
          ];
        };
      };
      images.pi5-bootstrap =
        (nixpkgs-unstable.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [ ./nix/images/pi5-bootstrap.nix ];
        }).config.system.build.sdImage;
    };
}
