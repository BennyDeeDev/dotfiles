{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./starship.nix
    ./opencode.nix
  ];

  home.packages = with pkgs; [
    # Languages & development
    lazygit
    lazydocker
    gh
    
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
    curl
    wget
    watch
    unzip
    sqlite

    # Fonts
    inter
    fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
  ];

  programs.home-manager.enable = true;
}