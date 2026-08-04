{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = "nix-command flakes";

  security.pam.services.sudo_local.touchIdAuth = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  users.users.benjaminderksen = {
    name = "benjaminderksen";
    home = "/Users/benjaminderksen";
  };

  home-manager.users.benjaminderksen = {
    imports = [ ../../home/darwin.nix ];
    home.stateVersion = "26.05";
    programs.zsh.shellAliases.drs = "sudo darwin-rebuild switch --flake ~/Repos/dotfiles#mbp-personal";
  };

  system.stateVersion = 5;
}