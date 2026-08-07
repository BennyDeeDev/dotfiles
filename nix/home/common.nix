{ pkgs, ... }:

{
  imports = [
    ./devops.nix
    ./direnv.nix
    ./git.nix
    ./ghostty.nix
    ./nvim.nix
    ./zsh.nix
    ./starship.nix
    ./opencode.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    # Languages & development
    lazygit
    podman
    gh

    # Applications
    brave
    keepassxc
    spotify
    vscode
    
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
