{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "Hack Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  home.packages = with pkgs; [
    # Media & audio
    playerctl
    pamixer
    libnotify
    ffmpegthumbnailer
    ffmpeg
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

    # Gaming
    gamescope
    mangohud

    # Virtualization
    virt-manager

    # Themes & fonts
    gnome-themes-extra
    yaru-theme
    wqy-zenhei

    # Utilities
    xdg-utils
    xdg-terminal-exec
    xmlstarlet
    sshpass
    libsecret

    # Editors
    vscode

    # Browsers
    brave

    # Personal
    keepassxc
    localsend
  ];
}
