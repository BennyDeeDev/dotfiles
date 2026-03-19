{ pkgs, config, ... }:

{
  imports = [ ./ghostty.nix ./vscode.nix ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Pictures";
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    desktop = "${config.home.homeDirectory}/Desktop";
    templates = "${config.home.homeDirectory}/Templates";
    publicShare = "${config.home.homeDirectory}/Public";
    extraConfig = {
      REPOS = "${config.home.homeDirectory}/Repos";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  home.packages = with pkgs; [
    # Media & audio
    playerctl
    pamixer
    pavucontrol
    libnotify
    ffmpegthumbnailer
    obs-studio
    celluloid

    # Network & bluetooth
    bluetui
    impala
    wiremix

    # File management
    nautilus
    baobab
    gnome-disk-utility
    gvfs

    # GNOME apps
    gnome-calculator
    gnome-characters
    gnome-font-viewer
    gnome-logs
    gnome-system-monitor
    loupe
    papers

    # Virtualization
    virt-manager

    # Themes & fonts
    gnome-themes-extra
    yaru-theme
    glib
    gsettings-desktop-schemas

    # Utilities
    xdg-utils
    xdg-terminal-exec
    sshpass
    libsecret
    keymapp
    asdbctl

    # Editors
    vscode

    # Browsers
    brave

    # Personal
    keepassxc
    spotify
    localsend
  ];
}
