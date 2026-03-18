{ pkgs, nix-flatpak, ... }:

{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
    ./git.nix
    ./zsh.nix
    ./starship.nix
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Editors & dev
    neovim
    lazygit
    lazydocker
    docker-compose
    gh
    prettier

    # CLI tools
    eza
    bat
    ripgrep
    fd
    btop
    fastfetch
    jq
    yq-go
    xq
    tree
    tldr
    wget
    watch
    unzip

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "Hack Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.home-manager.enable = true;
}
