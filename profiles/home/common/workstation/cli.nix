{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    podman
    gh
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
  ];
}
