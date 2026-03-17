{ pkgs, ... }:

{
  imports = [ ./ghostty.nix ];

  home.packages = with pkgs; [
    # Media & audio
    playerctl
    pamixer
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
