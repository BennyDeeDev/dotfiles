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
    lazygit
    lazydocker
    docker-compose
    gh
    prettier
    opencode

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

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "Hack Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  xdg.configFile."opencode/opencode.json".source = ../../opencode/opencode.json;
  xdg.configFile."opencode/AGENTS.md".source = ../../opencode/AGENTS.md;

  programs.home-manager.enable = true;
}
