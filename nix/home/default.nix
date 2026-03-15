{ pkgs, ... }:

{
  imports = [
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
    rsync
    unzip
    imagemagick
    just
    yt-dlp

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
    liberation_ttf
  ];

  programs.home-manager.enable = true;
}
